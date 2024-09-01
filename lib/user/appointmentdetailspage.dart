import 'package:flutter/material.dart';

class AppointmentDetailsPage extends StatelessWidget {
  final String documentId;
  final Map<String, dynamic> formAnswers;

  AppointmentDetailsPage({required this.documentId, required this.formAnswers});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Appointment Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Document ID: $documentId', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Form Answers:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            // Display form answers dynamically
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: formAnswers.entries
                  .map((entry) => ListTile(
                title: Text(entry.key),
                subtitle: Text(entry.value.toString()),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
