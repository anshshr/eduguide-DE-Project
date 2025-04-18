import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> get_video_transcript(String videoid) async {
  try {
    var response = await http.get(
      Uri.parse('http://192.168.119.231:8000/get_video_transcript/$videoid'),
    );

    if (response.statusCode == 200) {
      print('response body -->');
      print(response.body);
      var json_response = json.decode(response.body);
      print('json response -->');
      print(json_response.toString());
      print('going to next part');
      return json_response['transcript'];
    } else {
      return '';
    }
  } catch (e) {
    print(e.toString());
    return '';
  }
}
