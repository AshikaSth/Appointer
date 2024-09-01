// import 'package:appoiter/counselors/counselornavbar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:appoiter/home.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class CounselorProfilePage extends StatefulWidget {
//   final String email;
//
//   CounselorProfilePage({required this.email});
//
//   @override
//   State<CounselorProfilePage> createState() => _CounselorProfilePageState();
// }
//
// class _CounselorProfilePageState extends State<CounselorProfilePage> {
//   GoogleSignIn _googleSignIn = GoogleSignIn();
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   int _selectedIndex = 3;
//   bool isActive = true;
//   String openingTime = '';
//   String closingTime = '';
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   void initState() {
//     super.initState();
//     // Initialize isActive from Firebase when the widget is created
//     FirebaseFirestore.instance
//         .collection('counselors')
//         .doc(widget.email)
//         .get()
//         .then((snapshot) {
//       if (snapshot.exists) {
//         setState(() {
//           isActive = snapshot.data()?['isActive'] ?? true;
//         });
//       }
//     });
//   }
//
//
//   void _handleTabChange(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     CounselorNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   void _logout() async {
//     bool confirmLogout = await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Logout'),
//           content: Text('Are you sure you want to logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(false);
//               },
//               child: Text('No'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 await signOut(context);
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => Home()),
//                 );
//               },
//               child: Text('Yes'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Future<void> signOut(BuildContext context) async {
//     try {
//       await _googleSignIn.signOut();
//       await _auth.signOut();
//       Navigator.pop(context);
//     } catch (e) {
//       print("Error during sign out: $e");
//     }
//   }
//
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
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor:  Color(0xFF255B78), // Make app bar transparent
//         title: Text('Profile',),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout, color: Colors.white), // Change the icon as needed
//             onPressed: () {
//               _logout();
//             },
//           ),
//         ],
//       ),
//
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//                   future: FirebaseFirestore.instance
//                       .collection('counselors')
//                       .doc(widget.email)
//                       .get(),
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
//                         'Organization details not found.',
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
//                             '${data?['name']}',
//                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                         ListTile(
//                           title: FutureBuilder<DocumentSnapshot>(
//                             future: FirebaseFirestore.instance.collection('organizations').doc(data?['orgemail']).get(),
//                             builder: (context, snapshot) {
//                               if (snapshot.connectionState == ConnectionState.waiting) {
//                                 return Text('Loading...'); // Display a loading indicator while fetching data
//                                 }
//                               if (snapshot.hasError) {
//                                 return Text('Error: ${snapshot.error}'); // Display an error message if there's an error
//                               }
//                               if (!snapshot.hasData || !snapshot.data!.exists) {
//                                 return Text('Organization not found'); // Handle the case where organization data is not found
//                                 }
//                         // Extract organization name from the retrieved document
//                               String orgName = snapshot.data!.get('name');
//                               return Text(
//                                 'Organization: $orgName',
//                                 style: TextStyle(fontSize: 16),
//                               );
//                               },
//                           ),
//                         ),
//
//                         GestureDetector(
//                           onTap: () {
//                             launch('tel:${data?['phone']}');
//                           },
//                           child: ListTile(
//                             title: Text(
//                               'Phone Number: ${data?['phone']}',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                         ListTile(
//                           title: Text(
//                             'Email: ${data?['email']}',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                         ListTile(
//
//                           title: Text(
//                             '${data?['orgemail']}',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//
//                         // Add more details as needed
//                       ],
//                     );
//                   },
//                 ),
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
//                   activeColor: Color(0xFF255B78), // Set the color of the switch when toggled on
//                 ),
//               ],
//             ),
//           ),
//           CounselorNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:appoiter/counselors/counselornavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:appoiter/home.dart';
import 'package:url_launcher/url_launcher.dart';

class CounselorProfilePage extends StatefulWidget {
  final String email;

  CounselorProfilePage({required this.email});

  @override
  State<CounselorProfilePage> createState() => _CounselorProfilePageState();
}

class _CounselorProfilePageState extends State<CounselorProfilePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;
  int _selectedIndex = 3;
  bool isActive = true;
  String openingTime = '';
  String closingTime = '';

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Initialize isActive from Firebase when the widget is created
    FirebaseFirestore.instance
        .collection('counselors')
        .doc(widget.email)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          isActive = snapshot.data()?['isActive'] ?? true;
        });
      }
    });
  }

  void _handleTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    CounselorNavBar.navigateToPage(context, index, widget.email);
  }

  void _logout() async {
    bool confirmLogout = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                await signOut(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      Navigator.pop(context);
    } catch (e) {
      print("Error during sign out: $e");
    }
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
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78),
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              _logout();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            Center(
              child: Image.asset(
                'assets/profile.png', // Replace with your image asset
                width: 100.0,
                height: 100.0,
                fit: BoxFit.fill, // Use BoxFit.fill instead of BoxFit.fitXY
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 16.0),
                  FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance.collection('counselors').doc(widget.email).get(),
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

                      if (!snapshot.hasData || !snapshot.data!.exists) {
                        return Text(
                          'Counselor details not found.',
                          style: TextStyle(color: Colors.red),
                        );
                      }

                      final counselorData = snapshot.data!.data();

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileInfoRow(label: 'Name', value: (counselorData as Map<String, dynamic>)['name'] as String? ?? ''),
                          ProfileInfoRow(label: 'Email', value: widget.email),
                          ProfileInfoRow(label: 'Phone Number', value: (counselorData as Map<String, dynamic>)['phone'] as String? ?? ''),
                          ProfileInfoRow(label: 'Address', value: (counselorData as Map<String, dynamic>)['address'] as String? ?? ''),

                          SizedBox(height: 16.0),
                          Text(
                            'Organizational Information',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(height: 16.0),
                          FutureBuilder<DocumentSnapshot>(
                            future: FirebaseFirestore.instance.collection('organizations').doc((counselorData as Map<String, dynamic>)['orgemail']).get(),
                            builder: (context, orgSnapshot) {
                              if (orgSnapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }

                              if (orgSnapshot.hasError) {
                                return Text(
                                  'Error: ${orgSnapshot.error}',
                                  style: TextStyle(color: Colors.red),
                                );
                              }

                              if (!orgSnapshot.hasData || !orgSnapshot.data!.exists) {
                                return Text(
                                  'Organization details not found.',
                                  style: TextStyle(color: Colors.red),
                                );
                              }

                              final orgData = orgSnapshot.data!.data();

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ProfileInfoRow(label: 'Organization Name', value: (orgData as Map<String, dynamic>)['name'] as String? ?? ''),
                                  ProfileInfoRow(label: 'Organization Contact', value: (orgData as Map<String, dynamic>)['contact'] as String? ?? ''),
                                  ProfileInfoRow(label: 'Organization Address', value: (orgData as Map<String, dynamic>)['address'] as String? ?? ''),
                                  ProfileInfoRow(label: 'Organization Type', value: (orgData as Map<String, dynamic>)['orgType'] as String? ?? ''),

                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 25.0),
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: CounselorNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _handleTabChange,
        email: widget.email,
      ),
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  ProfileInfoRow({required this.label, this.value = ''});

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
