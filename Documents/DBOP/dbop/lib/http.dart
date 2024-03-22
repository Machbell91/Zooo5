import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> registerUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/api/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 201) {
    // If the user was registered successfully,
    // then parse the JSON.
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 Created response,
    // then throw an exception.
    throw Exception('Failed to register user');
  }
}
