// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UserAppointmentsPage extends StatefulWidget {
//   final String userEmail;
//
//   UserAppointmentsPage({required this.userEmail});
//
//   @override
//   _UserAppointmentsPageState createState() => _UserAppointmentsPageState();
// }
//
// class _UserAppointmentsPageState extends State<UserAppointmentsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Appointments'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('appointments')
//             .where('useremail', isEqualTo: widget.userEmail)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           }
//
//           if (!snapshot.hasData) {
//             return Center(
//               child: Text('No data received from Firestore.'),
//             );
//           }
//
//           var documents = snapshot.data!.docs;
//
//           return ListView.builder(
//             itemCount: documents.length,
//             itemBuilder: (context, index) {
//               var document = documents[index];
//               print('Document ID: ${document.id}');
//               print('Document Data: ${document.data()}');
//
//               return FutureBuilder(
//                 future: FirebaseFirestore.instance
//                     .collection('organizations')
//                     .doc(document['orgemail'])
//                     .get(),
//                 builder: (context, orgSnapshot) {
//                   if (orgSnapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   }
//
//                   if (!orgSnapshot.hasData) {
//                     return Center(
//                       child: Text('No organization data received.'),
//                     );
//                   }
//
//                   var orgName = orgSnapshot.data!['name'];
//
//                   return FutureBuilder(
//                     future: FirebaseFirestore.instance
//                         .collection('counselors')
//                         .doc(document['counseloremail'])
//                         .get(),
//                     builder: (context, counselorSnapshot) {
//                       if (counselorSnapshot.connectionState ==
//                           ConnectionState.waiting) {
//                         return CircularProgressIndicator();
//                       }
//
//                       if (!counselorSnapshot.hasData) {
//                         return Center(
//                           child: Text('No counselor data received.'),
//                         );
//                       }
//
//                       var counselorName =
//                       counselorSnapshot.data!['name'];
//
//                       return ElevatedButton(
//                         onPressed: () {
//                           // Navigate to AppointmentDetailsPage with the appointment data
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => AppointmentDetailsPage(
//                                 orgName: orgName,
//                                 counselorName: counselorName,
//                                 // Add more data as needed
//                               ),
//                             ),
//                           );
//                         },
//                         child: ListTile(
//                           title: Text('$orgName'),
//                           subtitle: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Counselor: $counselorName'),
//                               // Add more details as needed
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// class AppointmentDetailsPage extends StatelessWidget {
//   final String orgName;
//   final String counselorName;
//
//   AppointmentDetailsPage({required this.orgName, required this.counselorName});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appointment Details'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text('Organization: $orgName'),
//           Text('Counselor: $counselorName'),
//           // Add more details as needed
//         ],
//       ),
//     );
//   }
// }
import 'package:appoiter/user/usernavbar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'appointmentdetails.dart';

class UserAppointmentsPage extends StatefulWidget {
  final String userEmail;

  UserAppointmentsPage({required this.userEmail});

  @override
  _UserAppointmentsPageState createState() => _UserAppointmentsPageState();
}

class _UserAppointmentsPageState extends State<UserAppointmentsPage> {
  int _selectedIndex = 1;

  void _handleTabChange(int index) {
    // Use the same logic for tab change as defined in UserNavBar
    setState(() {
      _selectedIndex = index;
    });
    UserNavBar.navigateToPage(context, index, widget.userEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78),
        title: Text(
          'Your Appointments',
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('appointments')
                  .where('useremail', isEqualTo: widget.userEmail)

                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (!snapshot.hasData) {
                  return Center(
                    child: Text('No data received from Firestore.'),
                  );
                }

                var documents = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    var document = documents[index];
                    print('Document ID: ${document.id}');
                    print('Document Data: ${document.data()}');

                    return FutureBuilder(
                      future: FirebaseFirestore.instance
                          .collection('organizations')
                          .doc(document['orgemail'])
                          .get(),
                      builder: (context, orgSnapshot) {
                        if (orgSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (!orgSnapshot.hasData) {
                          return Center(
                            child: Text('No organization data received.'),
                          );
                        }

                        var orgName = orgSnapshot.data!['name'];

                        return FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection('counselors')
                              .doc(document['counseloremail'])
                              .get(),
                          builder: (context, counselorSnapshot) {
                            if (counselorSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }

                            if (!counselorSnapshot.hasData) {
                              return Center(
                                child: Text('No counselor data received.'),
                              );
                            }

                            var counselorName =
                            counselorSnapshot.data!['name'];
                            var counselorEmail =
                            counselorSnapshot.data!['email'];

                            return AppointmentListItem(
                              orgName: orgName,
                              counselorName: counselorName,
                              appointmentDocID: document.id,
                              counselorEmail: counselorEmail,
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          UserNavBar(
            selectedIndex: _selectedIndex,
            onTabChange: _handleTabChange,
            email: widget.userEmail,
          ),
        ],
      ),
    );
  }

  void deleteAppointment(String counselorEmail, String appointmentDocID) {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    // Delete appointment from the appointments collection
    DocumentReference appointmentRef =
    FirebaseFirestore.instance.collection('appointments').doc(appointmentDocID);
    batch.delete(appointmentRef);

    // Delete appointment from the counselor's appointments array
    DocumentReference counselorRef =
    FirebaseFirestore.instance.collection('counselors').doc(counselorEmail);
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
}

class AppointmentListItem extends StatelessWidget {
  final String orgName;
  final String counselorName;
  final String appointmentDocID;
  final String counselorEmail;

  const AppointmentListItem({
    required this.orgName,
    required this.counselorName,
    required this.appointmentDocID,
    required this.counselorEmail,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance
          .collection('appointments')
          .doc(appointmentDocID)
          .get(),
      builder: (context, appointmentSnapshot) {
        if (appointmentSnapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (!appointmentSnapshot.hasData) {
          return Center(
            child: Text('No appointment data received.'),
          );
        }

        var appointmentData = appointmentSnapshot.data!.data();
        var appointmentDate = appointmentData?['appointmentDate']; // Add null check here

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
                          builder: (context) => AppointmentDetails(
                            orgName: orgName,
                            counselorName: counselorName,
                            appointmentDocID: appointmentDocID,
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
                      title: Text('$orgName'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('With $counselorName'),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
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
                              onPressed: () {
                                deleteAppointment(counselorEmail, appointmentDocID); // Call deleteAppointment function
                                Navigator.of(context).pop(); // Close the dialog after deletion
                              },
                              child: Text("Delete"),
                            ),
                          ],
                        );
                      },
                    );
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
                      Icons.delete,
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

  void deleteAppointment(String counselorEmail, String appointmentDocID) {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    DocumentReference appointmentRef =
    FirebaseFirestore.instance.collection('appointments').doc(appointmentDocID);
    batch.delete(appointmentRef);

    DocumentReference counselorRef =
    FirebaseFirestore.instance.collection('counselors').doc(counselorEmail);
    batch.update(counselorRef, {
      'appointments': FieldValue.arrayRemove([appointmentDocID])
    });

    batch.commit().then((_) {
      print("Appointment deleted successfully");
    }).catchError((error) {
      print("Failed to delete appointment: $error");
    });
  }
}
