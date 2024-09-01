// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class AppointmentForm extends StatefulWidget {
//   final String email;
//   final String orgemail;
//
//   AppointmentForm({
//     required this.email,
//     required this.orgemail,
//   });
//
//   @override
//   _AppointmentFormState createState() => _AppointmentFormState();
// }
//
// class _AppointmentFormState extends State<AppointmentForm> {
//   List<Map<String, dynamic>> formData = [];
//   Map<int, TextEditingController> shortAnswerControllers = {};
//   Map<int, TextEditingController> numberControllers = {};
//
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//
//   // Map to store multiple selected dates (if multiple date fields are present)
//   Map<int, DateTime> selectedDatesMap = {};
//
//   @override
//   void initState() {
//     super.initState();
//     fetchFormData();
//   }
//
//   Future<void> fetchFormData() async {
//     try {
//       DocumentSnapshot orgDoc = await FirebaseFirestore.instance
//           .collection('organizations')
//           .doc(widget.orgemail)
//           .get();
//
//       Map<String, dynamic> orgData =
//           orgDoc.data() as Map<String, dynamic>? ?? {};
//
//       List<Map<String, dynamic>> form = List<Map<String, dynamic>>.from(
//           orgData['forms'] ?? []);
//
//       setState(() {
//         formData = form;
//         for (int i = 0; i < formData.length; i++) {
//           String fieldType = formData[i]['field${i + 1}answertype'];
//           if (fieldType == 'Short Answer') {
//             shortAnswerControllers[i] = TextEditingController();
//           } else if (fieldType == 'Number') {
//             numberControllers[i] = TextEditingController();
//           }
//         }
//       });
//     } catch (e) {
//       print('Error fetching form data: $e');
//     }
//   }
//
//   Future<void> _selectDate(BuildContext context, int index) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDatesMap[index] ?? DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//
//     if (picked != null) {
//       setState(() {
//         selectedDatesMap[index] = picked;
//       });
//     }
//   }
//
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//
//     if (picked != null) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }
//
//   Future<void> submitAppointment() async {
//     try {
//       // Call the function to get the counselor with the least number of appointments
//       String? counselorDocumentId = await counselorappointment(widget.email);
//
//       // Create a reference to the appointments collection
//       CollectionReference appointmentCollectionRef =
//       FirebaseFirestore.instance.collection('appointments');
//
//       // Create a new field or update the existing field in the appointments collection
//       DocumentReference appointmentDocRef =
//       await appointmentCollectionRef.add({
//         'timestamp': FieldValue.serverTimestamp(),
//         'form_data': formData.map((field) {
//           int index = formData.indexOf(field);
//           return {
//             'field_name': field['field${index + 1}'],
//             'answer': getFormFieldValue(field, index),
//           };
//         }).toList(),
//         'useremail': widget.email,
//         'orgemail': widget.orgemail,
//         'counseloremail': counselorDocumentId, // Set the counselor DocumentID
//       });
//
//       // Show a Snackbar
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Appointment created successfully!'),
//           duration: Duration(seconds: 2), // Adjust the duration as needed
//         ),
//       );
//
//       print('Appointment submitted successfully!');
//     } catch (e) {
//       // Handle errors and show an error Snackbar
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error submitting appointment. Please try again.'),
//           duration: Duration(seconds: 2), // Adjust the duration as needed
//         ),
//       );
//       print('Error submitting appointment: $e');
//     }
//   }
//
//
//   Future<String?> counselorappointment(String userEmail) async {
//     try {
//       // Query counselors collection to find counselors with the least number of appointments
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('counselors')
//           .where('orgemail', isEqualTo: widget.orgemail)
//           .orderBy('appointmentcount')
//           .get();
//
//       // Check if any counselors were found
//       if (querySnapshot.docs.isNotEmpty) {
//         List<DocumentSnapshot> counselors = querySnapshot.docs;
//
//         // If there's only one counselor, assign the appointment to them
//         if (counselors.length == 1) {
//           DocumentSnapshot counselor = counselors.first;
//           String counselorDocumentId = counselor.id;
//           return await assignAppointment(counselorDocumentId);
//         } else {
//           // If multiple counselors have the same appointment count, check for active counselors
//           List<DocumentSnapshot> activeCounselors = counselors
//               .where((counselor) => counselor['isActive'] == true)
//               .toList();
//
//           if (activeCounselors.isNotEmpty) {
//             // Randomly select an active counselor from those with the least number of appointments
//             DocumentSnapshot randomlySelectedCounselor =
//             activeCounselors[Random().nextInt(activeCounselors.length)];
//             String counselorDocumentId = randomlySelectedCounselor.id;
//
//             return await assignAppointment(counselorDocumentId);
//           } else {
//             // If no active counselors, randomly select from all counselors with the least appointments
//             DocumentSnapshot randomlySelectedCounselor =
//             counselors[Random().nextInt(counselors.length)];
//             String counselorDocumentId = randomlySelectedCounselor.id;
//
//             return await assignAppointment(counselorDocumentId);
//           }
//         }
//       } else {
//         // Handle the case where no counselor was found
//         throw Exception('No counselor found for the specified organization.');
//       }
//     } catch (e) {
//       print('Error updating counselor appointments count: $e');
//       return null; // Return a default value or handle the error as needed
//     }
//   }
//
//
//   Future<String?> assignAppointment(String counselorDocumentId) async {
//     try {
//       // Create a reference to the counselor's document
//       DocumentReference counselorDocRef =
//       FirebaseFirestore.instance.collection('counselors').doc(counselorDocumentId);
//
//       // Create a new appointment document
//       DocumentReference appointmentDocRef =
//       await FirebaseFirestore.instance.collection('appointments').add({
//         'timestamp': FieldValue.serverTimestamp(),
//         'form_data': formData.map((field) {
//           int index = formData.indexOf(field);
//           return {
//             'field_name': field['field${index + 1}'],
//             'answer': getFormFieldValue(field, index),
//           };
//         }).toList(),
//         'useremail': widget.email,
//         'orgemail': widget.orgemail,
//         'counseloremail': counselorDocumentId,
//       });
//
//       // Update the counselor's appointments array with the new appointment document ID
//       await counselorDocRef.update({
//         'appointments': FieldValue.arrayUnion([appointmentDocRef.id]),
//       });
//
//       // Get the updated appointments array
//       DocumentSnapshot counselorSnapshot = await counselorDocRef.get();
//       List<dynamic>? appointments = counselorSnapshot['appointments'];
//
//       // Update the counselor's appointment count
//       await counselorDocRef.update({
//         'appointmentcount': appointments?.length ?? 0,
//       });
//
//       print('Appointment submitted successfully!');
//       return counselorDocumentId; // Return the counselor DocumentID
//     } catch (e) {
//       print('Error assigning appointment: $e');
//       return null; // Return a default value or handle the error as needed
//     }
//   }
//
//
//   @override
//   Widget buildShortAnswerField(Map<String, dynamic> field, int index) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('${field['field${index + 1}']}:'),
//         TextField(
//           controller: shortAnswerControllers[index], // Use the corresponding controller
//           decoration: InputDecoration(
//             hintText: 'Enter your answer',
//           ),
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }
//
//   Widget buildNumberField(Map<String, dynamic> field, int index) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('${field['field${index + 1}']}:'),
//         TextField(
//           controller: numberControllers[index], // Use the corresponding controller
//           keyboardType: TextInputType.number,
//           decoration: InputDecoration(
//             hintText: 'Enter a number',
//           ),
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Appointment Form'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             for (int i = 0; i < formData.length; i++)
//               buildFormField(formData[i], i),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 // Handle the appointment submission logic here
//                 // You can use the data from the form fields
//                 // For now, let's just print the data
//                 for (int i = 0; i < formData.length; i++) {
//                   print('${formData[i]['field${i + 1}']}: ${getFormFieldValue(formData[i], i)}');
//                 }
//                 // Call the function to submit the appointment
//                 submitAppointment();
//               },
//               child: Text('Create Appointment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildFormField(Map<String, dynamic> field, int index) {
//     String fieldType = field['field${index + 1}answertype'];
//
//     switch (fieldType) {
//       case 'Short Answer':
//         return buildShortAnswerField(field, index);
//       case 'Number':
//         return buildNumberField(field, index);
//       case 'Time':
//         return buildTimeField(field, index);
//       case 'Date':
//         return buildDateField(field, index);
//       case 'File Upload':
//         return buildFileUploadField(field, index);
//       default:
//         return Container(); // Handle other field types as needed
//     }
//   }
//
//   Widget buildTimeField(Map<String, dynamic> field, int index) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('${field['field${index + 1}']}:'),
//         ElevatedButton(
//           onPressed: () {
//             _selectTime(context);
//           },
//           child: Text(selectedTime.format(context)),
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }
//
//   Widget buildDateField(Map<String, dynamic> field, int index) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('${field['field${index + 1}']}:'),
//         ElevatedButton(
//           onPressed: () {
//             _selectDate(context, index);
//           },
//           child: Text(selectedDatesMap[index]?.toString() ?? 'Select Date'),
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }
//
//   Widget buildFileUploadField(Map<String, dynamic> field, int index) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('${field['field${index + 1}']}:'),
//         TextField(
//           decoration: InputDecoration(
//             hintText: 'Upload a file',
//           ),
//         ),
//         SizedBox(height: 16),
//       ],
//     );
//   }
//
//   dynamic getFormFieldValue(Map<String, dynamic> field, int index) {
//     String fieldType = field['field${index + 1}answertype'];
//     switch (fieldType) {
//       case 'Short Answer':
//         return shortAnswerControllers[index]?.text ?? '';
//       case 'Number':
//         return int.tryParse(numberControllers[index]?.text ?? '') ?? 0;
//       case 'Time':
//         return selectedTime.format(context);
//       case 'Date':
//         return selectedDatesMap[index]?.toString() ?? 'No Date Selected';
//       case 'File Upload':
//         return 'Implement logic to get File Upload value';
//       default:
//         return null;
//     }
//   }
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentForm extends StatefulWidget {
  final String email;
  final String orgemail;

  AppointmentForm({
    required this.email,
    required this.orgemail,
  });

  @override
  _AppointmentFormState createState() => _AppointmentFormState();
}

