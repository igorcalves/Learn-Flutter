import 'package:condominus_app_android/View/user_view/user_form.dart';
import 'package:condominus_app_android/domain/regras_negocio/user_bloc.dart';
import 'package:flutter/material.dart';

class user_ui extends StatelessWidget {
  final UserBloc userBloc;

  const user_ui({super.key, 
    required this.userBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Usuarios'),
      ),
      body: UserForm(
        userBloc: userBloc,
      ),
    );
  }
}
