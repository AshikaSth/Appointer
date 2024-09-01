// // // // // //
// // // // // // import 'package:flutter/material.dart';
// // // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // //
// // // // // // class CounselorAppointmentsPage extends StatelessWidget {
// // // // // //   final String email;
// // // // // //
// // // // // //   CounselorAppointmentsPage({required this.email});
// // // // // //
// // // // // //   @override
// // // // // //   Widget build(BuildContext context) {
// // // // // //     return Scaffold(
// // // // // //       appBar: AppBar(
// // // // // //         title: Text('Counselor Appointments Page'),
// // // // // //       ),
// // // // // //       body: StreamBuilder(
// // // // // //         stream: FirebaseFirestore.instance
// // // // // //             .collection('appointments')
// // // // // //             .where('counseloremail', isEqualTo: email)
// // // // // //             .snapshots(),
// // // // // //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // // // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // // // //             return Container();
// // // // // //           }
// // // // // //
// // // // // //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // // // //             return Center(
// // // // // //               child: Text('No appointments found.'),
// // // // // //             );
// // // // // //           }
// // // // // //
// // // // // //           var appointments = snapshot.data!.docs;
// // // // // //
// // // // // //           return ListView.builder(
// // // // // //             itemCount: appointments.length,
// // // // // //             itemBuilder: (context, index) {
// // // // // //               var appointment = appointments[index].data() as Map<String, dynamic>;
// // // // // //               var useremail = appointment['useremail'];
// // // // // //
// // // // // //               return StreamBuilder(
// // // // // //                 stream: FirebaseFirestore.instance
// // // // // //                     .collection('users')
// // // // // //                     .doc(useremail) // Assuming useremail is the document ID in the "users" collection
// // // // // //                     .snapshots(),
// // // // // //                 builder: (context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
// // // // // //                   if (userSnapshot.connectionState == ConnectionState.waiting) {
// // // // // //                     return Container();
// // // // // //                   }
// // // // // //
// // // // // //                   if (!userSnapshot.hasData) {
// // // // // //                     return Center(
// // // // // //                       child: Text('User details not found.'),
// // // // // //                     );
// // // // // //                   }
// // // // // //
// // // // // //                   var userDetails = userSnapshot.data!.data() as Map<String, dynamic>;
// // // // // //
// // // // // //                   return Card(
// // // // // //                     child: ListTile(
// // // // // //                       title: Text('User Document ID: $useremail'), // Assuming useremail is the document ID
// // // // // //                       subtitle: Column(
// // // // // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // // // // //                         children: [
// // // // // //                           Text('User Name: ${userDetails['name']}'),
// // // // // //                           Text('Date of Birth: ${userDetails['dob']}'),
// // // // // //                           Text('Gender: ${userDetails['gender']}'),
// // // // // //                           Text('Phone Number: ${userDetails['phoneNumber']}'),
// // // // // //                           // Add more details as needed
// // // // // //                         ],
// // // // // //                       ),
// // // // // //                     ),
// // // // // //                   );
// // // // // //                 },
// // // // // //               );
// // // // // //             },
// // // // // //           );
// // // // // //         },
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }
// // // // //
// // // // //
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // //
// // // // // class CounselorAppointmentsPage extends StatelessWidget {
// // // // //   final String email;
// // // // //
// // // // //   CounselorAppointmentsPage({required this.email});
// // // // //
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: Text('Counselor Appointments Page'),
// // // // //       ),
// // // // //       body: StreamBuilder(
// // // // //         stream: FirebaseFirestore.instance
// // // // //             .collection('appointments')
// // // // //             .where('counseloremail', isEqualTo: email)
// // // // //             .snapshots(),
// // // // //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // // //             return Container();
// // // // //           }
// // // // //
// // // // //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // // //             return Center(
// // // // //               child: Text('No appointments found.'),
// // // // //             );
// // // // //           }
// // // // //
// // // // //           var appointments = snapshot.data!.docs;
// // // // //
// // // // //           return ListView.builder(
// // // // //             itemCount: appointments.length,
// // // // //             itemBuilder: (context, index) {
// // // // //               var appointment = appointments[index].data() as Map<String, dynamic>;
// // // // //
// // // // //               return Card(
// // // // //                 child: ListTile(
// // // // //                   title: Text('Appointment Document ID: ${appointments[index].id}'),
// // // // //                   subtitle: Column(
// // // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                     children: [
// // // // //                       Text('User Email: ${appointment['useremail']}'),
// // // // //                       Text('Date: ${appointment['date']}'),
// // // // //                       Text('Time: ${appointment['time']}'),
// // // // //                       // Add more details as needed
// // // // //                     ],
// // // // //                   ),
// // // // //                 ),
// // // // //               );
// // // // //             },
// // // // //           );
// // // // //         },
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // // // import 'package:flutter/material.dart';
// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // //
// // // // class CounselorAppointmentsPage extends StatelessWidget {
// // // //   final String email;
// // // //
// // // //   CounselorAppointmentsPage({required this.email});
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('Counselor Appointments Page'),
// // // //       ),
// // // //       body: StreamBuilder(
// // // //         stream: FirebaseFirestore.instance
// // // //             .collection('appointments')
// // // //             .where('counseloremail', isEqualTo: email)
// // // //             .snapshots(),
// // // //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // //             return Container();
// // // //           }
// // // //
// // // //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // // //             return Center(
// // // //               child: Text('No appointments found.'),
// // // //             );
// // // //           }
// // // //
// // // //           var appointments = snapshot.data!.docs;
// // // //
// // // //           return ListView.builder(
// // // //             itemCount: appointments.length,
// // // //             itemBuilder: (context, index) {
// // // //               var appointment = appointments[index].data() as Map<String, dynamic>;
// // // //
// // // //               return Card(
// // // //                 child: ListTile(
// // // //                   title: Text('Appointment Document ID: ${appointments[index].id}'),
// // // //                   subtitle: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: [
// // // //                       for (var entry in appointment.entries)
// // // //                         Text('${entry.key}: ${entry.value}'),
// // // //                       // Display all key-value pairs from the appointment data
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               );
// // // //             },
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'takecounseldata.dart'; // Import the takecounseldata.dart file
// // //
// // // class CounselorAppointmentsPage extends StatelessWidget {
// // //   final String email;
// // //
// // //   CounselorAppointmentsPage({required this.email});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Counselor Appointments Page'),
// // //       ),
// // //       body: StreamBuilder(
// // //         stream: FirebaseFirestore.instance
// // //             .collection('appointments')
// // //             .where('counseloremail', isEqualTo: email)
// // //             .snapshots(),
// // //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // //             return Container();
// // //           }
// // //
// // //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // //             return Center(
// // //               child: Text('No appointments found.'),
// // //             );
// // //           }
// // //
// // //           var appointments = snapshot.data!.docs;
// // //
// // //           return ListView.builder(
// // //             itemCount: appointments.length,
// // //             itemBuilder: (context, index) {
// // //               var appointment = appointments[index].data() as Map<String, dynamic>;
// // //
// // //               return GestureDetector(
// // //                 onTap: () {
// // //                   // Navigate to the "takecounseldata.dart" page with appointment document ID
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (context) => TakeCounselDataPage(
// // //                         appointmentDocID: appointments[index].id,
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //                 child: Card(
// // //                   child: ListTile(
// // //                     title: Text('Appointment Document ID: ${appointments[index].id}'),
// // //                     // subtitle: Column(
// // //                     //   crossAxisAlignment: CrossAxisAlignment.start,
// // //                     //   children: [
// // //                     //     for (var entry in appointment.entries)
// // //                     //       Text('${entry.key}: ${entry.value}'),
// // //                     //     // Display all key-value pairs from the appointment data
// // //                     //   ],
// // //                     // ),
// // //                   ),
// // //                 ),
// // //               );
// // //             },
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'takecounseldata.dart'; // Import the takecounseldata.dart file
// // //
// // // class CounselorAppointmentsPage extends StatelessWidget {
// // //   final String email;
// // //
// // //   CounselorAppointmentsPage({required this.email});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Counselor Appointments Page'),
// // //       ),
// // //       body: StreamBuilder(
// // //         stream: FirebaseFirestore.instance
// // //             .collection('appointments')
// // //             .where('counseloremail', isEqualTo: email)
// // //             .snapshots(),
// // //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // //             return Container();
// // //           }
// // //
// // //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// // //             return Center(
// // //               child: Text('No appointments found.'),
// // //             );
// // //           }
// // //
// // //           var appointments = snapshot.data!.docs;
// // //
// // //           return ListView.builder(
// // //             itemCount: appointments.length,
// // //             itemBuilder: (context, index) {
// // //               var appointment = appointments[index].data() as Map<String, dynamic>;
// // //               var appointmentDocID = appointments[index].id;
// // //
// // //               var formData = appointment['form_data'] as List?;
// // //
// // //               return GestureDetector(
// // //                 onTap: () {
// // //                   // Navigate to the "takecounseldata.dart" page with appointment document ID
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                       builder: (context) => TakeCounselDataPage(
// // //                         appointmentDocID: appointmentDocID,
// // //                       ),
// // //                     ),
// // //                   );
// // //                 },
// // //                 child: Card(
// // //                   child: ListTile(
// // //
// // //                     title: Text('Appointment Document ID: $appointmentDocID'),
// // //                     subtitle: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       // children: [
// // //                       //   if (formData != null && formData is List<Map<String, dynamic>>)
// // //                       //     for (var field in formData)
// // //                       //       Text('${field['field_name']}: ${field['answer']}'),
// // //                       //   // Display each field name and its corresponding answer
// // //                       // ],
// // //                     ),
// // //                   ),
// // //                 ),
// // //               );
// // //             },
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'takecounseldata.dart'; // Import the takecounseldata.dart file
// //
// // class CounselorAppointmentsPage extends StatelessWidget {
// //   final String email;
// //
// //   CounselorAppointmentsPage({required this.email});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Counselor Appointments Page'),
// //       ),
// //       body: StreamBuilder(
// //         stream: FirebaseFirestore.instance
// //             .collection('appointments')
// //             .where('counseloremail', isEqualTo: email)
// //             .snapshots(),
// //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Container();
// //           }
// //
// //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// //             return Center(
// //               child: Text('No appointments found.'),
// //             );
// //           }
// //
// //           var appointments = snapshot.data!.docs;
// //
// //           return ListView.builder(
// //             itemCount: appointments.length,
// //             itemBuilder: (context, index) {
// //               var appointment = appointments[index].data() as Map<String, dynamic>;
// //               var appointmentDocID = appointments[index].id;
// //               var useremail = appointment['useremail'];
// //
// //               return GestureDetector(
// //                 onTap: () {
// //                   // Navigate to the "takecounseldata.dart" page with appointment document ID
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) => TakeCounselDataPage(
// //                         appointmentDocID: appointmentDocID,
// //                       ),
// //                     ),
// //                   );
// //                 },
// //                 child: Card(
// //                   child: ListTile(
// //                     title: Text('User Email: $useremail'),
// //                     subtitle: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         // You can add more details here if needed
// //                         Text('Appointment Document ID: $appointmentDocID'),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'takecounseldata.dart'; // Import the takecounseldata.dart file
// //
// // class CounselorAppointmentsPage extends StatelessWidget {
// //   final String email;
// //
// //   CounselorAppointmentsPage({required this.email});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Counselor Appointments Page'),
// //       ),
// //       body: StreamBuilder(
// //         stream: FirebaseFirestore.instance
// //             .collection('appointments')
// //             .where('counseloremail', isEqualTo: email)
// //             .snapshots(),
// //         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Container();
// //           }
// //
// //           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
// //             return Center(
// //               child: Text('No appointments found.'),
// //             );
// //           }
// //
// //           var appointments = snapshot.data!.docs;
// //
// //           return ListView.builder(
// //             itemCount: appointments.length,
// //             itemBuilder: (context, index) {
// //               var appointment = appointments[index].data() as Map<String, dynamic>;
// //               var appointmentDocID = appointments[index].id;
// //               var useremail = appointment['useremail'];
// //
// //               return StreamBuilder(
// //                 stream: FirebaseFirestore.instance
// //                     .collection('users')
// //                     .doc(useremail)
// //                     .snapshots(),
// //                 builder: (context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
// //                   if (userSnapshot.connectionState == ConnectionState.waiting) {
// //                     return Container(); // or a loading indicator
// //                   }
// //
// //                   if (!userSnapshot.hasData) {
// //                     return Container(); // or an error message
// //                   }
// //
// //                   var userDetails = userSnapshot.data!.data() as Map<String, dynamic>;
// //                   var userName = userDetails['name'];
// //
// //                   return GestureDetector(
// //                     onTap: () {
// //                       // Navigate to the "takecounseldata.dart" page with appointment document ID
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => TakeCounselDataPage(
// //                             appointmentDocID: appointmentDocID,
// //                             counseloremail: email, // Pass the counseloremail here
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                     child: Card(
// //                       child: ListTile(
// //                         title: Text('$userName'),
// //                         subtitle: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text('Appointment Document ID: $appointmentDocID'),
// //                             // You can add more details here if needed
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               );
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'takecounseldata.dart'; // Import the takecounseldata.dart file
//
// class CounselorAppointmentsPage extends StatelessWidget {
//   final String email;
//
//   CounselorAppointmentsPage({required this.email});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counselor Appointments Page'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('appointments')
//             .where('counseloremail', isEqualTo: email)
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Container();
//           }
//
//           if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(
//               child: Text('No appointments found.'),
//             );
//           }
//
//           var appointments = snapshot.data!.docs;
//
//           return ListView.builder(
//             itemCount: appointments.length,
//             itemBuilder: (context, index) {
//               var appointment = appointments[index].data() as Map<
//                   String,
//                   dynamic>;
//               var appointmentDocID = appointments[index].id;
//               var useremail = appointment['useremail'];
//
//               return StreamBuilder(
//                 stream: FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(useremail)
//                     .snapshots(),
//                 builder: (context,
//                     AsyncSnapshot<DocumentSnapshot> userSnapshot) {
//                   if (userSnapshot.connectionState == ConnectionState.waiting) {
//                     return Container(); // or a loading indicator
//                   }
//
//                   if (!userSnapshot.hasData) {
//                     return Container(); // or an error message
//                   }
//
//                   var userDetails = userSnapshot.data!.data() as Map<String, dynamic>;
//                   var userName = userDetails['name'];
//
//
//
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>
//                               TakeCounselDataPage(
//                                 appointmentDocID: appointmentDocID,
//                                 counseloremail: email,
//                               ),
//                         ),
//                       );
//                     },
//                     child: Card(
//                       child: ListTile(
//                         title: Text('$userName'),
//                         subtitle: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text('Appointment Document ID: $appointmentDocID'),
//                           ],
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.more_vert),
//                           onPressed: () {
//                             _showOptionsDialog(
//                                 context, appointmentDocID, userName, useremail);
//                           },
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
//
//   void _showOptionsDialog(BuildContext context, String appointmentDocID,
//       String userName,String useremail) async {
//     // Close the options dialog
//     Navigator.pop(context);
//
//     // Show dialog with options
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Appointment Options"),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the dialog
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           ReferPage(
//                             appointmentDocID: appointmentDocID,
//                             userName: userName,
//                             counseloremail: email,
//                             useremail: useremail, // Add useremail parameter to the constructor
//                           ),
//                     ),
//                   );
//                 },
//
//                 child: Text("Delegate to others"),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the dialog
//                   // Implement Option 2 logic here
//                 },
//                 child: Text("Option 2"),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
// class ReferPage extends StatelessWidget {
//   final String appointmentDocID;
//   final String userName;
//   final String counseloremail;
//   final String useremail; // Add useremail parameter to the constructor
//
//   ReferPage({
//     required this.appointmentDocID,
//     required this.userName,
//     required this.counseloremail,
//     required this.useremail,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController reasonController = TextEditingController();
//     // Fetch counselor's data
//     FirebaseFirestore.instance.collection('counselors').doc(counseloremail).get().then((counselorSnapshot) {
//       if (counselorSnapshot.exists) {
//         var counselorData = counselorSnapshot.data();
//         if (counselorData != null && counselorData is Map<String, dynamic>) {
//           String counselorName = counselorData['name'];
//           String orgemail = counselorData['orgemail'];
//
//           // Fetch organization data
//           FirebaseFirestore.instance.collection('organizations').doc(orgemail).get().then((orgSnapshot) {
//             if (orgSnapshot.exists) {
//               var orgData = orgSnapshot.data();
//               if (orgData != null && orgData is Map<String, dynamic>) {
//                 String organizationName = orgData['name'];
//
//                 // Show dialog
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Reason for Not Taking Appointment"),
//                       content: TextField(
//                         controller: reasonController,
//                         decoration: InputDecoration(
//                           hintText: "Enter your reason here",
//                         ),
//                         maxLines: 3, // Allow multiple lines for the reason
//                       ),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.pop(context); // Close the dialog
//                           },
//                           child: Text("Cancel"),
//                         ),
//                         TextButton(
//                           onPressed: () async {
//                             String reason = reasonController.text.trim();
//                             if (reason.isNotEmpty) {
//                               // Update the appointment document with the reason
//                               await FirebaseFirestore.instance.collection('appointments').doc(appointmentDocID).update({'delegate': reason});
//                               DocumentSnapshot appointmentSnapshot = await FirebaseFirestore.instance.collection('appointments').doc(appointmentDocID).get();
//
//                               if (appointmentSnapshot.exists) {
//                                 var appointmentData = appointmentSnapshot.data();
//                                 if (appointmentData != null && appointmentData is Map<String, dynamic>) {
//                                   String orgemail = appointmentData['orgemail'];
//                                   DateTime timestamp = DateTime.now(); // Current timestamp
//
//                                   String appointmentDocId = appointmentSnapshot.id;
//                                   //String reason = reason;
//                                   String description = reason;// Get the appointment document ID
//
//                                   // Add a notice to the organization
//                                   await FirebaseFirestore.instance.collection('organizations').doc(orgemail).update({
//                                     'notices': FieldValue.arrayUnion([
//                                       {
//                                         'title': 'Unable to Attend Appointment',
//
//                                         'timestamp': timestamp.toUtc(),
//                                         'description': '''
// Dear $userName,
//
// I regret to inform you that I am unable to attend our scheduled appointment. I apologize for any inconvenience this may cause.
//
//
// Sincerely,
// $counselorName
// $counseloremail
//
// ---
// $organizationName,
// ''',
//
//                                         'useremail': useremail,
//                                         'orgemail': orgemail,
//                                         'appointmentDocID': appointmentDocID,
//                                         'counseloremail': counseloremail,
//                                         'reason': reason,
//                                       }
//                                     ])
//                                   });
//                                 }
//                               }
//                             }
//                             Navigator.pop(context); // Close the dialog
//                           },
//                           child: Text("Submit"),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               } else {
//                 // Handle case where organization data is not found
//                 print("Organization data not found");
//               }
//             }
//           });
//         } else {
//           // Handle case where counselor data is not found
//           print("Counselor data not found");
//         }
//       }
//     });
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Refer Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Appointment Document ID: $appointmentDocID'),
//             Text('User Name: $userName'),
//             Text('Counselormail: $counseloremail'),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:appoiter/counselors/counselornavbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'takecounseldata.dart';

class CounselorAppointmentsPage extends StatefulWidget {
  final String email;

  CounselorAppointmentsPage({required this.email});

  @override
  _CounselorAppointmentsPageState createState() => _CounselorAppointmentsPageState();
}

class _CounselorAppointmentsPageState extends State<CounselorAppointmentsPage> {
  int _selectedIndex = 1;

  get counseloremail => widget.email;

  get counselorName => null;

  get organizationName => null; // Set the selected index to 0 initially

  void _handleTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    CounselorNavBar.navigateToPage(context, index, widget.email);
  }

  void _showOptionsDialog(BuildContext context, String appointmentDocID, String userName, String useremail) async {
    // Close the options dialog
    Navigator.pop(context);

    // Show dialog with options
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController reasonController = TextEditingController();

        return AlertDialog(
          title: Text("Delegate To Other Counselor"),
          content: TextField(
            controller: reasonController,
            decoration: InputDecoration(
              hintText: "Enter your reason here",
            ),
            maxLines: 3, // Allow multiple lines for the reason
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                String reason = reasonController.text.trim();
                if (reason.isNotEmpty) {
                  // Update the appointment document with the reason
                  await FirebaseFirestore.instance.collection('appointments').doc(appointmentDocID).update({'delegate': reason});
                  DocumentSnapshot appointmentSnapshot = await FirebaseFirestore.instance.collection('appointments').doc(appointmentDocID).get();

                  if (appointmentSnapshot.exists) {
                    var appointmentData = appointmentSnapshot.data();
                    if (appointmentData != null && appointmentData is Map<String, dynamic>) {
                      String orgemail = appointmentData['orgemail'];
                      DateTime timestamp = DateTime.now(); // Current timestamp

                      // Add a notice to the organization
                      await FirebaseFirestore.instance.collection('organizations').doc(orgemail).update({
                        'notices': FieldValue.arrayUnion([
                          {
                            'title': 'Unable to Attend Appointment',
                            'timestamp': timestamp.toUtc(),
                            'description': '''
Dear $userName,

I regret to inform you that I am unable to attend our scheduled appointment. I apologize for any inconvenience this may cause.

Sincerely,
$counselorName
$counseloremail

---
$organizationName,
''',
                            'useremail': useremail,
                            'orgemail': orgemail,
                            'appointmentDocID': appointmentDocID,
                            'counseloremail': counseloremail,
                            'reason': reason,
                          }
                        ])
                      });
                    }
                  }
                }
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Appointments',
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .where('counseloremail', isEqualTo: widget.email)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No appointments found.'),
            );
          }

          var appointments = snapshot.data!.docs;

          return ListView.builder(
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              var appointment = appointments[index].data() as Map<String, dynamic>;
              var appointmentDocID = appointments[index].id;
              var useremail = appointment['useremail'];
              var appointmentDate = appointment['appointmentDate'];

              return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(useremail)
                    .snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return Container(); // or a loading indicator
                  }

                  if (!userSnapshot.hasData) {
                    return Container(); // or an error message
                  }

                  var userDetails = userSnapshot.data!.data() as Map<String, dynamic>;
                  var userName = userDetails['name'];
                  var userPhone = userDetails['phoneNumber'];

                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Display date and month
                          ElevatedButton(
                            onPressed: () {
                              // Add onPressed function here if needed
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white), // Set background color to white
                              minimumSize: MaterialStateProperty.all(Size(40, 70)), // Adjust minimumSize to increase button size
                              elevation: MaterialStateProperty.all(0), // Remove button shadow
                              side: MaterialStateProperty.all(BorderSide.none), // Remove button stroke
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${appointmentDate?.toDate().day}', // Display day
                                  style: TextStyle(color: Colors.blueGrey, fontSize: 20), // Set text color to black
                                ),
                                Text(
                                  _getMonthName(appointmentDate?.toDate().month), // Display month
                                  style: TextStyle(color: Colors.blueGrey), // Set text color to black
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TakeCounselDataPage(
                                      appointmentDocID: appointmentDocID,
                                      counseloremail: widget.email,
                                    ),
                                  ),
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.white), // Set background color to white
                                elevation: MaterialStateProperty.all(0), // Remove button shadow
                                side: MaterialStateProperty.all(BorderSide.none), // Remove button stroke
                              ),
                              child: ListTile(
                                title: Text('$userName'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Contact: $userPhone'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _showOptionsDialog(context, appointmentDocID, userName, useremail);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.white), // Set background color to white
                              elevation: MaterialStateProperty.all(0), // Remove button shadow
                              side: MaterialStateProperty.all(BorderSide.none), // Remove button stroke
                            ),
                            child: SizedBox(
                              width: 40, // Set the width of the button
                              height: 70, // Set the height of the button
                              child: Icon(
                                Icons.more_vert,
                                color: Color(0xFF255B78), // Set the icon color
                                size: 30, // Set the icon size
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: CounselorNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _handleTabChange,
        email: widget.email,
      ),
    );
  }

  // Define _getMonthName method here or move it to a common utility file
  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}

