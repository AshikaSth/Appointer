import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentInfoPage extends StatelessWidget {
  final String appointmentID;

  AppointmentInfoPage({required this.appointmentID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text('User Details'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .doc(appointmentID)
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

          var appointmentData = snapshot.data!.data() as Map<String, dynamic>;
          var useremail = appointmentData['useremail'];

          return FutureBuilder(
            future: FirebaseFirestore.instance.collection('users').doc(useremail).get(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!userSnapshot.hasData || !userSnapshot.data!.exists) {
                return Center(
                  child: Text('User details not found.'),
                );
              }

              var userDetails = userSnapshot.data!.data() as Map<String, dynamic>;

              return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/profile.png', // Replace with your image asset
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.fill, // Use BoxFit.fill instead of BoxFit.fitXY
                      ),
                    ),
                    SizedBox(height: 50.0),
                    Text(
                      'Personal Information',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    ProfileInfoRow(label: 'Name', value: userDetails['name'] ?? ''),
                    ProfileInfoRow(label: 'Email', value: userSnapshot.data!.id),
                    ProfileInfoRow(label: 'Contact', value: userDetails['phoneNumber'] ?? ''),
                    ProfileInfoRow(label: 'DOB', value: userDetails['dob'] ?? ''),
                    ProfileInfoRow(label: 'Address', value: userDetails['address'] ?? ''),
                    SizedBox(height: 16.0),
                    // Favorites button
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  ProfileInfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 27.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.0,
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: 'OpenSansSemibold',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
