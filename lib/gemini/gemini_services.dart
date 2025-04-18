// ignore_for_file: unused_local_variable, avoid_print, dead_code, unnecessary_brace_in_string_interps, non_constant_identifier_names, camel_case_types
import 'dart:convert';
import 'package:eduguide/gemini/secrets.dart';
import 'package:http/http.dart' as http;

class gemini_api {
  static Future<Map<String, String>> getheader() async {
    return {'Content-Type': 'application/json'};
  }

  static Future<String> getgeminidata(message) async {
    const String url = "https://api.groq.com/openai/v1/chat/completions";
    print("entered groq");
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },
        body: jsonEncode({
          "model": "llama-3.3-70b-versatile",
          "messages": [
            {
              "role": "user",
              "content":
                  "$message Provide a clear, concise, and language-consistent response ",
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data["choices"][0]["message"]["content"]);
        String ans = data["choices"][0]["message"]["content"];
        return ans;
      } else {
        print("Error: ${response.body}");
        return "error";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
