// import 'package:appoiter/organization/organizationregistrationpage.dart';
// import 'package:appoiter/userregistrationpage.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class UserSelectionPage extends StatefulWidget {
//   final String email;
//
//   const UserSelectionPage({Key? key, required this.email}) : super(key: key);
//
//   @override
//   _UserSelectionPageState createState() => _UserSelectionPageState();
// }
//
// class _UserSelectionPageState extends State<UserSelectionPage> {
//   String? selectedUserRole;
//
//   Future<void> saveEmailAndNavigate(String selectedRole) async {
//     final email = widget.email;
//
//     try {
//       // Initialize Firebase if not already initialized
//       await Firebase.initializeApp();
//
//       // Create an instance of FirebaseFirestore
//       final FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//       // Determine the collection based on the selected role
//       String collectionName = (selectedRole == "Organization") ? "organizations" : "users";
//
//       // Save the email in the selected collection
//       await firestore.collection(collectionName).doc(email).set({});
//
//       // Navigate to the appropriate registration page
//       if (selectedRole == "Organization") {
//         // Navigate to the organization registration page
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => OrganizationRegistrationPage(email: widget.email),
//           ),
//         );
//       } else if (selectedRole == "User") {
//         // Navigate to the user registration page
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => UserRegistrationPage(email: widget.email),
//           ),
//         );
//       }
//
//     } catch (e) {
//       // Handle any errors
//       print("Error: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("User Selection"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Select your role:"),
//             Row(
//               children: [
//                 Radio(
//                   value: "Organization",
//                   groupValue: selectedUserRole,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedUserRole = value as String?;
//                     });
//                   },
//                 ),
//                 Text("Organization"),
//               ],
//             ),
//             Row(
//               children: [
//                 Radio(
//                   value: "User",
//                   groupValue: selectedUserRole,
//                   onChanged: (value) {
//                     setState(() {
//                       selectedUserRole = value as String?;
//                     });
//                   },
//                 ),
//                 Text("User"),
//               ],
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (selectedUserRole != null) {
//                   // Save the email and navigate to the appropriate registration page
//                   saveEmailAndNavigate(selectedUserRole!);
//                 } else {
//                   // Show a message indicating that a role must be selected
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                     content: Text("Please select a role"),
//                   ));
//                 }
//               },
//               child: Text("Continue"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:appoiter/organization/organizationregistrationpage.dart';
import 'package:appoiter/user/userregistrationpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserSelectionPage extends StatefulWidget {
  final String email;

  const UserSelectionPage({Key? key, required this.email}) : super(key: key);

  @override
  _UserSelectionPageState createState() => _UserSelectionPageState();
}

class _UserSelectionPageState extends State<UserSelectionPage> {
  String? selectedUserRole;

  // Future<void> saveEmailAndNavigate(String selectedRole) async {
  //   final email = widget.email;
  //
  //   try {
  //     // Initialize Firebase if not already initialized
  //     await Firebase.initializeApp();
  //
  //     // Create an instance of FirebaseFirestore
  //     final FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //     // Determine the collection based on the selected role
  //     String collectionName = (selectedRole == "Organization") ? "organizations" : "users";
  //
  //     // Save the email in the selected collection
  //     await firestore.collection(collectionName).doc(email).set({});
  //
  //
  //     // Navigate to the appropriate registration page
  //     if (selectedRole == "Organization") {
  //       // Navigate to the organization registration page
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (_) => OrganizationRegistrationPage(email: email),
  //         ),
  //       );
  //     } else if (selectedRole == "User") {
  //       // Navigate to the user registration page
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (_) => UserRegistrationPage(email: email),
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     // Handle any errors
  //     print("Error: $e");
  //   }
  // }

  Future<void> navigateToRegistration(String selectedRole) async {
    final email = widget.email;
    if (selectedRole == "Organization") {
      // Navigate to the organization registration page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OrganizationRegistrationPage(email: email),
        ),
      );
    } else if (selectedRole == "User") {
      // Navigate to the user registration page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => UserRegistrationPage(email: email),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Selection"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Select your role:"),
            ListTile(
              title: Text("Organization"),
              leading: Radio(
                value: "Organization",
                groupValue: selectedUserRole,
                onChanged: (value) {
                  setState(() {
                    selectedUserRole = value as String;
                  });
                },
              ),
            ),
            ListTile(
              title: Text("User"),
              leading: Radio(
                value: "User",
                groupValue: selectedUserRole,
                onChanged: (value) {
                  setState(() {
                    selectedUserRole = value as String;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedUserRole != null) {
                  // Save the email and navigate to the appropriate registration page
                  navigateToRegistration(selectedUserRole!);
                } else {
                  // Show a message indicating that a role must be selected
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Please select a role"),
                  ));
                }
              },
              child: Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}