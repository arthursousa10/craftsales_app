import '../componentes/my_button.dart';
import '../models/product.dart';
import '../models/shop.dart';
import 'package:flutter/material.dart';
import '../componentes/my_drawer.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void  removeIFC(BuildContext context, Product product) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: Text('Deseja apagar este item do carrinho?', 
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary
        )
        ),
        actions: [
          //canc
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text ('Cancelar', 
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            )
            ),
          ),
          //conf
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<Shop>().removeFromCart(product);
            },
            child: Text('Confirmar', 
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            )
            ),
          )
        ],
      )
    );
  }

  void payBtnPressed(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: Text('Logo conectaremos esse app a uma solução de pagamento',
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary
        ),
        ),
      )
    );
  }

  //add item cart
  void addITC(BuildContext context, Product product) {
    context.read<Shop>().addToCart(product);
  }

  //remove item cart
  void decreaseITC(BuildContext context, Product product) {
    context.read<Shop>().decrementFromCart(product);
  }

  @override
  Widget build(BuildContext context) {
    final cart =  context.watch<Shop>().cart;
    double totalBill = cart.fold<double>(
      0,((previousValue, element) => previousValue + (element.totalPrice)
    ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Carrinho"),
        actions: [
          IconButton(
            onPressed: ()  => Navigator.pushNamed(context, '/shop_page'), 
            icon: const Icon(Icons.shopping_bag_outlined)
          )
        ],
      ),
      drawer: MyDrawer(),
      
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //list
          Expanded(
            child: cart.isEmpty
            ? const Center(child: Text('Carrinho vazio'))
            : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return ListTile(
                  leading: Image.network(item.imagepath),
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //remove btn
                      IconButton(
                        onPressed: () => removeIFC(context, item), 
                        icon: const Icon(Icons.close)
                      ),

                      //dimunir btn
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: item.quantity >= 2
                        ? () => decreaseITC(context, item)
                        : () => removeIFC(context,item),
                      ),

                      //quant 
                      Text(item.quantity.toString()),

                      //add btn
                      IconButton(
                        onPressed: () => addITC(context, item), 
                        icon: const Icon(Icons.add)
                      )
                    ],
                  ),
                );
              }
            )
          ),

          //btn pag
          Visibility(
            visible: cart.isNotEmpty,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total R\$ ${totalBill.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),

                    MyButton(
                      onTap: () => payBtnPressed(context),
                      child: Text('Pagar',
                      style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}