// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter/material.dart';
// //
// // class CreateForm extends StatefulWidget {
// //   final String email;
// //
// //   CreateForm({required this.email});
// //
// //   @override
// //   _CreateFormState createState() => _CreateFormState();
// // }
// //
// // class _CreateFormState extends State<CreateForm> {
// //   String selectedFieldType = 'Multiple Choice';
// //   List<FormFieldData> formFields = [];
// //   String formTitle = '';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Form Creator'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             TextFormField(
// //               decoration: InputDecoration(labelText: 'Form Title'),
// //               onChanged: (value) {
// //                 setState(() {
// //                   formTitle = value;
// //                 });
// //               },
// //             ),
// //             SizedBox(height: 16.0),
// //             Container(
// //               width: double.infinity,
// //               height: MediaQuery.of(context).size.height * 0.12,
// //               child: ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   primary: Colors.white,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(5.0),
// //                   ),
// //                 ),
// //                 onPressed: () {
// //                   showFieldTypeDropdown(context);
// //                 },
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Text(
// //                       '+',
// //                       style: TextStyle(
// //                         fontSize: 40,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                     Icon(Icons.arrow_drop_down),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             SizedBox(height: 16.0),
// //             if (selectedFieldType == 'Short Answer') ...[
// //               TextFormField(
// //                 decoration: InputDecoration(labelText: 'New Field'),
// //               ),
// //               SizedBox(height: 16.0),
// //             ],
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: formFields.length,
// //                 itemBuilder: (context, index) {
// //                   return TextFormField(
// //                     decoration: InputDecoration(labelText: 'Field ${index + 1}'),
// //                   );
// //                 },
// //               ),
// //             ),
// //             Spacer(),
// //             ElevatedButton(
// //               onPressed: () {
// //                 saveFormToFirestore();
// //               },
// //               child: Text('Create Form'),
// //               style: ElevatedButton.styleFrom(
// //                 primary: Colors.blue,
// //                 padding: EdgeInsets.symmetric(vertical: 15.0),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //
// //   void showFieldTypeDropdown(BuildContext context) {
// //     showMenu(
// //       context: context,
// //       position: RelativeRect.fromLTRB(0, 100, 0, 0),
// //       items: [
// //         PopupMenuItem(
// //           child: TextButton(
// //             onPressed: () {
// //               setState(() {
// //                 selectedFieldType = 'Paragraph';
// //                 // Automatically add a new field when "Short Answer" is selected
// //                 addFormField();
// //               });
// //               Navigator.of(context).pop();
// //             },
// //             child: Text('Paragraph'),
// //           ),
// //         ),
// //         PopupMenuItem(
// //           child: TextButton(
// //             onPressed: () {
// //               setState(() {
// //                 selectedFieldType = 'Short Answer';
// //                 // Automatically add a new field when "Short Answer" is selected
// //                 addFormField();
// //               });
// //               Navigator.of(context).pop();
// //             },
// //             child: Text('Short Answer'),
// //           ),
// //         ),
// //         PopupMenuItem(
// //           child: TextButton(
// //             onPressed: () {
// //               setState(() {
// //                 selectedFieldType = 'Number';
// //                 // Automatically add a new field when "Short Answer" is selected
// //                 addFormField();
// //               });
// //               Navigator.of(context).pop();
// //             },
// //             child: Text('Number'),
// //           ),
// //         ),
// //         PopupMenuItem(
// //           child: TextButton(
// //             onPressed: () {
// //               setState(() {
// //                 selectedFieldType = 'Date';
// //                 // Automatically add a new field when "Short Answer" is selected
// //                 addFormField();
// //               });
// //               Navigator.of(context).pop();
// //             },
// //             child: Text('Date'),
// //           ),
// //         ),
// //         PopupMenuItem(
// //           child: TextButton(
// //             onPressed: () {
// //               setState(() {
// //                 selectedFieldType = 'Time';
// //                 // Automatically add a new field when "Short Answer" is selected
// //                 addFormField();
// //               });
// //               Navigator.of(context).pop();
// //             },
// //             child: Text('Time'),
// //           ),
// //         ),
// //         PopupMenuItem(
// //           child: TextButton(
// //             onPressed: () {
// //               setState(() {
// //                 selectedFieldType = 'File Upload';
// //                 // Automatically add a new field when "Short Answer" is selected
// //                 addFormField();
// //               });
// //               Navigator.of(context).pop();
// //             },
// //             child: Text('File Upload'),
// //           ),
// //         ),
// //       ],
// //       elevation: 8.0,
// //     );
// //   }
// //
// //   void addFormField() {
// //     setState(() {
// //       formFields.add(FormFieldData());
// //
// //     });
// //   }
// //   void saveFormToFirestore() async {
// //     try {
// //       CollectionReference organizationCollection = FirebaseFirestore.instance.collection('organizations');
// //       DocumentReference userDocument = organizationCollection.doc(widget.email);
// //
// //       List<Map<String, dynamic>> formData = [];
// //
// //       formFields.forEach((field) {
// //         String fieldName = field.controller.text.trim();
// //         if (fieldName.isNotEmpty) {
// //           formData.add({
// //             'fieldType': selectedFieldType,
// //             fieldName: {
// //               'value': field.controller.text,
// //             },
// //           });
// //         }
// //       });
// //
// //       print('FormData: $formData'); // Add this line for debugging
// //
// //       if (formData.isNotEmpty) {
// //         List<Map<String, dynamic>> formsList = [];
// //         formsList.add({
// //           'formTitle': formTitle,
// //           'fields': formData,
// //         });
// //
// //         await userDocument.set({
// //           'forms': formsList,
// //         }, SetOptions(merge: true));
// //
// //         print('Form saved successfully!');
// //       } else {
// //         print('No valid form data to save.');
// //       }
// //     } catch (error) {
// //       print('Error saving form: $error');
// //     }
// //   }
// // }
// //
// // class FormFieldData {
// //   TextEditingController controller = TextEditingController();
// //
// // }
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class CreateForm extends StatefulWidget {
//   final String email;
//
//   CreateForm({required this.email});
//
//   @override
//   _CreateFormState createState() => _CreateFormState();
// }
// class _CreateFormState extends State<CreateForm> {
//   String selectedFieldType = 'Short Answer';
//   List<FormFieldData> formFields = [];
//   String formTitle = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Form Creator'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               decoration: InputDecoration(labelText: 'Form Title'),
//               onChanged: (value) {
//                 setState(() {
//                   formTitle = value;
//                 });
//               },
//             ),
//             SizedBox(height: 16.0),
//             Container(
//               width: double.infinity,
//               height: MediaQuery
//                   .of(context)
//                   .size
//                   .height * 0.12,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.white,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5.0),
//                   ),
//                 ),
//                 onPressed: () {
//                   showFieldTypeDropdown(context);
//                 },
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '+',
//                       style: TextStyle(
//                         fontSize: 40,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Icon(Icons.arrow_drop_down),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             if (selectedFieldType == 'Short Answer') ...[
//               TextFormField(
//                 decoration: InputDecoration(labelText: 'New Field'),
//               ),
//               SizedBox(height: 16.0),
//             ],
//             Expanded(
//               child: ListView.builder(
//                 itemCount: formFields.length,
//                 itemBuilder: (context, index) {
//                   return TextFormField(
//                     decoration: InputDecoration(
//                         labelText: 'Field ${index + 1}'),
//                   );
//                 },
//               ),
//             ),
//             Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 saveFormToFirestore();
//               },
//               child: Text('Create Form'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 padding: EdgeInsets.symmetric(vertical: 15.0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void showFieldTypeDropdown(BuildContext context) {
//     showMenu(
//       context: context,
//       position: RelativeRect.fromLTRB(0, 100, 0, 0),
//       items: [
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               setState(() {
//                 selectedFieldType = 'Paragraph';
//                 // Automatically add a new field when "Paragraph" is selected
//                 addFormField();
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text('Paragraph'),
//           ),
//         ),
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               setState(() {
//                 selectedFieldType = 'Short Answer';
//                 // Automatically add a new field when "Short Answer" is selected
//                 addFormField();
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text('Short Answer'),
//           ),
//         ),
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               setState(() {
//                 selectedFieldType = 'Number';
//                 // Automatically add a new field when "Number" is selected
//                 addFormField();
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text('Number'),
//           ),
//         ),
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               setState(() {
//                 selectedFieldType = 'Date';
//                 // Automatically add a new field when "Date" is selected
//                 addFormField();
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text('Date'),
//           ),
//         ),
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               setState(() {
//                 selectedFieldType = 'Time';
//                 // Automatically add a new field when "Time" is selected
//                 addFormField();
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text('Time'),
//           ),
//         ),
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               setState(() {
//                 selectedFieldType = 'File Upload';
//                 // Automatically add a new field when "File Upload" is selected
//                 addFormField();
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text('File Upload'),
//           ),
//         ),
//       ],
//       elevation: 8.0,
//     );
//   }
//
//   void addFormField() {
//     setState(() {
//       formFields.add(FormFieldData());
//     });
//   }
//
//   void saveFormToFirestore() async {
//     try {
//       CollectionReference organizationCollection =
//       FirebaseFirestore.instance.collection('organizations');
//       DocumentReference userDocument = organizationCollection.doc(widget.email);
//
//       List<Map<String, dynamic>> formFieldsData = [];
//
//       formFields.forEach((field) {
//         String fieldName = field.controller.text.trim();
//         if (fieldName.isNotEmpty) {
//           formFieldsData.add({
//             'fieldType': selectedFieldType,
//             'question': {
//               'value': fieldName,
//             },
//           });
//         }
//       });
//
//       print('formTitle: $formTitle');
//       print('fieldType: $selectedFieldType');
//       print('formFieldsData: $formFieldsData');
//
//       if (formTitle.isNotEmpty && selectedFieldType.isNotEmpty) {
//         Map<String, dynamic> formData = {
//           'formTitle': formTitle,
//           'fieldType': selectedFieldType,
//           'fields': formFieldsData,
//         };
//
//         await userDocument.update({
//           'forms': FieldValue.arrayUnion([formData]),
//         });
//
//         print('Form layout saved successfully!');
//       } else {
//         print('No valid form layout to save.');
//       }
//     } catch (error) {
//       print('Error saving form layout: $error');
//     }
//   }
// }
// class FormFieldData {
//   TextEditingController controller = TextEditingController();
// }
