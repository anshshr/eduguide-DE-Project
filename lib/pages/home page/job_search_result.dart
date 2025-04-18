// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names, use_super_parameters, unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_null_comparison
import 'package:eduguide/extra_operations/job_api.dart';
import 'package:eduguide/pages/home%20page/jobs_details.dart';
import 'package:flutter/material.dart';

class JobSearchResult extends StatefulWidget {
  final String search_query;

  const JobSearchResult({
    Key? key,
    required this.search_query,
  }) : super(key: key);

  @override
  State<JobSearchResult> createState() => _JobSearchResultState();
}

class _JobSearchResultState extends State<JobSearchResult> {
  bool is_loaded = false;
  List<dynamic> job_data = [];

  @override
  void initState() {
    super.initState();
    get_job_result();
  }

  Future<void> get_job_result() async {
    try {
      List<dynamic> job_result = await get_jobs(widget.search_query);
      setState(() {
        job_data.addAll(job_result);
        is_loaded = true;
      });
    } catch (e) {
      print(e.toString);
      setState(() {
        is_loaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.cyan[100]!,
              Colors.cyan[200]!,
              Colors.cyan[300]!,
              Colors.cyan[400]!,
            ])),
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 20, right: 20),
          child: is_loaded == true
              ? Expanded(
                  child: ListView.builder(
                    itemCount: job_data.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                        shadowColor: Colors.grey,
                        borderOnForeground: true,
                        color: Colors.white,
                        elevation: 10,
                        child: Padding(
                          padding: EdgeInsets.all(13),
                          child: InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "⭐⭐ ${job_data[index]['title']}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                //company name
                                Text(
                                  job_data[index]['company_name'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                //location
                                Text(
                                  job_data[index]['location'],
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                              
                            ),
                            onTap: (){
                               var jobDetails =
                                                  job_data[index];
                                              // String apply_job_link = jobDetails['related_links'] != null && jobDetails['related_links'].isNotEmpty ? jobDetails['related_links'][0]['link'] : 'https://www.google.com/about/careers/applications/jobs/results#!t=jo&jid=127025001&';
                                              String comp_name =
                                                  jobDetails['company_name'];
                                              String desc =
                                                  jobDetails['description'];
                                              String job_location =
                                                  jobDetails['location'];
                                              String job_thumbanil = jobDetails[
                                                              'thumbnail'] !=
                                                          null &&
                                                      jobDetails['thumbnail']
                                                          .isNotEmpty
                                                  ? jobDetails['thumbnail']
                                                  : 'https://cdn5.vectorstock.com/i/1000x1000/33/69/flat-cartoon-huge-letters-making-word-job-banner-vector-26483369.jpg';
                                              String job_title = jobDetails[
                                                              'job_highlights'] !=
                                                          null &&
                                                      jobDetails[
                                                              'job_highlights']
                                                          .isNotEmpty &&
                                                      jobDetails['job_highlights']
                                                              [0]['items'] !=
                                                          null &&
                                                      jobDetails['job_highlights']
                                                              [0]['items']
                                                          .isNotEmpty
                                                  ? jobDetails['job_highlights']
                                                      [0]['items'][0]
                                                  : 'no title specified';

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => JobsDetails(
                                                      company_name:
                                                          comp_name != null && comp_name.isNotEmpty
                                                              ? comp_name
                                                              : 'Not Specified',
                                                      description: desc != null &&
                                                              desc.isNotEmpty
                                                          ? desc
                                                          : 'Not provided',
                                                      location: job_location != null &&
                                                              job_location
                                                                  .isNotEmpty
                                                          ? job_location
                                                          : 'Remote',
                                                      thumbnail_url: job_thumbanil !=
                                                                  null &&
                                                              job_thumbanil
                                                                  .isNotEmpty
                                                          ? job_thumbanil
                                                          : 'https://cdn5.vectorstock.com/i/1000x1000/33/69/flat-cartoon-huge-letters-making-word-job-banner-vector-26483369.jpg',
                                                      title: job_title != null &&
                                                              job_title.isNotEmpty
                                                          ? job_title
                                                          : 'No title specified'),
                                                ),
                                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
