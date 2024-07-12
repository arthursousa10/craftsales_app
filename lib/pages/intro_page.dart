import 'package:flutter/material.dart';
import '../componentes/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
         Image.network('https://firebasestorage.googleapis.com/v0/b/craftsales-a5fa9.appspot.com/o/logo-transparente.png?alt=media&token=c80596db-3fc6-46b0-b5f5-f7e7d70941e5', 
         width: 300, 
         height: 300),

          const SizedBox(height: 25),

          const SizedBox(height: 25),

          //subtitle
          Text(
            "Produtos de Qualidade para Programadores",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          const SizedBox(height: 25),

          //button
          MyButton(onTap: () => Navigator.pushNamed(context, '/shop_page'),
           child: const Icon(Icons.arrow_forward))
        ],
      )),
    );
  }
}
