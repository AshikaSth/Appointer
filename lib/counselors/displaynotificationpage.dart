// // import 'package:flutter/material.dart';
// //
// // class DisplayNotificationPage extends StatelessWidget {
// //   final String email;
// //   final String title;
// //   final String description;
// //   final DateTime timestamp;
// //   final String orgEmail;
// //
// //   DisplayNotificationPage({
// //     required this.email,
// //     required this.title,
// //     required this.description,
// //     required this.timestamp,
// //     required this.orgEmail,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Notification Details'),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Center(
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Container(
// //                   padding: const EdgeInsets.all(16.0),
// //                   decoration: BoxDecoration(
// //                     border: Border.all(color: Colors.grey),
// //                     borderRadius: BorderRadius.circular(8.0),
// //                   ),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Container(
// //                         padding: const EdgeInsets.all(12.0),
// //                         decoration: BoxDecoration(
// //                           border: Border.all(color: Colors.blue),
// //                           borderRadius: BorderRadius.circular(8.0),
// //                         ),
// //                         child: Text(
// //                           'Subject: $title',
// //                           style: TextStyle(fontSize: 16),
// //                         ),
// //                       ),
// //                       SizedBox(height: 12),
// //                       Text(
// //                         '$description',
// //                         style: TextStyle(fontSize: 16),
// //                       ),
// //                       SizedBox(height: 12),
// //                       Text(
// //                         'Timestamp: ${timestamp.toString()}',
// //                         style: TextStyle(fontSize: 16),
// //                       ),
// //                       SizedBox(height: 12),
// //                       Text(
// //                         'Organization Email: $orgEmail',
// //                         style: TextStyle(fontSize: 16),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(height: 16), // Add some space between the two boxes
// //                 Container(
// //                   padding: const EdgeInsets.all(16.0),
// //                   decoration: BoxDecoration(
// //                     border: Border.all(color: Colors.grey),
// //                     borderRadius: BorderRadius.circular(8.0),
// //                   ),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Do you want to postpone the appointment to a later date?',
// //                         style: TextStyle(fontSize: 16),
// //                       ),
// //                       SizedBox(height: 12),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               // Handle Yes button press
// //                             },
// //                             child: Text('Yes'),
// //                           ),
// //                           SizedBox(width: 16),
// //                           ElevatedButton(
// //                             onPressed: () {
// //                               // Handle No button press
// //                             },
// //                             child: Text('No'),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(height: 16), // Add some space between the two boxes
// //                 Container(
// //                   padding: const EdgeInsets.all(16.0),
// //                   decoration: BoxDecoration(
// //                     border: Border.all(color: Colors.grey),
// //                     borderRadius: BorderRadius.circular(8.0),
// //                   ),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Text(
// //                         'Recommendations',
// //                         style: TextStyle(fontSize: 16),
// //                       ),
// //                       // Add your recommendations here
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
//
// class DisplayNotificationPage extends StatelessWidget {
//   final String email;
//   final String title;
//   final String description;
//   final DateTime timestamp;
//   final String orgEmail;
//
//   DisplayNotificationPage({
//     required this.email,
//     required this.title,
//     required this.description,
//     required this.timestamp,
//     required this.orgEmail,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.all(12.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.blue),
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Text(
//                           'Subject: $title',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                       SizedBox(height: 12),
//                       Text(
//                         '$description',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       SizedBox(height: 12),
//                       Text(
//                         'Timestamp: ${timestamp.toString()}',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       SizedBox(height: 12),
//                       Text(
//                         'Organization Email: $orgEmail',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16), // Add some space between the two boxes
//                 Container(
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Options:',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       SizedBox(height: 12),
//                       ListTileButton(
//                         text: '1. I want to postpone the appointment',
//                         onPressed: () {
//                           // Handle Option 1 press
//                         },
//                       ),
//                       ListTileButton(
//                         text: '2. I want to create appointment with another counselor',
//                         onPressed: () {
//                           // Handle Option 2 press
//                         },
//                       ),
//                       ListTileButton(
//                         text: '3. I want to cancel the appointment',
//                         onPressed: () {
//                           // Handle Option 3 press
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 16), // Add some space between the two boxes
//                 Container(
//                   padding: const EdgeInsets.all(16.0),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Recommendations',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       // Add your recommendations here
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class ListTileButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//
//   const ListTileButton({
//     required this.text,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       padding: const EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey),
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: ListTile(
//         title: Text(text),
//         onTap: onPressed,
//         tileColor: Colors.grey[200],
//       ),
//     );
//   }
// }
//
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayNotificationPage extends StatefulWidget {
  final String email;
  final String title;
  final String description;
  final DateTime timestamp;
  final String orgEmail;
  final Map<String, dynamic> notice; // Change the type to Map<String, dynamic>

  DisplayNotificationPage({
    required this.email,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.orgEmail,
    required this.notice,
  });

  @override
  _DisplayNotificationPageState createState() =>
      _DisplayNotificationPageState();
}

class _DisplayNotificationPageState extends State<DisplayNotificationPage> {
  bool showRecommendations = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Notifications Details',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                      SizedBox(height: 12),
                      Text(
                        'Timestamp: ${widget.timestamp.toString()}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Organization Email: ${widget.orgEmail}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                 // Add some space between the two boxes
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Future<List<Map<String, String>>> getCounselors(String orgEmail) async {
  try {
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('counselors')
        .where('orgemail', isEqualTo: orgEmail)
        .get();

    List<Map<String, String>> counselors = [];
    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      final String name = doc['name'];
      final String phone = doc['phone'];
      counselors.add({'name': name, 'phone': phone});
    }

    return counselors;
  } catch (e) {
    print('Error fetching counselors: $e');
    return [];
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
