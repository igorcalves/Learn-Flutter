import 'package:flutter/material.dart';
import 'package:learn/View/blocs/user_bloc.dart';
import 'package:learn/View/widgets/profile_widget.dart';
import 'package:learn/domain/entities/user/User.dart';
import 'package:learn/domain/regras_negocio/validations.dart';

class ResidentPage extends StatelessWidget {
  final UserBloc userBloc;
  final TextEditingController cpfController = TextEditingController();

  ResidentPage({
    super.key,
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
            userBloc.clearStreams();
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
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
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
