import 'package:http/http.dart' as http;

void main() async {
  var url = Uri.parse(
      'https://8080-igorcalves-condominusba-8hnd04t45m2.ws-us110.gitpod.io/users');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
}
