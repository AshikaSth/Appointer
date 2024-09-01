// import 'package:flutter/material.dart';
// import 'usernavbar.dart'; // Import the UserNavBar widget
//
// class UserProfilePage extends StatefulWidget {
//   final String email;
//
//   UserProfilePage({required this.email});
//
//   @override
//   State<UserProfilePage> createState() => _UserProfilePageState();
// }
//
// class _UserProfilePageState extends State<UserProfilePage> {
//   int _selectedIndex = 3;
//
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in UserNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     UserNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Profile'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     'Email: ${widget.email}',
//                     style: TextStyle(fontSize: 20),
//                   ),
//                   // Add other content specific to the Organization's home page here
//                 ],
//               ),
//             ),
//           ),
//           UserNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:appoiter/user/userfavorites.dart';
// import 'package:appoiter/user/usernavbar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:appoiter/home.dart'; // Import the Home widget
//
// class UserProfilePage extends StatefulWidget {
//   final String email;
//
//   UserProfilePage({required this.email});
//
//   @override
//   State<UserProfilePage> createState() => _UserProfilePageState();
// }
//
// class _UserProfilePageState extends State<UserProfilePage> {
//   GoogleSignIn _googleSignIn = GoogleSignIn(); // Add this line
//   FirebaseAuth _auth = FirebaseAuth.instance; // Add this line
//   int _selectedIndex = 3;
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in UserNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     UserNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   void _logout() async {
//     // Display a confirmation dialog
//     bool confirmLogout = await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Logout'),
//           content: Text('Are you sure you want to logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(false); // No, do not logout
//               },
//               child: Text('No'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 // Call the signOut function when the Yes button is tapped
//                 await signOut(context);
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => Home()));
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
//       Navigator.pop(context); // Pop the current screen
//     } catch (e) {
//       print("Error during sign out: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey, // Add the GlobalKey to the Scaffold
//       // appBar: AppBar(
//       //   title: Text('User Profile'),
//       //   actions: [
//       //     IconButton(
//       //       icon: Icon(Icons.menu), // Change the icon as needed
//       //       onPressed: () {
//       //         // Open the drawer using the GlobalKey when the menu button is pressed
//       //         _scaffoldKey.currentState?.openEndDrawer();
//       //       },
//       //     ),
//       //   ],
//       // ),
//       appBar: AppBar(
//        // backgroundColor: Color(0xFF255B78), // Make app bar transparent
//         elevation: 0, // Remove shadow
//         automaticallyImplyLeading: true,
//         backgroundColor: Color(0xFF255B78), // Let the AppBar handle the back button automatically
//         title: Text(
//           'Profile',
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout, color: Colors.white), // Change the icon as needed
//             onPressed: () {
//               // Open the drawer using the GlobalKey when the menu button is pressed
//               _logout();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//                 future: FirebaseFirestore.instance
//                     .collection('users')
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
//                     return Text('Users details not found.');
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
//                           '${data?['name']}',
//                           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(height: 10),
//                         Text('Phone Number: ${data?['phoneNumber']}'),
//                         SizedBox(height: 10),
//                         Text('Date oF birth: ${data?['dob']}'),
//                         SizedBox(height: 10),
//                         Text('Gender: ${data?['gender']}'),
//                         SizedBox(height: 10),
//                         // Add more details as needed
//                     // Favorites button
//                     TextButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => UserFavorites(email: widget.email)),
//                         );
//                       },
//                       icon: Icon(Icons.favorite),
//                       label: Text(
//                         '${data?['favorites']?.length ?? 0}', // Assuming 'favorites' is an array of emails in your data
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           UserNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),// UserNavBar widget and its logic
//         ],
//       ),
//     );
//   }
// }
// import 'package:appoiter/user/userfavorites.dart';
// import 'package:appoiter/user/usernavbar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:appoiter/home.dart'; // Import the Home widget
//
// class UserProfilePage extends StatefulWidget {
//   final String email;
//
//   UserProfilePage({required this.email});
//
//   @override
//   State<UserProfilePage> createState() => _UserProfilePageState();
// }
//
// class _UserProfilePageState extends State<UserProfilePage> {
//   GoogleSignIn _googleSignIn = GoogleSignIn(); // Add this line
//   FirebaseAuth _auth = FirebaseAuth.instance; // Add this line
//   int _selectedIndex = 3;
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void _handleTabChange(int index) {
//     // Use the same logic for tab change as defined in UserNavBar
//     setState(() {
//       _selectedIndex = index;
//     });
//     UserNavBar.navigateToPage(context, index, widget.email);
//   }
//
//   void _logout() async {
//     // Display a confirmation dialog
//     bool confirmLogout = await showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Logout'),
//           content: Text('Are you sure you want to logout?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(false); // No, do not logout
//               },
//               child: Text('No'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 // Call the signOut function when the Yes button is tapped
//                 await signOut(context);
//                 Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => Home()));
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
//       Navigator.pop(context); // Pop the current screen
//     } catch (e) {
//       print("Error during sign out: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey, // Add the GlobalKey to the Scaffold
//       appBar: AppBar(
//         title: Text('Profile'),
//         backgroundColor: Color(0xFF255B78), // Let the AppBar handle the back button automatically
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout, color: Colors.white), // Change the icon as needed
//             onPressed: () {
//               // Open the drawer using the GlobalKey when the menu button is pressed
//               _logout();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
//                 future: FirebaseFirestore.instance
//                     .collection('users')
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
//                     return Text('Users details not found.');
//                   }
//
//                   final data = snapshot.data!.data();
//
//                   return Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: Image.asset(
//                             'assets/profile.png', // Replace with your image asset
//                             width: 100.0,
//                             height: 100.0,
//                             fit: BoxFit.fill, // Use BoxFit.fill instead of BoxFit.fitXY
//                           ),
//                         ),
//                         SizedBox(height: 50.0),
//                         Text(
//                           '   Personal Information',
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 16.0,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: 16.0),
//                         ProfileInfoRow(label: 'Name', value: data?['name'] ?? ''),
//                         ProfileInfoRow(label: 'Email', value: widget.email),
//                         ProfileInfoRow(label: 'Phone Number', value: data?['phoneNumber'] ?? ''),
//                         ProfileInfoRow(label: 'Date of Birth', value: data?['dob'] ?? ''),
//                         ProfileInfoRow(label: 'Address', value: data?['address'] ?? ''),
//                         SizedBox(height: 16.0),
//                         // Favorites button
//                         TextButton.icon(
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(builder: (context) => UserFavorites(email: widget.email)),
//                             );
//                           },
//                           icon: Icon(Icons.favorite),
//                           label: Text(
//                             'Favourites: ${data?['favorites']?.length ?? 0}', // Assuming 'favorites' is an array of emails in your data
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           UserNavBar(
//             selectedIndex: _selectedIndex,
//             onTabChange: _handleTabChange,
//             email: widget.email,
//           ),// UserNavBar widget and its logic
//         ],
//       ),
//     );
//   }
// }
//
// class ProfileInfoRow extends StatelessWidget {
//   final String label;
//   final String value;
//
//   ProfileInfoRow({required this.label, required this.value});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 27.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 14.0,
//             ),
//           ),
//           SizedBox(width: 10.0),
//           Expanded(
//             child: Text(
//               value,
//               textAlign: TextAlign.end,
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 14.0,
//                 fontFamily: 'OpenSansSemibold',
//               ),
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
import 'package:google_sign_in/google_sign_in.dart';
import 'userfavorites.dart';
import 'usernavbar.dart';
import 'package:appoiter/home.dart'; // Import the Home widget

class UserProfilePage extends StatefulWidget {
  final String email;

  UserProfilePage({required this.email});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 3;

  GoogleSignIn _googleSignIn = GoogleSignIn(); // Add this line
  FirebaseAuth _auth = FirebaseAuth.instance; // Add this line


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Add the GlobalKey to the Scaffold
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xFF255B78), // Let the AppBar handle the back button automatically
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
          Expanded(
            child: Center(
              child: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: FirebaseFirestore.instance
                    .collection('users')
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
                    padding: const EdgeInsets.all(16.0),
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
                          '   Personal Information',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.0),
                        ProfileInfoRow(label: 'Name', value: data?['name'] ?? ''),
                        ProfileInfoRow(label: 'Email', value: widget.email),
                        ProfileInfoRow(label: 'Contact', value: data?['phoneNumber'] ?? ''),
                        ProfileInfoRow(label: 'DOB', value: data?['dob'] ?? ''),
                        ProfileInfoRow(label: 'Address', value: data?['address'] ?? ''),
                        SizedBox(height: 16.0),
                        // Favorites button

                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          UserNavBar(
            email: widget.email, selectedIndex: _selectedIndex,
            onTabChange: _handleTabChange,
          ),// UserNavBar widget and its logic
        ],
      ),
    );
  }
  void _handleTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
    UserNavBar.navigateToPage(context, index, widget.email);
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
