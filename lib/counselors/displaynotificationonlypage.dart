import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package for date formatting
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayNotificationOnlyPage extends StatefulWidget {
  final String email; // Add orgname parameter
  final String title;
  final String description;
  final DateTime timestamp;

  const DisplayNotificationOnlyPage({
    required this.email, // Initialize orgname parameter
    required this.title,
    required this.description,
    required this.timestamp,
  });

  @override
  _DisplayNotificationOnlyPageState createState() => _DisplayNotificationOnlyPageState();
}

class _DisplayNotificationOnlyPageState extends State<DisplayNotificationOnlyPage> {
  late String orgname = ''; // Initialize orgname with an empty string

  @override
  void initState() {
    super.initState();
    _fetchOrgName();
  }

  Future<void> _fetchOrgName() async {
    try {
      // Retrieve the document from the "counselors" collection using the passed email
      final counselorDoc = await FirebaseFirestore.instance.collection('counselors').doc(widget.email).get();
      if (counselorDoc.exists) {
        // Extract the orgemail from the counselor document
        final orgEmail = counselorDoc.data()?['orgemail'];
        if (orgEmail != null) {
          // Retrieve the organization document using the orgemail
          final orgDoc = await FirebaseFirestore.instance.collection('organizations').doc(orgEmail).get();
          if (orgDoc.exists) {
            // Extract the organization name from the organization document
            final orgName = orgDoc.data()?['name'];
            setState(() {
              orgname = orgName!;
            });
          }
        }
      }
    } catch (e) {
      print('Error fetching organization name: $e');
    }
  }

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
              if (orgname.isNotEmpty)
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '$orgname',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  DateFormat('yyyy-MM-dd HH:mm').format(widget.timestamp), // Format the timestamp
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${widget.title}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${widget.description}',
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
