import 'package:flutter/material.dart';

class AppointmentDetails extends StatelessWidget {
  final String orgName;
  final String counselorName;
  final String appointmentDocID; // Add appointmentDocID field

  AppointmentDetails({required this.orgName, required this.counselorName, required this.appointmentDocID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78),
        title: Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Organization: $orgName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Counselor: $counselorName',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Appointment ID: $appointmentDocID',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // You can add more details here as needed
          ],
        ),
      ),
    );
  }
}


