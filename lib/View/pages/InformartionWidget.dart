import 'package:flutter/material.dart';
import 'package:learn/domain/entities/user/User.dart';

class InformationScreen extends StatelessWidget {
  final User user;

  const InformationScreen(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dados Pessoais"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Coluna para a foto e o nome do usuário
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey,
                    ),
                    child: Icon(
                      Icons.account_circle,
                      size: 50,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 14), // Adiciona espaço entre a foto e o nome
                  Text(
                    user.getFirstNameAndLastName(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(
                user.toString(),
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
