//
//
// import 'package:appoiter/organization/orghomepage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Import for inputFormatters
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AddCounselorPage extends StatefulWidget {
//   final String email;
//
//   AddCounselorPage({required this.email});
//
//   @override
//   _AddCounselorPageState createState() => _AddCounselorPageState();
// }
//
// class _AddCounselorPageState extends State<AddCounselorPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final bool isActive = false;
//
//   Future<void> _submitForm() async {
//     final String counselorName = nameController.text;
//     final String counselorEmail = emailController.text;
//     final String counselorPhone = phoneController.text;
//     final String orgEmail = widget.email;
//
//     if (counselorName.isEmpty || counselorEmail.isEmpty || counselorPhone.isEmpty) {
//       _showErrorDialog('Please fill in all fields.');
//       return;
//     }
//
//     try {
//       final counselorsRef = FirebaseFirestore.instance.collection('counselors');
//       final counselorRef = counselorsRef.doc(counselorEmail);
//
//       final counselorData = {
//         'name': counselorName,
//         'email': counselorEmail,
//         'phone': counselorPhone,
//         'orgemail': orgEmail,
//         'isActive': isActive,
//         'appointmentcount': 0, // Add the appointmentCount field with an initial value of 0
//         'appointments': [], // Add the appointments field with an initial empty array
//       };
//
//       // Check if the counselor with the same email already exists
//       final counselorSnapshot = await counselorRef.get();
//
//       if (counselorSnapshot.exists) {
//         _showErrorDialog('Counselor with this email already exists.');
//       } else {
//         // Add the counselor's data as a document in the 'counselors' collection
//         await counselorRef.set(counselorData);
//
//         _showSuccessDialog('Counselor successfully added', widget.email);
//       }
//     } catch (error) {
//       _showErrorDialog('An error occurred. Please try again later.');
//     }
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('OK'),
//             )
//           ],
//         );
//       },
//     );
//   }
//
//   void _showSuccessDialog(String message, String email) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Counselor Added Successfully.'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (context) => OrgHomePage(email: widget.email),
//                   ),
//                 );
//               },
//               child: Text('OK'),
//             )
//           ],
//         );
//       },
//     );
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Counselor'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Counselor Name'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Counselor Email'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: phoneController,
//               decoration: InputDecoration(labelText: 'Phone No.'),
//               keyboardType: TextInputType.number, // Allow only numeric input
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow only numbers
//               ],
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _submitForm,
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// import 'package:appoiter/organization/orghomepage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Import for inputFormatters
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AddCounselorPage extends StatefulWidget {
//   final String email;
//
//   AddCounselorPage({required this.email});
//
//   @override
//   _AddCounselorPageState createState() => _AddCounselorPageState();
// }
//
// class _AddCounselorPageState extends State<AddCounselorPage> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   bool isActive = false;
//   int appointmentCount = 0; // Track appointment count locally
//
//   @override
//   void initState() {
//     super.initState();
//     // Listen to changes in appointments field for the counselor
//     FirebaseFirestore.instance
//         .collection('counselors')
//         .doc(widget.email)
//         .snapshots()
//         .listen((snapshot) {
//       // Update appointment count when appointments field changes
//       setState(() {
//         appointmentCount = (snapshot.data()?['appointments'] as List<dynamic>).length;
//       });
//     });
//   }
//
//   Future<void> _submitForm() async {
//     final String counselorName = nameController.text;
//     final String counselorEmail = emailController.text;
//     final String counselorPhone = phoneController.text;
//     final String orgEmail = widget.email;
//
//     if (counselorName.isEmpty || counselorEmail.isEmpty || counselorPhone.isEmpty) {
//       _showErrorDialog('Please fill in all fields.');
//       return;
//     }
//
//     try {
//       final counselorsRef = FirebaseFirestore.instance.collection('counselors');
//       final counselorRef = counselorsRef.doc(counselorEmail);
//
//       final counselorData = {
//         'name': counselorName,
//         'email': counselorEmail,
//         'phone': counselorPhone,
//         'orgemail': orgEmail,
//         'isActive': isActive,
//         'appointmentcount': appointmentCount, // Use local appointment count
//         'appointments': [], // Add the appointments field with an initial empty array
//       };
//
//       // Check if the counselor with the same email already exists
//       final counselorSnapshot = await counselorRef.get();
//
//       if (counselorSnapshot.exists) {
//         _showErrorDialog('Counselor with this email already exists.');
//       } else {
//         // Add the counselor's data as a document in the 'counselors' collection
//         await counselorRef.set(counselorData);
//
//         _showSuccessDialog('Counselor successfully added', widget.email);
//       }
//     } catch (error) {
//       _showErrorDialog('An error occurred. Please try again later.');
//     }
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text('OK'),
//             )
//           ],
//         );
//       },
//     );
//   }
//
//   void _showSuccessDialog(String message, String email) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Counselor Added Successfully.'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (context) => OrgHomePage(email: widget.email),
//                   ),
//                 );
//               },
//               child: Text('OK'),
//             )
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Counselor'),
//         backgroundColor: Color(0xFF255B78),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Counselor Name'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Counselor Email'),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: phoneController,
//               decoration: InputDecoration(labelText: 'Phone No.'),
//               keyboardType: TextInputType.number, // Allow only numeric input
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow only numbers
//               ],
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _submitForm,
//               child: Text('Submit'),
//             ),
//             SizedBox(height: 16.0),
//             // Text('Appointment Count: $appointmentCount'), // Display appointment count
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:appoiter/organization/orghomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import for inputFormatters
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCounselorPage extends StatefulWidget {
  final String email;

  AddCounselorPage({required this.email});

  @override
  _AddCounselorPageState createState() => _AddCounselorPageState();
}

class _AddCounselorPageState extends State<AddCounselorPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController(); // Controller for address field
  bool isActive = false;
  int appointmentCount = 0; // Track appointment count locally

  @override
  void initState() {
    super.initState();
    // Listen to changes in appointments field for the counselor
    FirebaseFirestore.instance
        .collection('counselors')
        .doc(widget.email)
        .snapshots()
        .listen((snapshot) {
      // Update appointment count when appointments field changes
      setState(() {
        appointmentCount = (snapshot.data()?['appointments'] as List<dynamic>).length;
      });
    });
  }

  Future<void> _submitForm() async {
    final String counselorName = nameController.text;
    final String counselorEmail = emailController.text;
    final String counselorPhone = phoneController.text;
    final String counselorAddress = addressController.text; // Retrieve address value
    final String orgEmail = widget.email;

    if (counselorName.isEmpty || counselorEmail.isEmpty || counselorPhone.isEmpty || counselorAddress.isEmpty) { // Check if any field is empty
      _showErrorDialog('Please fill in all fields.');
      return;
    }

    try {
      final counselorsRef = FirebaseFirestore.instance.collection('counselors');
      final counselorRef = counselorsRef.doc(counselorEmail);

      final counselorData = {
        'name': counselorName,
        'email': counselorEmail,
        'phone': counselorPhone,
        'address': counselorAddress, // Include address field
        'orgemail': orgEmail,
        'isActive': isActive,
        'appointmentcount': appointmentCount, // Use local appointment count
        'appointments': [], // Add the appointments field with an initial empty array
      };

      // Check if the counselor with the same email already exists
      final counselorSnapshot = await counselorRef.get();

      if (counselorSnapshot.exists) {
        _showErrorDialog('Counselor with this email already exists.');
      } else {
        // Add the counselor's data as a document in the 'counselors' collection
        await counselorRef.set(counselorData);

        _showSuccessDialog('Counselor successfully added', widget.email);
      }
    } catch (error) {
      _showErrorDialog('An error occurred. Please try again later.');
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            )
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message, String email) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Counselor Added Successfully.'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => OrgHomePage(email: widget.email),
                  ),
                );
              },
              child: Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Counselor'),
        backgroundColor: Color(0xFF255B78),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Counselor Name'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Counselor Email'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone No.'),
                keyboardType: TextInputType.number, // Allow only numeric input
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow only numbers
                ],
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: addressController,
                decoration: InputDecoration(labelText: 'Address'), // Add address field
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF255B78), // Background color
                  ),
                  child: Text('Submit'),
                ),
              ),

              SizedBox(height: 16.0),
              // Text('Appointment Count: $appointmentCount'), // Display appointment count
            ],
          ),
        ),
      ),
    );
  }

}
