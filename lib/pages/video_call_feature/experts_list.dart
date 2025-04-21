import 'package:eduguide/pages/video_call_feature/expert_vidoe_call.dart';
import 'package:flutter/material.dart';
import 'package:stream_video_flutter/stream_video_flutter.dart';

class ExpertsList extends StatelessWidget {
  const ExpertsList({super.key});

  @override
  Widget build(BuildContext context) {
    final experts = [
      {
        'name': 'Ravi Kumar',
        'id': 'raviKumar123',
        'specialty': 'Flutter Expert',
      },
      {
        'name': 'Priya Sharma',
        'id': 'priyaSharma456',
        'specialty': 'Dart Expert',
      },
      {
        'name': 'Anil Verma',
        'id': 'anilVerma789',
        'specialty': 'JavaScript Expert',
      },
      {
        'name': 'Sunita Gupta',
        'id': 'sunitaGupta101',
        'specialty': 'Python Expert',
      },
      {
        'name': 'Rajesh Singh',
        'id': 'rajeshSingh202',
        'specialty': 'Java Expert',
      },
      {'name': 'Amit Patel', 'id': 'amitPatel303', 'specialty': 'C++ Expert'},
      {
        'name': 'Neha Mehta',
        'id': 'nehaMehta404',
        'specialty': 'Kotlin Expert',
      },
      {
        'name': 'Vikram Das',
        'id': 'vikramDas505',
        'specialty': 'GoLang Expert',
      },
      {'name': 'Pooja Roy', 'id': 'poojaRoy606', 'specialty': 'Ruby Expert'},
      {'name': 'Arjun Nair', 'id': 'arjunNair707', 'specialty': 'Swift Expert'},
      {'name': 'Kiran Joshi', 'id': 'kiranJoshi808', 'specialty': 'C# Expert'},
      {'name': 'Meera Iyer', 'id': 'meeraIyer909', 'specialty': 'PHP Expert'},
      {
        'name': 'Suresh Reddy',
        'id': 'sureshReddy010',
        'specialty': 'Rust Expert',
      },
      {
        'name': 'Anjali Kapoor',
        'id': 'anjaliKapoor111',
        'specialty': 'TypeScript Expert',
      },
      {
        'name': 'Rohan Malhotra',
        'id': 'rohanMalhotra212',
        'specialty': 'SQL Expert',
      },
    ];

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.blue.shade600,
              Colors.blue.shade900,
              Colors.blue.shade600,
              Colors.blue.shade900,
              Colors.blue.shade600,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'List of Mentors',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: experts.length,
                itemBuilder: (context, index) {
                  final expert = experts[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            expert['name']!,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            expert['specialty']!,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Call ID: ${expert['id']}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () async {
                                var call = StreamVideo.instance.makeCall(
                                  callType: StreamCallType.defaultType(),
                                  id: expert['id']!,
                                );

                                await call.getOrCreate();

                                // Navigate to the video call screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) =>
                                            ExpertVidoeCall(call: call),
                                  ),
                                );
                              },
                              child: const Text("Join Call"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
