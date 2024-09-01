// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'orgnavbar.dart'; // Import the OrgNavBar widget
// //
// // class OrgProfilePage extends StatefulWidget {
// //   final String email;
// //
// //   OrgProfilePage({required this.email});
// //
// //   @override
// //   State<OrgProfilePage> createState() => _OrgProfilePageState();
// // }
// //
// // class _OrgProfilePageState extends State<OrgProfilePage> {
// //   int _selectedIndex = 3;
// //
// //   void _handleTabChange(int index) {
// //     // Use the same logic for tab change as defined in OrgNavBar
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //     OrgNavBar.navigateToPage(context, index, widget.email);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Organization Profile'),
// //       ),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: Center(
// //               child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
// //                 future: FirebaseFirestore.instance
// //                     .collection('organizations')
// //                     .doc(widget.email)
// //                     .get(),
// //                 builder: (context, snapshot) {
// //                   if (snapshot.connectionState == ConnectionState.waiting) {
// //                     return CircularProgressIndicator();
// //                   }
// //
// //                   if (snapshot.hasError) {
// //                     return Text('Error: ${snapshot.error}');
// //                   }
// //
// //                   if (!snapshot.hasData || snapshot.data == null) {
// //                     return Text('Organization details not found.');
// //                   }
// //
// //                   final data = snapshot.data!.data();
// //
// //                   return Padding(
// //                     padding: const EdgeInsets.all(16.0),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           'Organization Name: ${data?['name']}',
// //                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //                         ),
// //                         SizedBox(height: 10),
// //                         Text('Phone Number: ${data?['contact']}'),
// //                         SizedBox(height: 10),
// //                         Text('Address: ${data?['address']}'),
// //                         SizedBox(height: 10),
// //                         Text('Organization Type: ${data?['orgType']}'),
// //                         SizedBox(height: 10),
// //                         Text('Opening Time: ${data?['openingTime']}'),
// //                         SizedBox(height: 10),
// //                         Text('Closing Time: ${data?['closingTime']}'),
// //                         // Add more details as needed
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
// //           OrgNavBar(
// //             selectedIndex: _selectedIndex,
// //             onTabChange: _handleTabChange,
// //             email: widget.email,
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'orgnavbar.dart'; // Import the OrgNavBar widget
//
// class OrgProfilePage extends StatefulWidget {
//   final String email;
//
//   OrgProfilePage({required this.email});
//
//   @override
//   State<OrgProfilePage> createState() => _OrgProfilePageState();
// }
//
// class _OrgProfilePageState extends State<OrgProfilePage> {
//   int _selectedIndex = 3;
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in OrgNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     OrgNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   void _logout() {
//     // Implement your logout logic here
//     // For example, you can navigate to the login page and clear user data
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey, // Add the GlobalKey to the Scaffold
//       appBar: AppBar(
//         title: Text('Organization Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.menu), // Change the icon as needed
//             onPressed: () {
//               // Open the drawer using the GlobalKey when the menu button is pressed
//               _scaffoldKey.currentState?.openEndDrawer();
//             },
//           ),
//         ],
//       ),
//       endDrawer: Drawer(
//         // Add the content you want in the drawer
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Text(
//                 'MENU',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               title: Text('Edit Profile'),
//               onTap: () {
//                 // Add functionality for the drawer item
//               },
//             ),
//             ListTile(
//               title: Text('Settings'),
//               onTap: () {
//                 // Add functionality for the drawer item
//               },
//             ),
//             ListTile(
//               title: Text('Logout'),
//               onTap: () {
//                 // Call the logout function when the Logout item is tapped
//                 _logout();
//               },
//             ),
//             // Add more items as needed
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//                 future: FirebaseFirestore.instance
//                     .collection('organizations')
//                     .doc(widget.email)
//                     .get(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   }
//
//                   if (snapshot.hasError) {
//                     return Text('Error: ${snapshot.error}');
//                   }
//
//                   if (!snapshot.hasData || snapshot.data == null) {
//                     return Text('Organization details not found.');
//                   }
//
//                   final data = snapshot.data!.data();
//
//                   return Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Organization Name: ${data?['name']}',
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Text('Phone Number: ${data?['contact']}'),
//                         SizedBox(height: 10),
//                         Text('Address: ${data?['address']}'),
//                         SizedBox(height: 10),
//                         Text('Organization Type: ${data?['orgType']}'),
//                         SizedBox(height: 10),
//                         Text('Opening Time: ${data?['openingTime']}'),
//                         SizedBox(height: 10),
//                         Text('Closing Time: ${data?['closingTime']}'),
//                         // Add more details as needed
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           OrgNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:appoiter/organization/editprofilepage.dart';
import 'package:appoiter/organization/orgnavbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:appoiter/home.dart'; // Import the Home widget

class OrgProfilePage extends StatefulWidget {
  final String email;

  OrgProfilePage({required this.email});

  @override
  State<OrgProfilePage> createState() => _OrgProfilePageState();
}

class _OrgProfilePageState extends State<OrgProfilePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn(); // Add this line
  FirebaseAuth _auth = FirebaseAuth.instance; // Add this line
  int _selectedIndex = 3;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleTabChange(int index) {
    // Use the same logic for tab change as defined in OrgNavBar
    setState(() {
      _selectedIndex = index;
    });
    OrgNavBar.navigateToPage(context, index, widget.email);
  }

  void _logout() async {
    // Display a confirmation dialog
    bool confirmLogout = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // No, do not logout
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () async {
                // Call the signOut function when the Yes button is tapped
                await signOut(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()));
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
      Navigator.pop(context); // Pop the current screen
    } catch (e) {
      print("Error during sign out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Add the GlobalKey to the Scaffold
      appBar: AppBar(
        backgroundColor: Color(0xFF255B78), // Make app bar transparent
        elevation: 0, // Remove shadow/ Let the AppBar handle the back button automatically

        title: Text(
          'Profile',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white), // Change the icon as needed
            onPressed: () {
              // Open the drawer using the GlobalKey when the menu button is pressed
              _logout();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: Center(
          //     child: Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          //         future: FirebaseFirestore.instance
          //             .collection('organizations')
          //             .doc(widget.email)
          //             .get(),
          //         builder: (context, snapshot) {
          //           if (snapshot.connectionState == ConnectionState.waiting) {
          //             return CircularProgressIndicator();
          //           }
          //
          //           if (snapshot.hasError) {
          //             return Text(
          //               'Error: ${snapshot.error}',
          //               style: TextStyle(color: Colors.red),
          //             );
          //           }
          //
          //           if (!snapshot.hasData || snapshot.data == null) {
          //             return Text(
          //               'Organization details not found.',
          //               style: TextStyle(color: Colors.red),
          //             );
          //           }
          //
          //           final data = snapshot.data!.data();
          //
          //           return Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               ListTile(
          //                 // subtitle: Text(
          //                 //   'Organization Name:',
          //                 //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //                 // ),
          //                 title: Text(
          //                   '${data?['name']}',
          //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //                 ),
          //
          //
          //               ),
          //
          //               ListTile(
          //                 // subtitle: Text(
          //                 //   'Address:',
          //                 //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //                 // ),
          //                 title: Text(
          //                   'Address: ${data?['address']}',
          //                   style: TextStyle(fontSize: 12),
          //                 ),
          //               ),
          //               ListTile(
          //                 title: Text(
          //                   'Contact: ${data?['contact']}',
          //                   style: TextStyle(fontSize: 12),
          //                 ),
          //
          //               ),
          //               // ListTile(
          //               //   // subtitle: Text(
          //               //   //   'Organization Type:',
          //               //   //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //               //   // ),
          //               //   title: Text(
          //               //     '${data?['orgType']}',
          //               //     style: TextStyle(fontSize: 12),
          //               //   ),
          //               // ),
          //               ListTile(
          //                 title: Text('Opening Time:${data?['openingTime']}',
          //                   style: TextStyle(fontSize: 12),
          //                 ),
          //               ),
          //               ListTile(
          //                 title:Text(
          //                   'Closing Time: ${data?['closingTime']}',
          //                   style: TextStyle(fontSize: 12),
          //                 ),
          //               ),
          //               // Add more details as needed
          //             ],
          //           );
          //         },
          //       ),
          //     ),
          //   ),
          // ),

          Expanded(
            child: Center(
              child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection('organizations')
                    .doc(widget.email)
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  }

                  if (!snapshot.hasData || snapshot.data == null) {
                    return Text('Users details not found.');
                  }

                  final data = snapshot.data!.data();

                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/building.png', // Replace with your image asset
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.fill, // Use BoxFit.fill instead of BoxFit.fitXY
                          ),
                        ),
                        SizedBox(height: 50.0),
                        Text(
                          '   Institution Information',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.0),
                        ProfileInfoRow(label: 'Name', value: data?['name'] ?? ''),
                        ProfileInfoRow(label: 'Email', value: widget.email),
                        ProfileInfoRow(label: 'Contact', value: data?['contact'] ?? ''),
                        ProfileInfoRow(label: 'Opening Time', value: data?['openingTime'] ?? ''),
                        ProfileInfoRow(label: 'Closing Time', value: data?['closingTime'] ?? ''),                        SizedBox(height: 16.0),
                        // Favorites button

                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          OrgNavBar(
            selectedIndex: _selectedIndex,
            onTabChange: _handleTabChange,
            email: widget.email,
          ),// OrgNavBar widget and its logic
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
