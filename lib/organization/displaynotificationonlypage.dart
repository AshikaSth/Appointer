import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting

class DisplayNotificationOnlyPage extends StatelessWidget {
  final String email;
  final String orgname; // Add orgname parameter
  final String title;
  final String description;
  final DateTime timestamp;

  const DisplayNotificationOnlyPage({
    required this.email,
    required this.orgname, // Initialize orgname parameter
    required this.title,
    required this.description,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Notice Details',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child:Text(
                  '$orgname',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(timestamp), // Format the timestamp
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child:Text(
                  '$title',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: 20),
              Text(
                '$description',
                style: TextStyle(fontSize: 15, color: Colors.black38), // Removed FontWeight.bold
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
