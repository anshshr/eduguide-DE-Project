// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:eduguide/gemini/secrets.dart';
import 'package:http/http.dart' as http;

Future<dynamic> get_jobs(query) async {
  try {
    var apiKey = serp_api_key;

    String url =
        'https://serpapi.com/search.json?engine=google_jobs&q=$query&hl=en&api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      // print(jsonResponse['jobs_results']);

      //for getting title of jobs
      // print(jsonResponse['jobs_results'][0]['title']);
      // print(jsonResponse['jobs_results'][1]['title']);

      // print(jsonResponse['jobs_results'][1]['company_name']);
      // print(jsonResponse['jobs_results'][1]['location']);
      // print(jsonResponse['jobs_results'][1]['description']);

      // print(jsonResponse['jobs_results'][1]['job_highlights'][0]['title']); // qualifications required
      // print(jsonResponse['jobs_results'][1]['job_highlights'][0]['items'][0]); //requirements

      // print(jsonResponse['jobs_results'][1]['related_links'][0]['link']);  // job link
      // print(jsonResponse['jobs_results'][1]['thumbnail']);  // thumbnail of company

      return jsonResponse['jobs_results'];
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return [
        {
          'error': 'unable to fetch data',
          'status code ': response.statusCode,
        }
      ];
    }
  } catch (e) {
    print(e.toString());
  }
}
