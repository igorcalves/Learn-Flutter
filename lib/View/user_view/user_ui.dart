import 'package:flutter/material.dart';
import 'package:learn/View/blocs/user_bloc.dart';
import 'package:learn/View/pages/residents_page.dart';

class user_ui extends StatelessWidget {
  final UserBloc userBloc;

  const user_ui({
    super.key,
    required this.userBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar Usuarios'),
      ),
      body: ResidentPage(
        userBloc: userBloc,
      ),
    );
  }
}
