import 'package:condominus_app_android/View/home_page.dart';
import 'package:condominus_app_android/domain/regras_negocio/user_bloc.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recuperar Pessoa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true

      ),
      home: MyHomePage(
        userBloc: UserBloc(),
      ),
    );
  }
}
