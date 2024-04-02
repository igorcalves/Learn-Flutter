import 'package:flutter/material.dart';
import 'package:learn/View/blocs/user_bloc.dart';
import 'package:learn/View/pages/home_page.dart';
import 'package:learn/repository/repository.dart';

class AppWidget extends StatelessWidget {
  final RepositoryImplementing _repository;
  const AppWidget(this._repository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recuperar Pessoa',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          // ···
          brightness: Brightness.light,
        ),
      ),
      home: MyHomePage(
        userBloc: UserBloc(_repository),
      ),
    );
  }
}
