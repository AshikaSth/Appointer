import 'package:appoiter/counselors/appointmentinfopage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TakeCounselDataPage extends StatefulWidget {
  final String appointmentDocID;
  final String counseloremail;

  TakeCounselDataPage({
    required this.appointmentDocID,
    required this.counseloremail,
  });

  @override
  _TakeCounselDataPageState createState() => _TakeCounselDataPageState();
}

class _TakeCounselDataPageState extends State<TakeCounselDataPage> {
  TextEditingController logController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Session Notes',),
            actions: [
              IconButton(
                icon: Icon(Icons.info),
                onPressed: () {
                  // Navigate to the AppointmentInfoPage with the appointmentDocID
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AppointmentInfoPage(
                        appointmentID: widget.appointmentDocID,
                      ),
                    ),
                  );
                },
              ),
            ],
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('appointments')
                    .doc(widget.appointmentDocID)
                    .snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return Center(
                      child: Text('Appointment details not found.'),
                    );
                  }

                  var appointmentData =
                  snapshot.data!.data() as Map<String, dynamic>;
                  var feedbackMap = appointmentData['feedbackMap'];
                  var feedbackList = appointmentData['feedback'];

                  return Column(
                    children: [
                      if (feedbackMap != null)
                        for (var entry in feedbackMap.entries)
                          _buildFeedbackContainer(
                            entry.key,
                            entry.value.toString(),
                          ),
                      // Display data from feedbackMap

                      if (feedbackList != null && feedbackList is List)
                        for (var feedback in feedbackList)
                          _buildFeedbackContainer(
                            feedback['counseloremail'].toString(),
                            feedback['log'].toString(),
                            timestamp: feedback['timestamp'].toDate(),
                          ),
                      // Display data from feedbackList
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [

                Row(
                  children: [

                    Expanded(
                      child: TextField(
                        controller: logController,
                        decoration: InputDecoration(labelText: 'Write something...'),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        saveCounselorLog();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeedbackContainer(String counselorEmail, String log,
      {DateTime? timestamp}) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('counselors')
          .doc(counselorEmail)
          .get(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> counselorSnapshot) {
        if (counselorSnapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }

        if (!counselorSnapshot.hasData || !counselorSnapshot.data!.exists) {
          return Container(); // Return an empty container if counselor details not found
        }

        var counselorData = counselorSnapshot.data!.data() as Map<String, dynamic>;
        var counselorName = counselorData['name'];
        return Container(
          width: 376,
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Color(0xFAFAFAFA),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  'Counselor: $counselorName',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text('$log', style: TextStyle(fontSize: 12)),
                if (timestamp != null) ...[
                  SizedBox(height: 8),
                  Text('${timestamp.toString()}',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
  void saveCounselorLog() async {
    String log = logController.text.trim();
    if (log.isNotEmpty) {
      // Get the current timestamp
      DateTime timestamp = DateTime.now();

      // Create the log data
      Map<String, dynamic> logData = {
        'counseloremail': widget.counseloremail,
        'timestamp': timestamp,
        'log': log,
      };

      try {
        // Update the "appointments" collection
        await FirebaseFirestore.instance
            .collection('appointments')
            .doc(widget.appointmentDocID)
            .update({
          'feedback': FieldValue.arrayUnion([logData]),
        });

        // Show a success message or navigate back to the previous screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Counselor log saved successfully!'),
          ),
        );
      } catch (e) {
        print('Error saving counselor log: $e');
        // Handle the error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving counselor log.'),
          ),
        );
      }
    } else {
      // Log is empty, show an error message or handle accordingly
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Counselor log cannot be empty.'),
        ),
      );
    }
  }

}