class _AppointmentFormState extends State<AppointmentForm> {
  final _formKey = GlobalKey<FormState>();

  // Form fields variables
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  String? _selectedAppointmentType;
  String? _selectedHowYouKnew;
  DateTime? _selectedDate; // Variable to store the selected date

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color(0xFF255B78),
        title: Text('Appointment Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone, // Use phone keyboard
                ),
                SizedBox(height: 20),
                // Date Picker
                ListTile(
                  title: Text('Appointment Date:'),
                  trailing: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );
                      if (pickedDate != null && pickedDate != _selectedDate) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                  ),
                  subtitle: _selectedDate != null
                      ? Text('Selected date: ${_selectedDate!.toString().split(' ')[0]}')
                      : Text('No date selected'),
                ),
                SizedBox(height: 20),
                Text('Type of Appointment'),
                RadioListTile<String>(
                  title: const Text('By calling'),
                  value: 'By calling',
                  groupValue: _selectedAppointmentType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedAppointmentType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Physically'),
                  value: 'Physically',
                  groupValue: _selectedAppointmentType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedAppointmentType = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Through social media'),
                  value: 'Through social media',
                  groupValue: _selectedAppointmentType,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedAppointmentType = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                Text('How did you know about us?'),
                RadioListTile<String>(
                  title: const Text('Through social media'),
                  value: 'Through social media',
                  groupValue: _selectedHowYouKnew,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedHowYouKnew = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Others'),
                  value: 'Others',
                  groupValue: _selectedHowYouKnew,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedHowYouKnew = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      submitAppointment();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF255B78)), // Set button color
                  ),
                  child: Text('Submit'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> submitAppointment() async {
    try {
      String? counselorDocumentId = await counselorappointment(widget.email);

      String? appointmentId = await assignAppointment(counselorDocumentId! as String);

      if (appointmentId != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Appointment created successfully!'),
            duration: Duration(seconds: 2),
          ),
        );

        // Clear the form after successful submission
        _nameController.clear();
        _addressController.clear();
        _phoneNumberController.clear();
        setState(() {
          _selectedAppointmentType = null;
          _selectedHowYouKnew = null;
          _selectedDate = null;
        });
      } else {
        throw Exception('Error creating appointment. Please try again.');
      }

      print('Appointment submitted successfully!');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error submitting appointment. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
      print('Error submitting appointment: $e');
    }
  }

  Future<String?> counselorappointment(String userEmail) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('counselors')
          .where('orgemail', isEqualTo: widget.orgemail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        List<DocumentSnapshot> counselors = querySnapshot.docs;

        counselors.sort((a, b) =>
            (a['appointments'] as List).length.compareTo((b['appointments'] as List).length));

        List<DocumentSnapshot> activeCounselors = counselors
            .where((counselor) => counselor['isActive'] == true)
            .toList();

        if (activeCounselors.isNotEmpty) {
          DocumentSnapshot randomlySelectedCounselor =
          activeCounselors[Random().nextInt(activeCounselors.length)];
          String counselorDocumentId = randomlySelectedCounselor.id;

          return counselorDocumentId;
        } else {
          DocumentSnapshot randomlySelectedCounselor =
          counselors[Random().nextInt(counselors.length)];
          String counselorDocumentId = randomlySelectedCounselor.id;

          return counselorDocumentId;
        }
      } else {
        throw Exception('No counselor found for the specified organization.');
      }
    } catch (e) {
      print('Error updating counselor appointments count: $e');
      return null;
    }
  }

