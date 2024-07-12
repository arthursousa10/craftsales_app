import '../pages/register_page.dart';
import '../pages/frogot_passaword.dart';
import '../pages/shop_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../componentes/login_button.dart';
import '../componentes/my_text_field.dart';
import '../componentes/square_tile.dart';


class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(); 

  final passwordController = TextEditingController();

  void singUserIn() async {
    showDialog(
      context: context, 
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      }
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, 
        password: passwordController.text
      );
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const ShopPage())));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage (String message) {
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(title: Text(message));
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //log
                
                Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: Image.network('https://firebasestorage.googleapis.com/v0/b/craftsales-a5fa9.appspot.com/o/icon.jpeg?alt=media&token=68b84b71-7839-4945-9f77-9a6c497fc073',
                  height: 100,
                  width: 100,
                  ),
                ),

                const SizedBox(height: 50),

                Text("Bem vindo, faça seu login",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontSize: 16
                ),
                ),

                const SizedBox(height: 25),

                //camp de usuario
                MyTextField(
                  controller: emailController, 
                  hintText: 'Email', 
                  obscureText: false
                ),
                const SizedBox(height: 10),

                MyTextField(
                  controller: passwordController, 
                  hintText: 'Senha', 
                  obscureText: true
                ),
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context){
                              return ForgotPasswordPage();
                            })
                          );
                        },
                        child: Text('Esqueceu sua senha?',
                        style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                LoginButton(
                  onTap: singUserIn, 
                  text: "Entrar"
                ),

                const SizedBox(height: 25),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text ('ou',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary
                        ),
                        ),
                      ),

                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Ainda não possui uma conta?',
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                           Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) =>
                              const RegisterPage()
                            )
                          );
                        },
                        child: const Text(
                          'Registre-se',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}