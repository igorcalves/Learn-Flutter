import 'dart:async';
import 'dart:convert';

import 'package:learn/repository/repository.dart';

class FakeRepository extends RepositoryImplementing {
  final String _dataBase;
  FakeRepository(this._dataBase);

  @override
  Future<Map<String, dynamic>> getUserByCPF(String cpf) async {
    var userList = jsonDecode(_dataBase);
    for (var user in userList) {
      if (user['cpf'] == cpf) {
        return user;
      }
    }
    return userList;
  }

  @override
  Future<List> getUserByName(String name) async {
    var userList = jsonDecode(_dataBase);
    List<dynamic> users = [];
    for (var user in userList) {
      if (user['name'].toLowerCase().contains(name.toLowerCase())) {
        users.add(user);
      }
    }
    return users;
  }
}
