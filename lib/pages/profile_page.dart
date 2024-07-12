import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "../componentes/my_text_box.dart";
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    String creationDate = '';
    if (user?.metadata.creationTime != null) {
      DateTime creationTime = user!.metadata.creationTime!;
      DateFormat dateFormat = DateFormat('dd-MM-yyyy');
      creationDate = dateFormat.format(creationTime);
    }

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
            title: const Text("Perfil"),
            backgroundColor: Theme.of(context).colorScheme.background,
            elevation: 0,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          ),
        body: ListView(
          children: [
            const SizedBox(height: 50),

            //perfil icone
            const Icon(Icons.person, size: 72),

            const SizedBox(height: 10),

            Text("Meu Perfil",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary)),

            const SizedBox(height: 50),

            Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text(
                  "Informações da Conta",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary),
                )),

            MyTextBox(
              text: user?.email ?? '',
              sectionName: "E-mail",
            ),

            MyTextBox(
              text: creationDate,
              sectionName: "Data de Criação",
            )
          ],
        ));
  }
}