// Update the assignAppointment method to include the appointment date
  Future<String?> assignAppointment(String counselorDocumentId) async {
    try {
      // Create a reference to the counselor's document
      DocumentReference counselorDocRef =
      FirebaseFirestore.instance.collection('counselors').doc(counselorDocumentId);

      // Create a new appointment document
      DocumentReference appointmentDocRef =
      await FirebaseFirestore.instance.collection('appointments').add({
        'timestamp': FieldValue.serverTimestamp(),
        'useremail': widget.email,
        'orgemail': widget.orgemail,
        'counseloremail': counselorDocumentId,
        'name': _nameController.text,
        'address': _addressController.text,
        'phoneNumber': _phoneNumberController.text,
        'appointmentType': _selectedAppointmentType,
        'howYouKnew': _selectedHowYouKnew,
        'appointmentDate': _selectedDate, // Include the appointment date
      });

      // Update the counselor's appointments array with the new appointment document ID
      await counselorDocRef.update({
        'appointments': FieldValue.arrayUnion([appointmentDocRef.id]),
      });

      // Get the updated appointments array
      DocumentSnapshot counselorSnapshot = await counselorDocRef.get();
      List<dynamic>? appointments = counselorSnapshot['appointments'];

      // Update the counselor's appointment count
      await counselorDocRef.update({
        'appointmentcount': appointments?.length ?? 0,
      });

      print('Appointment submitted successfully!');
      return appointmentDocRef.id; // Return the appointment DocumentID
    } catch (e) {
      print('Error assigning appointment: $e');
      return null; // Return a default value or handle the error as needed
    }
  }

}