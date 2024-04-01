import 'package:flutter/material.dart';
import 'package:learn/domain/regras_negocio/user_bloc.dart';
import 'package:learn/View/user_view/user_form.dart';

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
