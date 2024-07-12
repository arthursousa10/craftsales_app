import "package:craftsales/componentes/my_drawer.dart";
import "package:flutter/material.dart";


class CompanyPage extends StatelessWidget {
  const CompanyPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sobre a Empresa'),
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        child:  Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Image.network('https://firebasestorage.googleapis.com/v0/b/craftsales-a5fa9.appspot.com/o/logo-2.png?alt=media&token=0fe18a03-e8e1-4ba1-8255-d2b2e0420e14',
                  height: 200,
                  width: 200,
              ),

              Text('Craft',
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Text('S a l e s',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                ' A Craft Sales é uma empresa especializada na venda de produtos voltados para quem trabalha ou estuda na área de tecnologia. Combinamos alta qualidade e preços acessíveis para garantir que nossos clientes tenham acesso às melhores ferramentas e equipamentos, maximizando tanto o desempenho quanto a economia. Nosso compromisso é oferecer soluções que atendam às necessidades tecnológicas, proporcionando uma experiência de compra vantajosa e eficiente. ',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          ],
        )
      )
    );
  }
}