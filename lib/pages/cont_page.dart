import '/componentes/my_drawer.dart';
import 'package:flutter/material.dart';

class Contpage extends StatelessWidget {
  const Contpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: const Text('Contatos'),
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.network('https://firebasestorage.googleapis.com/v0/b/craftsales-a5fa9.appspot.com/o/logo-2.png?alt=media&token=0fe18a03-e8e1-4ba1-8255-d2b2e0420e14',
                height: 200,
                width: 200
                ),
              ),

              Text('Craft',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: Text('S a l e s',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Text('Entre em contato conosco',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            const Row(
              children: [
                 Padding(
                   padding: EdgeInsets.all(10.0),
                   child: Text('Suporte com funcionarios das 07h as 18h',
                   style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                    ),
                  ),
                 ),
              ],
            ),

             const Row(
               children: [
                 Padding(
                   padding: EdgeInsets.all(10.0),
                   child: Text('Suporte com IA 24/7 (em desenvolvimento)',
                               style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                               ),
                               ),
                 ),
               ],
             ),

            const SizedBox(height: 25),

            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('numero/whatsapp: (11) 98235-9027',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ],
            ),

            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text('Email: craftsales@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ],
            ),

          ]),
        ));
  }
}
