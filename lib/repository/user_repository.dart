import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {
  
  Future<Map<String, dynamic>> getUserByCPF(String cpf) async {
    try {


      var url = Uri.parse('http://192.168.56.1:8080/users/cpf?cpf=$cpf');
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

 Future<List< dynamic>> getUserName(String data) async {
    try {

      var url = Uri.parse('http://192.168.56.1:8080/users/name?name=$data');
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
       throw Exception ('Erro: $errorMessage');
      }
    } on TimeoutException catch (_) {
      throw Exception ('Tempo limite de conexão excedido');
    } on http.ClientException catch (e) {
      throw Exception ('Erro de conexão: $e');
    } catch (e) {
      throw Exception ('Erro inesperado: $e');
    }
  }


}
