// ignore_for_file: prefer_const_declarations, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> send_email_from_app(String user_name, String sender_email,
    String receiver_email, String user_subject, String user_message) async {
  try {
    final ser_id = 'service_v2yy85k';
    final temp_id = 'template_9xl3egc';
    final user_identity = '67h8DPDVSfWLOpomm';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final response = await http.post(url,
        body: json.encode({
          'service_id': ser_id,
          'template_id': temp_id,
          'user_id': user_identity,
          'template_params': {
            'user_name': user_name,
            'user_message': user_message,
            'user_subject': user_subject,
            'user_email': sender_email,
            'reciever_email': receiver_email
          }
        }),
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        });
    print(response.body);
  } catch (e) {
    print(e.toString());
  }
}
