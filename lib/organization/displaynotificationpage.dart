import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class DisplayNotificationPage extends StatefulWidget {
  final String email;
  final String title;
  final String description;
  final DateTime timestamp;
  final String orgEmail;
  final String counseloremail;
  final Map<String, dynamic> notice; // Change the type to Map<String, dynamic>

  DisplayNotificationPage({
    required this.email,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.orgEmail,
    required this.notice, // Update the type to Map<String, dynamic>
    required this.counseloremail,
  });

  @override
  State<DisplayNotificationPage> createState() => _DisplayNotificationPageState();
}

class _DisplayNotificationPageState extends State<DisplayNotificationPage> {
  bool showRecommendations = false;

  @override
  Widget build(BuildContext context) {
    bool hasAppointmentDocID = false;
    String organizationName = '';


    return Scaffold(
      appBar: AppBar(
        title: Text('Notice Details'),
        backgroundColor: Color(0xFF255B78),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!hasAppointmentDocID) ...[
                  // Display notification details without appointmentDocID
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subject: ${widget.title}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        Text(
                          '${widget.description}',
                          style: TextStyle(fontSize: 16),
                        ),

                        Text(
                          '${widget.timestamp.toString()}',
                          style: TextStyle(fontSize: 16),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListTileButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ListTileButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(text),
        onTap: onPressed,
        tileColor: Colors.grey[200],
      ),
    );
  }
}
