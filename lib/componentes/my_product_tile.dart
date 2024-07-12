import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  
  const MyProductTile({super.key, required this.product});

  void addToCart(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content:  Text("Deseja adicionar esse item ao carrinho?",
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary
        ),
        ),
        actions: [
          //butão cancel
          MaterialButton(
            onPressed: () => Navigator.pop (context),
            child: Text("Cancelar",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            ),
            ),
          ),

          MaterialButton(
            onPressed: () { 
              Navigator.pop(context);

              context.read<Shop>().addToCart(product);
            },
            child: Text("Confirmar",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary
            ),
            ),
          )
        ],
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  child: Image.network(product.imagepath),
                ),
              ),
              const SizedBox(height: 25),

              Text(
                product.name,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$${product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                  ),
                  
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}