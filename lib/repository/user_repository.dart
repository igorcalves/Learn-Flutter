import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn/repository/repository.dart';

class UserRepository extends RepositoryImplementing {
  @override
  Future<Map<String, dynamic>> getUserByCPF(String cpf) async {
    try {
      var url = Uri.parse(
          'https://8080-igorcalves-condominusba-8hnd04t45m2.ws-us110.gitpod.io/users/cpf?cpf=$cpf');
      var response = await http.get(url).timeout(Duration(seconds: 2));

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        var errorMessage = 'Erro desconhecido';
        // Tenta decodificar a resposta como JSON
        try {
          errorMessage = jsonDecode(utf8.decode(response.bodyBytes))["message"];
        } catch (e) {
          // Se falhar, usa a mensagem de erro padrão
          errorMessage = 'Erro: ${response.reasonPhrase}';
        }
        return {'error': 'Erro: $errorMessage'};
      }
    } on TimeoutException catch (_) {
      return {'error': 'Tempo limite de conexão excedido'};
    } on http.ClientException catch (e) {
      return {'error': 'Erro de conexão: $e'};
    } catch (e) {
      return {'error': 'Erro inesperado: $e'};
    }
  }

  @override
  Future<List<dynamic>> getUserByName(String cpf) async {
    try {
      var url = Uri.parse(
          'https://8080-igorcalves-condominusba-8hnd04t45m2.ws-us110.gitpod.io/users/name?name=$cpf');
      var response = await http.get(url).timeout(Duration(seconds: 2));

      if (response.statusCode == 200) {
        return jsonDecode(utf8.decode(response.bodyBytes));
      } else {
        var errorMessage = 'Erro desconhecido';
        // Tenta decodificar a resposta como JSON
        try {
          errorMessage = jsonDecode(utf8.decode(response.bodyBytes))["message"];
        } catch (e) {
          // Se falhar, usa a mensagem de erro padrão
          errorMessage = 'Erro: ${response.reasonPhrase}';
        }
        throw Exception('Erro: $errorMessage');
      }
    } on TimeoutException catch (_) {
      throw Exception('Tempo limite de conexão excedido');
    } on http.ClientException catch (e) {
      throw Exception('Erro de conexão: $e');
    } catch (e) {
      throw Exception('Erro inesperado: $e');
    }
  }
}
