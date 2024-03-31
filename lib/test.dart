import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse('http://192.168.56.1:8080/users');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}