import 'dart:async';
import 'package:learn/domain/user/User.dart';
import 'package:learn/repository/repository.dart';

class UserBloc {
  final RepositoryImplementing _repository;
  final _userController = StreamController<User?>.broadcast();
  final _userListController = StreamController<List<User?>>.broadcast();

  final _errorController = StreamController<String>.broadcast();

  UserBloc(this._repository);
  Stream<User?> get userStream => _userController.stream;
  Stream<List<User?>> get userListStream => _userListController.stream;

  Stream<String> get errorStream => _errorController.stream;

  void clearStreams() {
    _userListController.sink.add([]);
    _userController.sink.add(null);
    _errorController.sink.add('');
  }

  void getUserByCPF(String cpf) async {
    var response = await _repository.getUserByCPF(cpf);
    if (response.containsKey('error')) {
      _errorController.sink.add(response['error']);
      _userController.sink.add(null);
    } else {
      _userController.sink.add(User.fromJson(response));
      _errorController.sink.add('');
    }
  }

  void getUserByName(String data) async {
    var response = await _repository.getUserByName(data);
    _userListController.sink.add(User.fromJsonList(response));
  }

  void dispose() {
    _userController.close();
    _errorController.close();
  }
}
