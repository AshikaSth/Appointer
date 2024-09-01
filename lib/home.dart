// // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // import 'package:firebase_core/firebase_core.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:google_sign_in/google_sign_in.dart';
// // // // import 'profilepage.dart';
// // // // class Home extends StatefulWidget {
// // // //   const Home({super.key});
// // // //   @override
// // // //   State<Home> createState() => _HomeState();
// // // // }
// // // //
// // // // class _HomeState extends State<Home> {
// // // //   Future<void> signInWithGoogle() async{
// // // //     try {
// // // //       // Initialize Firebase if not already initialized
// // // //       await Firebase.initializeApp();
// // // //
// // // //       // Create an instance of Firebase auth and Google Sign-In
// // // //       final FirebaseAuth auth = FirebaseAuth.instance;
// // // //       final GoogleSignIn googleSignIn = GoogleSignIn();
// // // //       // Define _firestore as an instance of FirebaseFirestore
// // // //       final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // //
// // // //       // Trigger the authentication flow
// // // //       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
// // // //       if (googleUser == null) {
// // // //         // User canceled the sign-in
// // // //         return;
// // // //       }
// // // //
// // // //       // Obtain the auth details from the request
// // // //       final GoogleSignInAuthentication googleAuth = await googleUser
// // // //           .authentication;
// // // //
// // // //       // Create new credentials
// // // //       final AuthCredential credential = GoogleAuthProvider.credential(
// // // //         accessToken: googleAuth.accessToken,
// // // //         idToken: googleAuth.idToken,
// // // //       );
// // // //
// // // //       // Sign in the user with credentials
// // // //       final UserCredential userCredential = await auth.signInWithCredential(
// // // //           credential);
// // // //
// // // //       final String? email = userCredential.user!
// // // //           .email; // Obtain the user's email
// // // //
// // // //       // Check if the user document exists in the "user" collection
// // // //       final DocumentSnapshot userDoc = await _firestore.collection('user').doc(
// // // //           email).get();
// // // //
// // // //       if (userDoc.exists) {
// // // //         // User already exists, direct them to ProfilePage
// // // //         Navigator.push(
// // // //             context, MaterialPageRoute(builder: (_) => ProfilePage()));
// // // //       } else {
// // // //         // User doesn't exist, direct them to RegistrationPage
// // // //         Navigator.push(
// // // //             context, MaterialPageRoute(builder: (_) => RegistrationPage()));
// // // //       }
// // // //     } catch (e) {
// // // //       // Handle any errors that occur during the sign-in process
// // // //       print("Error: $e");
// // // //     }
// // // //   }
// // // //   }
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title:const Text("Google Sign"),
// // // //         centerTitle: true,
// // // //       ),
// // // //       body: Center(
// // // //         child: Padding(
// // // //           padding: const EdgeInsets.all(8.0),
// // // //           child: GestureDetector(
// // // //             onTap: () async{
// // // //               //Here the functionality of google sign in
// // // //               await signInWithGoogle();
// // // //               if (mounted){
// // // //                 Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfilePage()));
// // // //               }
// // // //
// // // //             },
// // // //             child: Container(
// // // //               width: double.infinity,
// // // //               height: 40,
// // // //               decoration: BoxDecoration(
// // // //                 border: Border.all(
// // // //                   color: Colors.grey,
// // // //                 ),
// // // //                 borderRadius: BorderRadius.circular(8),
// // // //               ),
// // // //
// // // //               child: Row(children:  [
// // // //                 const Text(
// // // //                     'Continue with google'),
// // // //               ],)
// // // //             ),
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // // //
// // // // //
// // // // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // // // import 'package:firebase_auth/firebase_auth.dart';
// // // // // import 'package:firebase_core/firebase_core.dart';
// // // // // import 'package:flutter/material.dart';
// // // // // import 'package:google_sign_in/google_sign_in.dart';
// // // // // import 'profilepage.dart';
// // // // //
// // // // //
// // // // // class Home extends StatefulWidget {
// // // // //   const Home({Key? key}) : super(key: key);
// // // // //
// // // // //   @override
// // // // //   State<Home> createState() => _HomeState();
// // // // // }
// // // // //
// // // // // class _HomeState extends State<Home> {
// // // // //   Future<void> signInWithGoogle() async {
// // // // //     //   try {
// // // // //     //     // Initialize Firebase if not already initialized
// // // // //     //     await Firebase.initializeApp();
// // // // //     //
// // // // //     //     // Create an instance of Firebase auth and Google Sign-In
// // // // //     //     final FirebaseAuth auth = FirebaseAuth.instance;
// // // // //     //     final GoogleSignIn googleSignIn = GoogleSignIn();
// // // // //     //     // Define _firestore as an instance of FirebaseFirestore
// // // // //     //     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // // //     //
// // // // //     //     // Trigger the authentication flow
// // // // //     //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
// // // // //     //     if (googleUser == null) {
// // // // //     //       // User canceled the sign-in
// // // // //     //       return;
// // // // //     //     }
// // // // //     //
// // // // //     //     // Obtain the auth details from the request
// // // // //     //     final GoogleSignInAuthentication googleAuth = await googleUser
// // // // //     //         .authentication;
// // // // //     //
// // // // //     //     // Create new credentials
// // // // //     //     final AuthCredential credential = GoogleAuthProvider.credential(
// // // // //     //       accessToken: googleAuth.accessToken,
// // // // //     //       idToken: googleAuth.idToken,
// // // // //     //     );
// // // // //     //
// // // // //     //     // Sign in the user with credentials
// // // // //     //     final UserCredential userCredential = await auth.signInWithCredential(
// // // // //     //         credential);
// // // // //     //
// // // // //     //     final String? email = userCredential.user!
// // // // //     //         .email; // Obtain the user's email
// // // // //     //
// // // // //     //     // Check if the user document exists in the "user" collection
// // // // //     //     final DocumentSnapshot userDoc = await _firestore.collection('user').doc(
// // // // //     //         email).get();
// // // // //     //
// // // // //     //     if (userDoc.exists) {
// // // // //     //       // User already exists, direct them to ProfilePage
// // // // //     //       Navigator.push(
// // // // //     //           context, MaterialPageRoute(builder: (_) => ProfilePage()));
// // // // //     //     } else {
// // // // //     //       // User doesn't exist, direct them to RegistrationPage
// // // // //     //       Navigator.push(
// // // // //     //           context, MaterialPageRoute(builder: (_) => RegistrationPage()));
// // // // //     //     }
// // // // //     //   } catch (e) {
// // // // //     //     // Handle any errors that occur during the sign-in process
// // // // //     //     print("Error: $e");
// // // // //     //   }
// // // // //     // }
// // // // //     try {
// // // // //       // Initialize Firebase if not already initialized
// // // // //       await Firebase.initializeApp();
// // // // //
// // // // //       // Create an instance of Firebase auth and Google Sign-In
// // // // //       final FirebaseAuth auth = FirebaseAuth.instance;
// // // // //       final GoogleSignIn googleSignIn = GoogleSignIn();
// // // // //       // Define _firestore as an instance of FirebaseFirestore
// // // // //       final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// // // // //
// // // // //       // Trigger the authentication flow
// // // // //       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
// // // // //       if (googleUser == null) {
// // // // //         // User canceled the sign-in
// // // // //         return;
// // // // //       }
// // // // //
// // // // //       // Obtain the auth details from the request
// // // // //       final GoogleSignInAuthentication googleAuth = await googleUser
// // // // //           .authentication;
// // // // //
// // // // //       // Create new credentials
// // // // //       final AuthCredential credential = GoogleAuthProvider.credential(
// // // // //         accessToken: googleAuth.accessToken,
// // // // //         idToken: googleAuth.idToken,
// // // // //       );
// // // // //
// // // // //       // Sign in the user with credentials
// // // // //       final UserCredential userCredential = await auth.signInWithCredential(
// // // // //           credential);
// // // // //
// // // // //       final String? email = userCredential.user!.email; // Obtain the user's email
// // // // //
// // // // //       // Check if the user document exists in the "user" collection
// // // // //       final DocumentSnapshot userDoc = await _firestore.collection('user').doc(
// // // // //           email).get();
// // // // //
// // // // //       // if (!userDoc.exists) {
// // // // //       //
// // // // //       //   await _firestore.collection('user').doc(email).set({});
// // // // //       //
// // // // //       //   // User doesn't exist, direct them to RegistrationPage
// // // // //       //   Navigator.push(
// // // // //       //   final String? email = user.email;
// // // // //       //       context, MaterialPageRoute(builder: (_) => RegistrationPage(userEmail: userEmail)));
// // // // //       //   // Create a new document in the "user" collection with the email as the document ID
// // // // //       //
// // // // //       // } else {
// // // // //       //   // User already exists, direct them to ProfilePage
// // // // //       //   Navigator.push(
// // // // //       //       context, MaterialPageRoute(builder: (_) => ProfilePage()));
// // // // //       // }
// // // // //       if (!userDoc.exists) {
// // // // //         await _firestore.collection('user').doc(email).set({});
// // // // //         // User doesn't exist, direct them to RegistrationPage
// // // // //         Navigator.push(
// // // // //             context,
// // // // //             MaterialPageRoute(
// // // // //                 builder: (_) => RegistrationPage(userEmail: email ?? ""))); // Use 'email' here
// // // // //       } else {
// // // // //         // User already exists, direct them to ProfilePage
// // // // //         Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
// // // // //       }
// // // // //
// // // // //     } catch (e) {
// // // // //       // Handle any errors that occur during the sign-in process
// // // // //       print("Error: $e");
// // // // //     }
// // // // //   }
// // // // //
// // // // //     @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         title: const Text("Google Sign"),
// // // // //         centerTitle: true,
// // // // //       ),
// // // // //       body: Center(
// // // // //         child: Padding(
// // // // //           padding: const EdgeInsets.all(8.0),
// // // // //           child: GestureDetector(
// // // // //             onTap: () async {
// // // // //               // Here the functionality of Google Sign-In
// // // // //               await signInWithGoogle();
// // // // //             },
// // // // //             child: Container(
// // // // //               width: double.infinity,
// // // // //               height: 40,
// // // // //               decoration: BoxDecoration(
// // // // //                 border: Border.all(
// // // // //                   color: Colors.grey,
// // // // //                 ),
// // // // //                 borderRadius: BorderRadius.circular(8),
// // // // //               ),
// // // // //               child: Row(
// // // // //                 children: const [Text('Continue with Google')],
// // // // //               ),
// // // // //             ),
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }
// // //
// // // import 'package:appoiter/counselorhomepage.dart';
// // // import 'package:appoiter/organization/orghomepage.dart';
// // // import 'package:appoiter/user/userhomepage.dart';
// // // import 'package:appoiter/userselectionpage.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:firebase_core/firebase_core.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_sign_in/google_sign_in.dart';
// // //
// // // class Home extends StatefulWidget {
// // //   const Home({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   _HomeState createState() => _HomeState();
// // // }
// // //
// // // class _HomeState extends State<Home> {
// // //   final FirebaseAuth _auth = FirebaseAuth.instance;
// // //   final GoogleSignIn _googleSignIn = GoogleSignIn();
// // //
// // //   Future<void> signInWithGoogle() async {
// // //     try {
// // //       await Firebase.initializeApp();
// // //
// // //       final UserCredential? userCredential = await _handleSignIn();
// // //
// // //       if (userCredential == null) {
// // //         return;
// // //       }
// // //
// // //       final String? email = userCredential.user?.email;
// // //       if (email != null) {
// // //         final bool isUser = await _checkIfUserExists(email);
// // //         final bool isOrg = await _checkIfOrgExists(email);
// // //         final bool isCounselor = await _searchEmailInCounselors(email);
// // //
// // //         try {
// // //           final bool isCounselor = await _searchEmailInCounselors(email);
// // //
// // //           if (isCounselor) {
// // //             print("Counselor found!");
// // //             // Navigate to CounselorHomePage
// // //           } else {
// // //             print("Counselor not found.");
// // //             // Handle the case when no counselor is found
// // //           }
// // //         } catch (e) {
// // //           print("Error: $e");
// // //           // Handle any potential errors
// // //         }
// // //
// // //         if (isUser) {
// // //           Navigator.push(context, MaterialPageRoute(builder: (_) => UserHomePage(email: email)));
// // //         } else if (isOrg) {
// // //           Navigator.push(context, MaterialPageRoute(builder: (_) => OrgHomePage(email: email)));
// // //         } else if (isCounselor) {
// // //           Navigator.push(context, MaterialPageRoute(builder: (_) => CounselorHomePage(email: email)));
// // //         } else {
// // //           Navigator.push(context, MaterialPageRoute(builder: (_) => UserSelectionPage(email: email)));
// // //           }
// // //           }
// // //           } catch (e) {
// // //             print("Error: $e");
// // //           }
// // //         }
// // //
// // //   Future<UserCredential?> _handleSignIn() async {
// // //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
// // //     if (googleUser == null) {
// // //       return null;
// // //     }
// // //
// // //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
// // //     final AuthCredential credential = GoogleAuthProvider.credential(
// // //       accessToken: googleAuth.accessToken,
// // //       idToken: googleAuth.idToken,
// // //     );
// // //
// // //     return await _auth.signInWithCredential(credential);
// // //   }
// // //
// // //   Future<bool> _checkIfUserExists(String email) async {
// // //     final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(email).get();
// // //     return userDoc.exists;
// // //   }
// // //
// // //   Future<bool> _checkIfOrgExists(String email) async {
// // //     final DocumentSnapshot orgDoc = await FirebaseFirestore.instance.collection('organizations').doc(email).get();
// // //     return orgDoc.exists;
// // //   }
// // //
// // //   Future<bool> _searchEmailInCounselors(String email) async {
// // //     final QuerySnapshot organizationsQuery = await FirebaseFirestore.instance.collection('organizations').get();
// // //
// // //     for (QueryDocumentSnapshot orgDoc in organizationsQuery.docs) {
// // //       final QuerySnapshot counselorsQuery = await orgDoc.reference.collection('counselors').get();
// // //       for (QueryDocumentSnapshot counselorDoc in counselorsQuery.docs) {
// // //         final data = counselorDoc.data() as Map<String, dynamic>?;
// // //         if (data != null && data['email'] != null) {
// // //           final String counselorEmail = data['email'];
// // //           print("Counselor Email: $counselorEmail"); // Add this line for debugging
// // //           if (counselorEmail == email) {
// // //             print("Counselor found!"); // Add this line for debugging
// // //             return true;
// // //           }
// // //         }
// // //       }
// // //     }
// // //     return false;
// // //   }
// // //
// // //
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text("Google Sign"),
// // //         centerTitle: true,
// // //       ),
// // //       body: Center(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(8.0),
// // //           child: GestureDetector(
// // //             onTap: () async {
// // //               await signInWithGoogle();
// // //             },
// // //             child: Container(
// // //               width: double.infinity,
// // //               height: 40,
// // //               decoration: BoxDecoration(
// // //                 border: Border.all(
// // //                   color: Colors.grey,
// // //                 ),
// // //                 borderRadius: BorderRadius.circular(8),
// // //               ),
// // //               child: Row(
// // //                 children: const [Text('Continue with Google')],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // // import 'package:appoiter/counselorhomepage.dart';
// // // import 'package:appoiter/organization/orghomepage.dart';
// // // import 'package:appoiter/user/userhomepage.dart';
// // // import 'package:appoiter/userselectionpage.dart';
// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';
// // // import 'package:firebase_core/firebase_core.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:google_sign_in/google_sign_in.dart';
// // //
// // // class Home extends StatefulWidget {
// // //   const Home({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   _HomeState createState() => _HomeState();
// // // }
// // //
// // // class _HomeState extends State<Home> {
// // //   final FirebaseAuth _auth = FirebaseAuth.instance;
// // //   final GoogleSignIn _googleSignIn = GoogleSignIn();
// // //
// // //   Future<void> signInWithGoogle() async {
// // //     try {
// // //       await Firebase.initializeApp();
// // //
// // //       final UserCredential? userCredential = await _handleSignIn();
// // //
// // //       if (userCredential == null) {
// // //         return;
// // //       }
// // //
// // //       final String? email = userCredential.user?.email;
// // //       if (email != null) {
// // //         final bool isUser = await _checkIfUserExists(email);
// // //         final bool isOrg = await _checkIfOrgExists(email);
// // //         final bool isCounselor = await _searchEmailInCounselors(email);
// // //
// // //         if (isCounselor) {
// // //           Navigator.push(context, MaterialPageRoute(builder: (_) => CounselorHomePage(email: email)));
// // //         } else if (isUser) {
// // //           Navigator.push(context, MaterialPageRoute(builder: (_) => UserHomePage(email: email)));
// // //         } else if (isOrg) {
// // //           Navigator.push(context, MaterialPageRoute(builder: (_) => OrgHomePage(email: email)));
// // //         } else {
// // //           Navigator.push(context, MaterialPageRoute(builder: (_) => UserSelectionPage(email: email)));
// // //         }
// // //       }
// // //     } catch (e) {
// // //       print("Error: $e");
// // //     }
// // //   }
// // //
// // //   Future<UserCredential?> _handleSignIn() async {
// // //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
// // //     if (googleUser == null) {
// // //       return null;
// // //     }
// // //
// // //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
// // //     final AuthCredential credential = GoogleAuthProvider.credential(
// // //       accessToken: googleAuth.accessToken,
// // //       idToken: googleAuth.idToken,
// // //     );
// // //
// // //     return await _auth.signInWithCredential(credential);
// // //   }
// // //
// // //   Future<bool> _checkIfUserExists(String email) async {
// // //     final DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(email).get();
// // //     return userDoc.exists;
// // //   }
// // //
// // //   Future<bool> _checkIfOrgExists(String email) async {
// // //     final DocumentSnapshot orgDoc = await FirebaseFirestore.instance.collection('organizations').doc(email).get();
// // //     return orgDoc.exists;
// // //   }
// // //
// // //   Future<bool> _searchEmailInCounselors(String email) async {
// // //     final QuerySnapshot counselorsQuery = await FirebaseFirestore.instance.collection('counselors').get();
// // //
// // //     for (QueryDocumentSnapshot counselorDoc in counselorsQuery.docs) {
// // //       final data = counselorDoc.data() as Map<String, dynamic>?;
// // //       if (data != null && data['email'] != null) {
// // //         final String counselorEmail = data['email'];
// // //         if (counselorEmail == email) {
// // //           return true;
// // //         }
// // //       }
// // //     }
// // //     return false;
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text("Google Sign"),
// // //         centerTitle: true,
// // //       ),
// // //       body: Center(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(8.0),
// // //           child: GestureDetector(
// // //             onTap: () async {
// // //               await signInWithGoogle();
// // //             },
// // //             child: Container(
// // //               width: double.infinity,
// // //               height: 40,
// // //               decoration: BoxDecoration(
// // //                 border: Border.all(
// // //                   color: Colors.grey,
// // //                 ),
// // //                 borderRadius: BorderRadius.circular(8),
// // //               ),
// // //               child: Row(
// // //                 children: const [Text('Continue with Google')],
// // //               ),
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // import 'package:appoiter/counselorhomepage.dart';
// // import 'package:appoiter/organization/orghomepage.dart';
// // import 'package:appoiter/user/userhomepage.dart';
// // import 'package:appoiter/userselectionpage.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:flutter/material.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// //
// //
// // class Home extends StatelessWidget {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;
// //   final GoogleSignIn _googleSignIn = GoogleSignIn();
// //   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //
// //   Future<void> signInWithGoogle(BuildContext context) async {
// //     try {
// //       await Firebase.initializeApp();
// //
// //       final UserCredential? userCredential = await _handleSignIn();
// //
// //       if (userCredential == null) {
// //         return;
// //       }
// //
// //       final String? email = userCredential.user?.email;
// //       if (email != null) {
// //         final bool isUser = await _checkIfExistsInCollection('users', email);
// //         final bool isOrg = await _checkIfExistsInCollection('organizations', email);
// //         final bool isCounselor = await _checkIfExistsInCollection('counselors', email);
// //
// //         if (isUser) {
// //           Navigator.push(context, MaterialPageRoute(builder: (_) => UserHomePage(email: email)));
// //         } else if (isOrg) {
// //           Navigator.push(context, MaterialPageRoute(builder: (_) => OrgHomePage(email: email)));
// //         } else if (isCounselor) {
// //           Navigator.push(context, MaterialPageRoute(builder: (_) => CounselorHomePage(email: email)));
// //         } else {
// //           Navigator.push(context, MaterialPageRoute(builder: (_) => UserSelectionPage(email: email)));
// //         }
// //       }
// //     } catch (e) {
// //       print("Error: $e");
// //     }
// //   }
// //
// //   Future<UserCredential?> _handleSignIn() async {
// //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
// //     if (googleUser == null) {
// //       return null;
// //     }
// //
// //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
// //     final AuthCredential credential = GoogleAuthProvider.credential(
// //       accessToken: googleAuth.accessToken,
// //       idToken: googleAuth.idToken,
// //     );
// //
// //     return await _auth.signInWithCredential(credential);
// //   }
// //   Future<bool> _checkIfExistsInCollection(String collection, String email) async {
// //     try {
// //       final DocumentSnapshot doc = await _firestore.collection(collection).doc(email).get();
// //       bool exists = doc.exists;
// //
// //       if (exists) {
// //         if (collection == 'counselors') {
// //           print("Counselor found! Redirect to CounselorHomePage.");
// //           // Navigate to CounselorHomePage
// //         } else {
// //           print("Document with email $email found in $collection collection.");
// //           // Navigate to UserHomePage or OrgHomePage based on your logic
// //         }
// //       } else {
// //         print("Document with email $email not found in $collection collection.");
// //         // Navigate to UserSelectionPage or handle accordingly
// //       }
// //
// //       return exists;
// //     } catch (e) {
// //       print("Error checking existence in $collection collection: $e");
// //       return false;
// //     }
// //   }
// //
// //
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Google Sign"),
// //         centerTitle: true,
// //       ),
// //       body: Center(
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: GestureDetector(
// //             onTap: () async {
// //               await signInWithGoogle(context);
// //             },
// //             child: Container(
// //               width: double.infinity,
// //               height: 40,
// //               decoration: BoxDecoration(
// //                 border: Border.all(
// //                   color: Colors.grey,
// //                 ),
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               child: Row(
// //                 children: const [Text('Continue with Google')],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:appoiter/counselors/counselorhomepage.dart';
// import 'package:appoiter/organization/orghomepage.dart';
// import 'package:appoiter/user/userhomepage.dart';
// import 'package:appoiter/userselectionpage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class Home extends StatelessWidget {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//
//   Future<void> signInWithGoogle(BuildContext context) async {
//     try {
//       await Firebase.initializeApp();
//
//       final UserCredential? userCredential = await _handleSignIn();
//
//       if (userCredential == null) {
//         return;
//       }
//
//       final String? email = userCredential.user?.email;
//       if (email != null) {
//         final bool isUser = await _checkIfExistsInCollection('users', email);
//         final bool isOrg = await _checkIfExistsInCollection('organizations', email);
//         final bool isCounselor = await _checkIfExistsInCollection('counselors', email);
//
//         if (isUser) {
//           Navigator.push(context, MaterialPageRoute(builder: (_) => UserHomePage(email: email)));
//         } else if (isOrg) {
//           Navigator.push(context, MaterialPageRoute(builder: (_) => OrgHomePage(email: email)));
//         } else if (isCounselor) {
//           Navigator.push(context, MaterialPageRoute(builder: (_) => CounselorHomePage(email: email)));
//         } else {
//           Navigator.push(context, MaterialPageRoute(builder: (_) => UserSelectionPage(email: email)));
//         }
//       }
//     } catch (e) {
//       print("Error: $e");
//     }
//   }
//
//   Future<UserCredential?> _handleSignIn() async {
//     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//     if (googleUser == null) {
//       return null;
//     }
//
//     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//
//     return await _auth.signInWithCredential(credential);
//   }
//
//   Future<bool> _checkIfExistsInCollection(String collection, String email) async {
//     try {
//       final DocumentSnapshot doc = await _firestore.collection(collection).doc(email).get();
//       bool exists = doc.exists;
//
//       if (exists) {
//         if (collection == 'counselors') {
//           print("Counselor found! Redirect to CounselorHomePage.");
//           return true;
//           // break;
//           // Navigate to CounselorHomePage
//         } else {
//           print("Document with email $email found in $collection collection.");
//           // Navigate to UserHomePage or OrgHomePage based on your logic
//         }
//       } else {
//         print("Document with email $email not found in $collection collection.");
//         // Navigate to UserSelectionPage or handle accordingly
//       }
//
//       return exists;
//     } catch (e) {
//       print("Error checking existence in $collection collection: $e");
//       return false;
//     }
//   }
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
//       appBar: AppBar(
//         title: const Text("Google Sign"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GestureDetector(
//             onTap: () async {
//               await signInWithGoogle(context);
//             },
//             child: Container(
//               width: double.infinity,
//               height: 40,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.grey,
//                 ),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 children: const [Text('Continue with Google')],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:appoiter/counselors/counselorhomepage.dart';
import 'package:appoiter/organization/orghomepage.dart';
import 'package:appoiter/user/userhomepage.dart';
import 'package:appoiter/userselectionpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      await Firebase.initializeApp();

      final UserCredential? userCredential = await _handleSignIn();

      if (userCredential == null) {
        return;
      }

      final String? email = userCredential.user?.email;
      if (email != null) {
        final bool isUser = await _checkIfExistsInCollection('users', email);
        final bool isOrg = await _checkIfExistsInCollection(
            'organizations', email);
        final bool isCounselor = await _checkIfExistsInCollection(
            'counselors', email);

        if (isUser) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => UserHomePage(email: email)));
        } else if (isOrg) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => OrgHomePage(email: email)));
        } else if (isCounselor) {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (_) => CounselorHomePage(email: email)));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (_) => UserSelectionPage(email: email)));
        }
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<UserCredential?> _handleSignIn() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      return null;
    }

    final GoogleSignInAuthentication googleAuth = await googleUser
        .authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await _auth.signInWithCredential(credential);
  }

  Future<bool> _checkIfExistsInCollection(String collection,
      String email) async {
    try {
      final DocumentSnapshot doc = await _firestore.collection(collection).doc(
          email).get();
      bool exists = doc.exists;

      if (exists) {
        print("Document with email $email found in $collection collection.");
        return true;
      } else {
        print(
            "Document with email $email not found in $collection collection.");
        return false;
      }
    } catch (e) {
      print("Error checking existence in $collection collection: $e");
      return false;
    }
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () async {
                await signInWithGoogle(context);
              },
              child: Container(
                width: double.infinity,
                height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/google_logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
