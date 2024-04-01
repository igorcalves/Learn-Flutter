import 'package:flutter/material.dart';
import 'package:learn/View/user_view/user_ui.dart';
import '../domain/regras_negocio/user_bloc.dart';

class MyHomePage extends StatelessWidget {
  final UserBloc userBloc;

  const MyHomePage({super.key, required this.userBloc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Principal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => user_ui(
                              userBloc: userBloc,
                            )));
              },
              child: const Text('Buscas Usuarios'),
            ),
  
          ],
        ),
      ),
    );
  }
}
