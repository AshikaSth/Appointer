// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class CounselorPage extends StatefulWidget {
//   final String email;
//   final String counselorName;
//
//   CounselorPage({required this.email, required this.counselorName});
//
//   @override
//   State<CounselorPage> createState() => _CounselorPageState();
// }
//
// class _CounselorPageState extends State<CounselorPage> {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   bool isActive = true;
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize isActive from Firebase when the widget is created
//     FirebaseFirestore.instance
//         .collection('counselors')
//         .where('name', isEqualTo: widget.counselorName)
//         .get()
//         .then((querySnapshot) {
//       if (querySnapshot.docs.isNotEmpty) {
//         setState(() {
//           isActive = querySnapshot.docs.first.data()['isActive'] ?? true;
//         });
//       }
//     });
//   }
//   void _toggleActiveStatus() {
//     FirebaseFirestore.instance
//         .collection('counselors')
//         .doc(widget.email)
//         .get()
//         .then((counselorSnapshot) {
//       if (counselorSnapshot.exists) {
//         String orgEmail = counselorSnapshot.data()?['orgemail'];
//
//         FirebaseFirestore.instance
//             .collection('organizations')
//             .doc(orgEmail)
//             .get()
//             .then((orgSnapshot) {
//           if (orgSnapshot.exists) {
//             DateTime now = DateTime.now();
//             int currentHour = now.hour;
//             int currentMinute = now.minute;
//
//             // Retrieve opening and closing times from the organization document
//             int openingHour = orgSnapshot.data()?['openingHour'] ?? 0;
//             int openingMinute = orgSnapshot.data()?['openingMinute'] ?? 0;
//             int closingHour = orgSnapshot.data()?['closingHour'] ?? 23;
//             int closingMinute = orgSnapshot.data()?['closingMinute'] ?? 59;
//
//             // Convert opening and closing times to minutes for comparison
//             int openingTime = openingHour * 60 + openingMinute;
//             int closingTime = closingHour * 60 + closingMinute;
//             int currentTime = currentHour * 60 + currentMinute;
//
//             // Toggle isActive based on current time and organization's opening/closing times
//             if (currentTime >= openingTime && currentTime <= closingTime) {
//               FirebaseFirestore.instance
//                   .collection('counselors')
//                   .doc(widget.email)
//                   .update({'isActive': true});
//
//               setState(() {
//                 isActive = true;
//               });
//             } else {
//               FirebaseFirestore.instance
//                   .collection('counselors')
//                   .doc(widget.email)
//                   .update({'isActive': false});
//
//               setState(() {
//                 isActive = false;
//               });
//             }
//           }
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counselor Details'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//                   future: FirebaseFirestore.instance
//                       .collection('counselors')
//                       .where('name', isEqualTo: widget.counselorName)
//                       .get()
//                       .then((querySnapshot) {
//                     if (querySnapshot.docs.isNotEmpty) {
//                       return querySnapshot.docs.first.reference.get();
//                     } else {
//                       throw 'Counselor not found';
//                     }
//                   }),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.waiting) {
//                       return CircularProgressIndicator();
//                     }
//
//                     if (snapshot.hasError) {
//                       return Text(
//                         'Error: ${snapshot.error}',
//                         style: TextStyle(color: Colors.red),
//                       );
//                     }
//
//                     if (!snapshot.hasData || snapshot.data == null) {
//                       return Text(
//                         'Counselor details not found.',
//                         style: TextStyle(color: Colors.red),
//                       );
//                     }
//
//                     final data = snapshot.data!.data();
//
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           title: Text(
//                             'Name: ${widget.counselorName}',
//                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Phone Number: ${data?['phone']}',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Email: ${data?['email']}',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                         // Add more details as needed
//                       ],
//                     );
//                   },
//                 ),
//
//               ),
//             ),
//           ),
//
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Active:'),
//                 Switch(
//                   value: isActive,
//                   onChanged: (value) {
//                     _toggleActiveStatus();
//                   },
//                   activeColor: Colors.green, // Set the color of the switch when toggled on
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CounselorPage extends StatefulWidget {
  final String email;
  final String counselorName;

  CounselorPage({required this.email, required this.counselorName});

  @override
  State<CounselorPage> createState() => _CounselorPageState();
}

class _CounselorPageState extends State<CounselorPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isActive = true;

  @override
  void initState() {
    super.initState();
    // Initialize isActive from Firebase when the widget is created
    FirebaseFirestore.instance
        .collection('counselors')
        .where('name', isEqualTo: widget.counselorName)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          isActive = querySnapshot.docs.first.data()['isActive'] ?? true;
        });
      }
    });
  }

  void _toggleActiveStatus() {
    FirebaseFirestore.instance
        .collection('counselors')
        .doc(widget.email)
        .get()
        .then((counselorSnapshot) {
      if (counselorSnapshot.exists) {
        String orgEmail = counselorSnapshot.data()?['orgemail'];

        FirebaseFirestore.instance
            .collection('organizations')
            .doc(orgEmail)
            .get()
            .then((orgSnapshot) {
          if (orgSnapshot.exists) {
            DateTime now = DateTime.now();
            int currentHour = now.hour;
            int currentMinute = now.minute;

            // Retrieve opening and closing times from the organization document
            int openingHour = orgSnapshot.data()?['openingHour'] ?? 0;
            int openingMinute = orgSnapshot.data()?['openingMinute'] ?? 0;
            int closingHour = orgSnapshot.data()?['closingHour'] ?? 23;
            int closingMinute = orgSnapshot.data()?['closingMinute'] ?? 59;

            // Convert opening and closing times to minutes for comparison
            int openingTime = openingHour * 60 + openingMinute;
            int closingTime = closingHour * 60 + closingMinute;
            int currentTime = currentHour * 60 + currentMinute;

            // Toggle isActive based on current time and organization's opening/closing times
            if (currentTime >= openingTime && currentTime <= closingTime) {
              FirebaseFirestore.instance
                  .collection('counselors')
                  .doc(widget.email)
                  .update({'isActive': true});

              setState(() {
                isActive = true;
              });
            } else {
              FirebaseFirestore.instance
                  .collection('counselors')
                  .doc(widget.email)
                  .update({'isActive': false});

              setState(() {
                isActive = false;
              });
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counselor Details'),
        backgroundColor: Color(0xFF255B78),
      ),
      body: Column(
        children: [
          SizedBox(height: 25.0),
          Center(
            child: Image.asset(
              'assets/profile.png', // Replace with your image asset
              width: 100.0,
              height: 100.0,
              fit: BoxFit.fill, // Use BoxFit.fill instead of BoxFit.fitXY
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('counselors')
                      .where('name', isEqualTo: widget.counselorName)
                      .get()
                      .then((querySnapshot) {
                    if (querySnapshot.docs.isNotEmpty) {
                      return querySnapshot.docs.first.reference.get();
                    } else {
                      throw 'Counselor not found';
                    }
                  }),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text(
                        'Error: ${snapshot.error}',
                        style: TextStyle(color: Colors.red),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data == null) {
                      return Text(
                        'Counselor details not found.',
                        style: TextStyle(color: Colors.red),
                      );
                    }

                    final data = snapshot.data!.data();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileInfoRow(label: 'Name', value: data?['name'] ?? ''),
                        ProfileInfoRow(label: 'Email', value: widget.email),
                        ProfileInfoRow(label: 'Phone Number', value: data?['phone'] ?? ''),
                        ProfileInfoRow(label: 'Address', value: data?['address'] ?? ''),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Active:'),
                Switch(
                  value: isActive,
                  onChanged: (value) {
                    setState(() {
                      isActive = value;
                    });
                    _toggleActiveStatus();
                  },
                  activeColor: Color(0xFF255B78), // Set the color of the switch when toggled on
                ),
              ],
            ),
          ),
        ],
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
              fontSize: 12.0,
            ),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontFamily: 'OpenSansSemibold',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
