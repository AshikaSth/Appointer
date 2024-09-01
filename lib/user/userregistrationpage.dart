// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// class UserRegistrationPage extends StatefulWidget {
//   final String email; // Add the email parameter
//
//   const UserRegistrationPage({Key? key, required this.email}) : super(key: key);
//
//   @override
//   _UserRegistrationPageState createState() => _UserRegistrationPageState();
// }
//
// class _UserRegistrationPageState extends State<UserRegistrationPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   String? _name;
//   String? _phoneNumber;
//   String? _gender;
//   DateTime? _dob;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("User Registration"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Name is required';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _name = value;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Phone Number'),
//                 keyboardType: TextInputType.phone, // Restrict to numbers
//                 inputFormatters: <TextInputFormatter>[
//                   FilteringTextInputFormatter.digitsOnly, // Allow only digits
//                 ],
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Phone Number is required';
//                   }
//                   return null;
//                 },
//                 onSaved: (value) {
//                   _phoneNumber = value;
//                 },
//               ),
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'Date of Birth'),
//                 readOnly: true,
//                 onTap: () async {
//                   final DateTime? picked = await showDatePicker(
//                     context: context,
//                     initialDate: _dob ?? DateTime.now(),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   );
//                   if (picked != null && picked != _dob) {
//                     setState(() {
//                       _dob = picked;
//                     });
//                   }
//                 },
//                 validator: (value) {
//                   if (_dob == null) {
//                     return 'Date of Birth is required';
//                   }
//                   return null;
//                 },
//               ),
//               DropdownButtonFormField<String>(
//                 value: _gender,
//                 onChanged: (value) {
//                   setState(() {
//                     _gender = value;
//                   });
//                 },
//                 items: <String>['Male', 'Female', 'Other']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(labelText: 'Gender'),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Gender is required';
//                   }
//                   return null;
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();
//
//                     // Now you can use the captured data as needed
//                     print('Name: $_name');
//                     print('Phone Number: $_phoneNumber');
//                     print('Date of Birth: ${DateFormat('yyyy-MM-dd').format(_dob!)}');
//                     print('Gender: $_gender');
//
//                     // Add code to store the data in Firebase or perform other actions
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'userhomepage.dart';

class UserRegistrationPage extends StatefulWidget {
  final String email; // Add the email parameter

  const UserRegistrationPage({Key? key, required this.email}) : super(key: key);

  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _phoneNumber;
  String? _gender;
  DateTime? _dob;
  String? _formattedDate = 'Select Date'; // to display the chosen date
  String? _address; // New address variable

  // Function to select date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: _dob ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    )) ?? DateTime.now();

    setState(() {
      _dob = picked;
      _formattedDate = DateFormat('yyyy-MM-dd').format(picked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Registration"),
        backgroundColor: Color(0xFF255B78),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phoneNumber = value;
                  },
                ),
                Row(
                  children: [
                    Text('Date of Birth: $_formattedDate'), // Display chosen date
                    TextButton(
                      onPressed: () => _selectDate(context), // Call date picker
                      child: Text('Select Date'),
                    ),
                  ],
                ),
                DropdownButtonFormField<String>(
                  value: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value;
                    });
                  },
                  items: <String>['Male', 'Female', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: InputDecoration(labelText: 'Gender'),
                  validator: (value) {
                    if (value == null) {
                      return 'Gender is required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Address'), // Address field
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _address = value;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      // Save user details in Firestore
                      final firestore = FirebaseFirestore.instance;
                      final user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        firestore.collection('users').doc(user.email).set({
                          'name': _name,
                          'phoneNumber': _phoneNumber,
                          'dob': _formattedDate,
                          'gender': _gender,
                          'address': _address, // Add address to Firestore document
                        }).then((_) {
                          // Registration success dialog
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Successfully Registered'),
                              content: Text('You have been successfully registered.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => UserHomePage(email: widget.email),
                                      ),
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );
                        }).catchError((error) {
                          // Error dialog in case of an error
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text('An error occurred while registering. Please try again.'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            ),
                          );

                          print('Error: $error');
                        });
                      }
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

