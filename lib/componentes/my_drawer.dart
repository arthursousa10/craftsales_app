import 'package:craftsales/componentes/my_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../themes/ligth_mode.dart';
import '../themes/theme_provider.dart';
import '../services/auth_provider.dart';


class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = context.watch<UserProvider>().isAuthenticated;

    final theme = context.watch<ThemeProvider>().themeData;

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            DrawerHeader(
                child: Center(
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/craftsales-a5fa9.appspot.com/o/logo-transparente.png?alt=media&token=c80596db-3fc6-46b0-b5f5-f7e7d70941e5',
                  width: 150, height: 150),
            )),
            const SizedBox(height: 25),
            
            MyListTile(
              icon: Icons.shopping_bag,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/shop_page");
              },
              text: "Produtos"
            ),

            MyListTile(
              icon: Icons.computer_outlined, 
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/note_page');
              }, 
              text: "Notebooks"
            ),

            MyListTile(
              icon: Icons.mouse_outlined, 
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/mouse_page');
              }, 
              text: "Mouses"
            ),
            
            MyListTile(
              icon: Icons.headphones_outlined, 
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/headphone_page');
              }, 
              text: "Fones"
            ),

            MyListTile(
              icon: Icons.devices_other_outlined, 
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/others_page');
              }, 
              text: "Outros"
            ),
            
            MyListTile(
              icon: Icons.shopping_cart_outlined,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/cart_page");
              },
              text: "Carrinho"
              ),

             MyListTile(
              icon: Icons.call, 
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/cont_page');
              }, 
              text: "Contatos"
            ),

            MyListTile(
              icon: Icons.work,
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/company_page');
              },
              text: "Empresa"
            ),

          ]
          ),
          
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: 
            Column(
              children: [
                MyListTile(
                  icon: userId
                  ? Icons.logout
                  : Icons.account_circle_outlined,
                  onTap: ()  {
                    if (userId) {
                      Navigator.pop(context);
                      context.read<UserProvider>().signOut();
                    } else {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/login_page");
                    }
                  },
                  text: userId
                  ? 'Sair'
                  : 'Entrar'
                ),

                MyListTile(
                  text: theme == lightMode 
                  ? 'Modo Escuro' 
                  : 'Modo Claro',

                  icon: theme == lightMode 
                  ? Icons.toggle_off 
                  : Icons.toggle_on,

                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
                  },
                ),
              
              ],
            ),
          )
        ],
      ),
    );
  }
}
