import 'package:flutter/material.dart';
import 'package:learn/View/commonViews/InformartionWidget.dart';
import 'package:learn/domain/user/User.dart';

class UserProfileWidget extends StatelessWidget {
  final String name;
  final String cpf;
  final User user;

  const UserProfileWidget(
      {super.key, required this.name, required this.cpf, required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar para a tela de detalhes do usuário
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InformationScreen(
                user), // Substitua "InformationScreen" pelo nome da sua tela de detalhes do usuário
          ),
        );
      },
      child: Row(
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
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'CPF: $cpf',
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
