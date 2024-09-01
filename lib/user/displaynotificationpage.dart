
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DisplayNotificationPage extends StatefulWidget {
//   final String email;
//   final String title;
//   final String description;
//   final DateTime timestamp;
//   final String orgEmail;
//   final List<Map<String, dynamic>> notices; // Added notices variable
//
//   DisplayNotificationPage({
//     required this.email,
//     required this.title,
//     required this.description,
//     required this.timestamp,
//     required this.orgEmail,
//     required this.notices, // Added notices variable
//   });
//
//   @override
//   _DisplayNotificationPageState createState() =>
//       _DisplayNotificationPageState();
// }
//
// class _DisplayNotificationPageState extends State<DisplayNotificationPage> {
//   bool showRecommendations = false;
//
//   @override
//   Widget build(BuildContext context) {
//     bool hasAppointmentDocID = false;
//     String organizationName = '';
//
//     // Check if appointmentDocID is present in any of the notices
//     for (var notice in widget.notices) {
//       if (notice.containsKey('appointmentDocID')) {
//         hasAppointmentDocID = true;
//         break;
//       }
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (!hasAppointmentDocID) ...[
//                   // Display notification details without appointmentDocID
//                   Container(
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Subject: ${widget.title}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         SizedBox(height: 12),
//                         Text(
//                           '${widget.description}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         SizedBox(height: 12),
//                         Text(
//                           'Timestamp: ${widget.timestamp.toString()}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         SizedBox(height: 12),
//                         Text(
//                           'Organization Email: ${widget.orgEmail}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                 ] else ...[
//                   // Display notification details with appointmentDocID
//                   Container(
//                     padding: const EdgeInsets.all(16.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Organization: $organizationName',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           'Notice Title: ${widget.title}',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 8),
//                         Text('${widget.description}'),
//                         SizedBox(height: 8),
//                         Text('Timestamp: ${widget.timestamp.toString()}'),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                 ],
//                 // Add the rest of the UI components here
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
//                       SizedBox(height: 12),
//                       ListTileButton(
//                         text: '2. I want to create appointment with another counselor',
//                         onPressed: () {
//                           setState(() {
//                             showRecommendations = true;
//                           });
//                         },
//                       ),
//                       if (showRecommendations) ...[
//                         Container(
//                           margin: const EdgeInsets.symmetric(vertical: 8.0),
//                           padding: const EdgeInsets.all(8.0),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.grey),
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'Recommendations:',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               SizedBox(height: 12),
//                               FutureBuilder<List<Map<String, String>>>(
//                                 future: getCounselors(widget.orgEmail),
//                                 builder: (context, snapshot) {
//                                   if (snapshot.connectionState == ConnectionState.waiting) {
//                                     return CircularProgressIndicator();
//                                   } else if (snapshot.hasError) {
//                                     return Text('Error: ${snapshot.error}');
//                                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                                     return Text('No counselors found');
//                                   } else {
//                                     return Column(
//                                       children: snapshot.data!.map((counselor) {
//                                         return ElevatedButton(
//                                           onPressed: () {
//                                             showDialog(
//                                               context: context,
//                                               builder: (BuildContext context) {
//                                                 return AlertDialog(
//                                                   title: Text("Appointment Confirmation"),
//                                                   content: Text("Do you want to create an appointment with ${counselor['name']}?"),
//                                                   actions: <Widget>[
//                                                     TextButton(
//                                                       child: Text("Yes"),
//                                                       onPressed: () {
//                                                         // Handle appointment creation here
//                                                         // For example, you can navigate to a screen to create the appointment
//                                                         Navigator.of(context).pop(); // Close the dialog
//                                                       },
//                                                     ),
//                                                     TextButton(
//                                                       child: Text("No"),
//                                                       onPressed: () {
//                                                         Navigator.of(context).pop(); // Close the dialog
//                                                       },
//                                                     ),
//                                                   ],
//                                                 );
//                                               },
//                                             );
//                                           },
//                                           child: Text('${counselor['name']} \nCounselor Phone: ${counselor['phone']}'),
//                                         );
//
//
//                                       }).toList(),
//                                     );
//                                   }
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//
//                       SizedBox(height: 12),
//                       ListTileButton(
//                         text: '3. I want to cancel the appointment',
//                         onPressed: () {
//                           // Handle Option 3 press
//                         },
//                       ),
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
//
//   Future<List<Map<String, String>>> getCounselors(String orgEmail) async {
//     try {
//       final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('counselors')
//           .where('orgemail', isEqualTo: orgEmail)
//           .get();
//
//       List<Map<String, String>> counselors = [];
//       for (QueryDocumentSnapshot doc in querySnapshot.docs) {
//         final String name = doc['name'];
//         final String phone = doc['phone'];
//         counselors.add({'name': name, 'phone': phone});
//       }
//
//       return counselors;
//     } catch (e) {
//       print('Error fetching counselors: $e');
//       return [];
//     }
//   }
// }
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
       backgroundColor: Color(0xFF255B78), // Make app bar transparent
        title: Text(
          'Notifications Details',
          style: TextStyle(color: Colors.white12),
        ),
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
                          'Options:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        ListTileButton(
                          text: '1. I want to create appointment with another counselor',
                          onPressed: () {
                            setState(() {
                              showRecommendations = true;
                            });
                          },
                        ),
                        if (showRecommendations) ...[
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFAFAFAFA)),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Container(
                            margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.grey[200], // Grey background color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommendations:',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          FutureBuilder<List<Map<String, String>>>(
            future: getCounselors(widget.orgEmail),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No counselors found');
              } else {
                return Column(
                  children: snapshot.data!.map((counselor) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white, // Grey background color
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          String? newCounselorEmail = counselor['email'];
                          print('Selected counselor email: $newCounselorEmail');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Appointment Confirmation"),
                                content: Text("Do you want to create an appointment with ${counselor['name']}?"),
                                actions: [
                                  TextButton(
                                    child: Text("Yes"),
                                    onPressed: () async {
                                      String appointmentDocID = widget.notice['appointmentDocID'];
                                      print('Appointment DocID: $appointmentDocID');
                                      try {
                                        // Update appointment document with chosen counselor's email
                                        DocumentSnapshot counselorSnapshot = await FirebaseFirestore.instance
                                            .collection('counselors')
                                            .doc(newCounselorEmail)
                                            .get();
                                        String newCounselorName = counselorSnapshot.get('name');
                                        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(widget.email)
                                            .get();
                                        String username = userSnapshot.get('name');
                                        await removeAppointmentFromCounselor(widget.counseloremail, appointmentDocID);
                                        await updateAppointmentCounselorEmail(appointmentDocID, newCounselorEmail!);
                                        await updateCounselorAppointments(appointmentDocID, newCounselorEmail!);
                                        await addAppointmentToCounselor(newCounselorEmail, appointmentDocID);
                                        await createCounselorChangedNotice(widget.orgEmail, widget.email, username, newCounselorName, newCounselorEmail, appointmentDocID, widget.counseloremail);
                                        Navigator.of(context).pop();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('Appointment created with ${counselor['name']}'),
                                          ),
                                        );
                                      } catch (error) {
                                        print('Error updating appointment or counselor: $error');
                                        // Handle error accordingly
                                      }
                                    },
                                  ),
                                  TextButton(
                                    child: Text("No"),
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[200]!), // Set background color to grey
                        ),
                        child: Text(
                          'Counselor: ${counselor['name']} \nPhone: ${counselor['phone']}',
                          style: TextStyle(fontSize: 12, color: Colors.black,),
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    ),
                              ],
    ),
                          ),
                        ],
                        ListTileButton(
                          text: '2. I want to cancel the appointment',
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Confirm Delete"),
                                  content: Text("Are you sure you want to delete this appointment?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Close the dialog
                                      },
                                      child: Text("Cancel"),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        // Retrieve the counselor's name from Firestore
                                        DocumentSnapshot counselorSnapshot = await FirebaseFirestore.instance
                                            .collection('counselors')
                                            .doc(widget.counseloremail)
                                            .get();

                                        String counselorName = counselorSnapshot.get('name');

                                        // Retrieve the user's name from Firestore
                                        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(widget.email)
                                            .get();

                                        String username = userSnapshot.get('name');
                                        String appointmentDocID = widget.notice['appointmentDocID'];
                                        deleteAppointment(widget.counseloremail, appointmentDocID); // Call deleteAppointment function
                                        await createAppointmentCancelledNotice(widget.orgEmail, widget.email, username, counselorName, appointmentDocID, widget.counseloremail);

                                        Navigator.of(context).pop(); // Close the dialog after deletion
                                      },
                                      child: Text("Delete"),
                                    ),
                                  ],
                                );

                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<Map<String, String>>> getCounselors(String orgEmail) async {
    try {
      print('Organization Email: $orgEmail'); // Print orgEmail to debug
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('counselors')
          .where('orgemail', isEqualTo: orgEmail)
          .get();

      List<Map<String, String>> counselors = [];
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        final String name = doc['name'];
        final String phone = doc['phone'];
        final String email = doc['email'];
        print('Counselor Name: $name, Phone: $phone, Email: $email'); // Print counselor details to debug
        counselors.add({'name': name, 'phone': phone, 'email': email});
      }

      return counselors;
    } catch (e) {
      print('Error '
          'fetching counselors: $e');
      return [];
    }
  }


  void removeAppointment(String counselorEmail, String appointmentDocID) {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    // Delete appointment from the counselor's appointments array
    DocumentReference counselorRef = FirebaseFirestore.instance.collection('counselors').doc(counselorEmail);
    batch.update(counselorRef, {
      'appointments': FieldValue.arrayRemove([appointmentDocID])
    });

    // Commit the batch
    batch.commit().then((_) {
      print("Appointment deleted successfully");
    }).catchError((error) {
      print("Failed to delete appointment: $error");
    });
  }

  void deleteAppointment(String counselorEmail, String appointmentDocID) {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    // Delete appointment from the appointments collection
    DocumentReference appointmentRef = FirebaseFirestore.instance.collection('appointments').doc(appointmentDocID);
    batch.delete(appointmentRef);
    // Delete appointment from the counselor's appointments array
    DocumentReference counselorRef = FirebaseFirestore.instance.collection('counselors').doc(counselorEmail);
    batch.update(counselorRef, {
      'appointments': FieldValue.arrayRemove([appointmentDocID])
    });
    // Commit the batch
    batch.commit().then((_) {
      print("Appointment deleted successfully");
    }).catchError((error) {
      print("Failed to delete appointment: $error");
    });
  }
  Future<void> removeAppointmentFromCounselor(String counselorEmail, String appointmentDocID) async {
    try {
      print('Counselor Email from which the appointmentDocID is being deleted:$counselorEmail');
      // Get the counselor's document reference
      DocumentReference counselorRef = FirebaseFirestore.instance.collection('counselors').doc(counselorEmail);

      // Remove the appointment document ID from the counselor's appointments array
      await counselorRef.update({
        'appointments': FieldValue.arrayRemove([appointmentDocID])
      });

      print('Appointment removed from counselor successfully.');
    } catch (error) {
      print('Error removing appointment from counselor: $error');
    }
  }

  // Function to update counselor appointments based on changes in the appointments collection
  Future<void> updateCounselorAppointments(String appointmentId, String counselorEmail) async {
    try {
      // Get the counselor's document reference
      DocumentReference counselorDocRef = FirebaseFirestore.instance.collection('counselors').doc(counselorEmail);
      // Fetch the counselor's document
      DocumentSnapshot counselorSnapshot = await counselorDocRef.get();
      if (counselorSnapshot.exists) {
        // Get the current appointments array
        List<dynamic>? appointments = counselorSnapshot['appointments'];
        // Update the appointments array with the new appointment document ID
        if (appointments == null) {
          appointments = [appointmentId];
        } else {
          appointments.add(appointmentId);
        }
        // Set the updated appointments array back to Firestore
        await counselorDocRef.update({
          'appointments': appointments,
        });
        print('Counselor appointments updated successfully!');
      } else {
        print('Counselor document not found.');
      }
    } catch (e) {
      print('Error updating counselor appointments: $e');
    }
  }
  Future<void> updateAppointmentCounselorEmail(String appointmentDocID, String newCounselorEmail) async {
    try {
      // Reference to the appointment document
      DocumentReference appointmentRef = FirebaseFirestore.instance.collection('appointments').doc(appointmentDocID);
      // Update the appointment document with the new counselor's email
      await appointmentRef.update({
        'counseloremail': newCounselorEmail,
      });
      print('Counselor email updated successfully for appointment: $appointmentDocID');
    } catch (error) {
      print('Error updating counselor email for appointment: $error');
    }
  }
  void listenToAppointmentChanges() {
    FirebaseFirestore.instance.collection('appointments').snapshots().listen((snapshot) {
      snapshot.docChanges.forEach((change) {
        if (change.type == DocumentChangeType.modified) {
          Map<String, dynamic> appointmentData = change.doc.data() as Map<String, dynamic>;
          String? counselorEmail = appointmentData['counseloremail'];
          String appointmentId = change.doc.id;

          if (counselorEmail != null) {
            updateCounselorAppointments(appointmentId, counselorEmail);
          }
        }
      });
    });
  }
  Future<void> addAppointmentToCounselor(String counselorEmail, String appointmentDocID) async {
    try {
      // Reference to the counselor document
      DocumentReference counselorRef = FirebaseFirestore.instance.collection('counselors').doc(counselorEmail);

      // Update the counselor document
      await counselorRef.update({
        'appointments': FieldValue.arrayUnion([appointmentDocID])
      });

      print('Appointment added to counselor successfully.');
    } catch (error) {
      print('Error adding appointment to counselor: $error');
    }
  }

  Future<void> createCounselorChangedNotice(String orgId, String useremail, String username, String newCounselorName, String newCounselorEmail, String appointmentDocID, String counseloremail) async {
    try {
      // Get current timestamp
      Timestamp timestamp = Timestamp.now();

      // Create the notice data
      Map<String, dynamic> noticeData = {
        'title': 'Counselor Changed',
        'description': '$newCounselorName assigned to $username\'s appointment',
        'timestamp': timestamp,
        'appointmentDocID': appointmentDocID,
        'newCounselorEmail': newCounselorEmail,
        'counseloremail': counseloremail,
      };

      // Add the notice to the organization's collection
      await FirebaseFirestore.instance.collection('organizations').doc(orgId).update({
        'notices': FieldValue.arrayUnion([noticeData])
      });
    } catch (error) {
      print('Error creating counselor changed notice: $error');
      throw error; // Re-throw the error for handling
    }
  }
  Future<void> createAppointmentCancelledNotice(String orgId, String useremail, String username, String counselorName, String appointmentDocID,  String counseloremail) async {
    try {
      // Get current timestamp
      Timestamp timestamp = Timestamp.now();

      // Create the notice data
      Map<String, dynamic> noticeData = {
        'title': 'Counselor Changed',
        'description': '$username\'s appointment with $counselorName is cancelled.',
        'timestamp': timestamp,
        'appointmentDocID': appointmentDocID,
        'counseloremail': counseloremail,
      };

      // Add the notice to the organization's collection
      await FirebaseFirestore.instance.collection('organizations').doc(orgId).update({
        'notices': FieldValue.arrayUnion([noticeData])
      });
    } catch (error) {
      print('Error creating counselor changed notice: $error');
      throw error; // Re-throw the error for handling
    }
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
