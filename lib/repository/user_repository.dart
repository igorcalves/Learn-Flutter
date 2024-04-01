import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn/repository/repository.dart';

class UserRepository extends RepositoryImplementing {

  final String uri;

  UserRepository(this.uri);


  @override
  Future<Map<String, dynamic>> getUserByCPF(String cpf) async {
    try {
      var url = Uri.parse(
          '$uri/users/cpf?cpf=$cpf');
      var response = await http.get(url).timeout(Duration(seconds: 2));

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        var errorMessage = 'Erro desconhecido';
        try {
          errorMessage = jsonDecode(utf8.decode(response.bodyBytes))["message"];
        } catch (e) {
          errorMessage = 'Erro: ${response.reasonPhrase}';
        }
        return {'error': 'Erro: $errorMessage'};
      }
    } on TimeoutException catch (_) {
      return {'error': 'Tempo limite de conexão excedido'};
    } on http.ClientException catch (e) {
      return {'error': 'Erro: $e'};

    } catch (e) {
      return {'error': 'Erro inesperado: $e'};
    }
  }

  @override
  Future<List<dynamic>> getUserByName(String name) async {
    try {
      var url = Uri.parse(
          '$uri/users/name?name=$name');
      var response = await http.get(url).timeout(Duration(seconds: 2));

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        var errorMessage = '';
        try {
          errorMessage = jsonDecode(utf8.decode(response.bodyBytes))["message"];
        } catch (e) {
          errorMessage = '${response.reasonPhrase}';
        }
        throw Exception(errorMessage);
      }
    } on TimeoutException catch (_) {
      throw Exception('Tempo limite de conexão excedido');
    } on http.ClientException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
