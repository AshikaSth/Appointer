// import 'package:appoiter/organization/orghomepage.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class OrganizationRegistrationPage extends StatefulWidget {
//   final String orgEmail;
//
//   OrganizationRegistrationPage({required this.orgEmail});
//
//   @override
//   _OrganizationRegistrationPageState createState() =>
//       _OrganizationRegistrationPageState();
// }
//
// class _OrganizationRegistrationPageState
//     extends State<OrganizationRegistrationPage> {
//   final _formKey = GlobalKey<FormState>();
//
//   // Organization registration fields
//   String orgName = '';
//   String orgAddress = '';
//   String orgType = '';
//   String orgDescription = '';
//   String orgPhoneNo = '';
//   String orgOpeningTime = '';
//   String orgClosingTime = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Organization Registration'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Organization Name'),
//                   onChanged: (value) {
//                     setState(() {
//                       orgName = value;
//                     });
//                   },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter the organization name';
//                       }
//                       return null;
//                     }
//                 ),
//                 // Add more TextFormField widgets for the other fields here.
//
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Validate the form, and if it's valid, store the data in Firestore.
//                     if (_formKey.currentState!.validate()) {
//                       // Save organization data to Firestore.
//                       try {
//                         final orgDocRef = FirebaseFirestore.instance.collection('Organizations').doc(widget.orgEmail);
//
//                         await orgDocRef.set({
//                           'org_name': orgName,
//                           'org_address': orgAddress,
//                           'org_type': orgType,
//                           'org_description': orgDescription,
//                           'org_phn_no': orgPhoneNo,
//                           'org_opening_time': orgOpeningTime,
//                           'org_closing_time': orgClosingTime,
//                           'org_no_of_counselors': 0, // Initialize counselors count
//                           'notices': [], // Initialize notices as an empty array
//                         });
//
//                         // After storing data, navigate to the organization homepage.
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => OrganizationHomePage(
//                               orgEmail: widget.orgEmail,
//                               orgName: orgName,
//                               orgAddress: orgAddress,
//                               orgPhoneNo: orgPhoneNo,
//                             ),
//                           ),
//                         );
//                       } catch (e) {
//                         print('Error while storing organization data: $e');
//                         // Handle the error as needed.
//                       }
//                     }
//                   },
//                   child: Text('Register Organization'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
import 'package:appoiter/organization/orghomepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class OrganizationRegistrationPage extends StatefulWidget {
  final String email; // The email used for signing in

  OrganizationRegistrationPage({Key? key, required this.email})
      : super(key: key);

  @override
  _OrganizationRegistrationPageState createState() =>
      _OrganizationRegistrationPageState();
}

class _OrganizationRegistrationPageState
    extends State<OrganizationRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String? _orgName;
  String? _address;
  String? _contact;
  String? _orgType;
  TimeOfDay? _openingTime;
  TimeOfDay? _closingTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Organization Registration"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Organization Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Organization Name is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _orgName = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
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
              TextFormField(
                decoration: InputDecoration(labelText: 'Contact'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Contact is required';
                  }
                  return null;
                },
                onSaved: (value) {
                  _contact = value;
                },
              ),
              DropdownButtonFormField<String>(
                value: _orgType,
                onChanged: (value) {
                  setState(() {
                    _orgType = value;
                  });
                },
                items: <String>['Non-profit',
                  'Business',
                  'Educational Institution',
                  'Government',
                  'Healthcare',
                  'Technology', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Organization Type'),
                validator: (value) {
                  if (value == null) {
                    return 'Organization Type is required';
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Text('Opening Time:'),
                  TextButton(
                    onPressed: () {
                      _selectOpeningTime(context);
                    },
                    child: Text(
                      _openingTime != null
                          ? _openingTime!.format(context)
                          : 'Select Time',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text('Closing Time:'),
                  TextButton(
                    onPressed: () {
                      _selectClosingTime(context);
                    },
                    child: Text(
                      _closingTime != null
                          ? _closingTime!.format(context)
                          : 'Select Time',
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Now you can use the captured data as needed
                    print('Organization Name: $_orgName');
                    print('Address: $_address');
                    print('Contact: $_contact');
                    print('Organization Type: $_orgType');
                    print('Opening Time: ${_openingTime?.format(context) ?? ''}');
                    print('Closing Time: ${_closingTime?.format(context) ?? ''}');

                    try {
                      // Initialize Firebase if not already initialized
                      await Firebase.initializeApp();

                      // Create an instance of FirebaseFirestore
                      final FirebaseFirestore firestore = FirebaseFirestore.instance;

                      // Save the organization details in the "organizations" collection with the document ID as the email passed from UserSelectionPage
                      await firestore.collection('organizations').doc(widget.email).set({
                        'name': _orgName,
                        'address': _address,
                        'contact': _contact,
                        'orgType': _orgType,
                        'openingTime': _openingTime?.format(context) ?? '',
                        'closingTime': _closingTime?.format(context) ?? '',
                      });

                      // Show a success dialog
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Organization Registered Successfully'),
                          content: Text('Your organization has been successfully registered.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => OrgHomePage(email: widget.email),
                                  ),
                                );
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    } catch (e) {
                      // Handle any errors
                      print("Error: $e");
                    }
                  }
                },
                child: Text('Submit'),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectOpeningTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _openingTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _openingTime = picked;
      });
    }
  }

  Future<void> _selectClosingTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _closingTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _closingTime = picked;
      });
    }
  }
}
