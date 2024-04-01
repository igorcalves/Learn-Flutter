import 'package:flutter/material.dart';
import 'package:learn/View/user_view/user_profile_widget.dart';
import 'package:learn/domain/regras_negocio/validations.dart';
import 'package:learn/domain/user/User.dart';

import '../../domain/regras_negocio/user_bloc.dart';

class UserForm extends StatelessWidget {
  final UserBloc userBloc;
  final TextEditingController cpfController = TextEditingController();

  UserForm({
    required this.userBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: cpfController,
          decoration: InputDecoration(labelText: 'Coloque o nome ou o CPF'),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            userBloc
                .clearStreams(); // Limpa os streams antes de iniciar uma nova pesquisa
            if (cpf_or_name.isCpf(cpfController.text)) {
              userBloc.getUserByCPF(cpfController.text);
            } else {
              userBloc.getUserByName(cpfController.text);
            }
          },
          child: Text('Get User'),
        ),
        SizedBox(height: 20),
        StreamBuilder<List<User?>>(
          key: UniqueKey(),
          stream: userBloc.userListStream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Expanded(
                child: ListView(
                  children: snapshot.data!
                      .map((user) => UserProfileWidget(
                            name: user!.getFirstNameAndLastName(),
                            cpf: user.cpf!,
                            user: user,
                          ))
                      .toList(),
                ),
              );
            } else {
              return StreamBuilder<String>(
                key: UniqueKey(),
                stream: userBloc.errorStream,
                builder: (context, errorSnapshot) {
                  if (errorSnapshot.hasData && errorSnapshot.data!.isNotEmpty) {
                    return Center(
                      child: Text(
                        errorSnapshot.data!,
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              );
            }
          },
        ),
        SizedBox(height: 20),
        StreamBuilder<User?>(
          stream: userBloc.userStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return UserProfileWidget(
                name: snapshot.data!.getFirstNameAndLastName(),
                cpf: snapshot.data!.cpf!,
                user: snapshot.data!,
              );
            } else {
              return StreamBuilder<String>(
                stream: userBloc.errorStream,
                builder: (context, errorSnapshot) {
                  if (errorSnapshot.hasData && errorSnapshot.data!.isNotEmpty) {
                    return Text(
                      errorSnapshot.data!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              );
            }
          },
        ),
      ],
    );
  }
}
