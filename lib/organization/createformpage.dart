// // CreateFormPage.dart
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:appoiter/organization/previewformpage.dart';
//
// class CreateFormPage extends StatefulWidget {
//   final String email;
//
//   CreateFormPage({required this.email});
//
//   @override
//   _CreateFormPageState createState() => _CreateFormPageState();
// }
//
// class _CreateFormPageState extends State<CreateFormPage> {
//   // TextEditingController formNameController = TextEditingController();
//   List<List<TextEditingController>> formFieldsControllers = [];
//   List<List<String>> formFieldsAnswerTypes = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Create Form'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.add),
//             onPressed: () {
//               addFormField();
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Expanded(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     // TextFormField(
//                     //   controller: formNameController,
//                     //   decoration: InputDecoration(labelText: 'Form Name'),
//                     //   validator: (value) {
//                     //     if (value == null || value.isEmpty) {
//                     //       return 'Please enter a form name';
//                     //     }
//                     //     return null;
//                     //   },
//                     // ),
//                     SizedBox(height: 16.0),
//                     // Display form fields with delete and options buttons
//                     for (int i = 0; i < formFieldsControllers.length; i++)
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: TextFormField(
//                                   controller: formFieldsControllers[i][0], // Use the appropriate controller
//                                   decoration: InputDecoration(labelText: 'Field ${i + 1}'),
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return 'Field cannot be empty';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.more_vert), // "Options" button
//                                 onPressed: () {
//                                   showOptionsDialog(i);
//                                 },
//                               ),
//                               IconButton(
//                                 icon: Icon(Icons.delete),
//                                 onPressed: () {
//                                   deleteFormField(i);
//                                 },
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 8.0),
//                           Text('Answer Type: ${formFieldsAnswerTypes[i][0]}'),
//                           SizedBox(height: 16.0),
//                         ],
//                       ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     // Add your logic to save the form here
//                     saveFormDataToFirebase(email: widget.email);
//                   },
//                   child: Text('Save Form'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // void saveFormDataToFirebase({required String email}) {
//   //   try {
//   //     // Replace 'organizations' with your actual collection name
//   //     CollectionReference organizationCollection =
//   //     FirebaseFirestore.instance.collection('organizations');
//   //
//   //     // Get the reference to the document using the user's email as the ID
//   //     DocumentReference userDocument = organizationCollection.doc(email);
//   //
//   //     // Create a list of maps representing the form data
//   //     List<Map<String, dynamic>> formDataList = [];
//   //     for (int i = 0; i < formFieldsControllers.length; i++) {
//   //       Map<String, dynamic> formData = {
//   //         'field${i + 1}': formFieldsControllers[i].text.trim(),
//   //         'field${i + 1}answertype': formFieldsAnswerTypes[i],
//   //       };
//   //       formDataList.add(formData);
//   //     }
//   //
//   //     // Update the 'forms' array in the document by adding the new form data
//   //     userDocument.update({
//   //       'forms': FieldValue.arrayUnion(formDataList),
//   //     }).then((value) {
//   //       print('Form data saved to Firebase');
//   //     }).catchError((error) {
//   //       print('Error saving form data to Firebase: $error');
//   //     });
//   //   } catch (error) {
//   //     print('Error saving form data: $error');
//   //   }
//   // }
//   void saveFormDataToFirebase({required String email}) {
//     try {
//       // Replace 'organizations' with your actual collection name
//       CollectionReference organizationCollection =
//       FirebaseFirestore.instance.collection('organizations');
//
//       // Get the reference to the document using the user's email as the ID
//       DocumentReference userDocument = organizationCollection.doc(email);
//
//       // Create a list of maps representing the form data
//       List<Map<String, dynamic>> formDataList = [];
//       for (int i = 0; i < formFieldsControllers.length; i++) {
//         Map<String, dynamic> formData = {
//           'field${i + 1}': formFieldsControllers[i][0].text.trim(), // Use the first controller in the inner list
//           'field${i + 1}answertype': formFieldsAnswerTypes[i][0],
//         };
//         formDataList.add(formData);
//       }
//
//       // Update the 'forms' array in the document by adding the new form data
//       userDocument.update({
//         'forms': FieldValue.arrayUnion(formDataList),
//       }).then((value) {
//         print('Form data saved to Firebase');
//       }).catchError((error) {
//         print('Error saving form data to Firebase: $error');
//       });
//     } catch (error) {
//       print('Error saving form data: $error');
//     }
//   }
//
//   void addFormField() {
//     setState(() {
//       List<TextEditingController> controllers = [TextEditingController()];
//       List<String> answerTypes = ['Short Answer'];
//       formFieldsControllers.add(controllers);
//       formFieldsAnswerTypes.add(answerTypes);
//     });
//   }
//
//   void deleteFormField(int index) {
//     setState(() {
//       formFieldsControllers.removeAt(index);
//       formFieldsAnswerTypes.removeAt(index);
//     });
//   }
//
//   bool validateForm() {
//     for (var controllersList in formFieldsControllers) {
//       for (var controller in controllersList) {
//         if (controller.text.isEmpty) {
//           return false;
//         }
//       }
//     }
//     return true;
//   }
//
//
//   void showOptionsDialog(int index) {
//     showFieldTypeDropdown(context, index);
//   }
//
//   void showFieldTypeDropdown(BuildContext context, int index) {
//     String selectedFieldType = formFieldsControllers[index][0].text;
//
//     showMenu(
//       context: context,
//       position: RelativeRect.fromLTRB(0, 100, 0, 0),
//       items: [
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               updateFieldType(index, 'Short Answer');
//               Navigator.of(context).pop();
//             },
//             child: Text('Short Answer'),
//           ),
//         ),
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               updateFieldType(index, 'Number');
//               Navigator.of(context).pop();
//             },
//             child: Text('Number'),
//           ),
//         ),
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               updateFieldType(index, 'Time');
//               Navigator.of(context).pop();
//             },
//             child: Text('Time'),
//           ),
//         ),
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               updateFieldType(index, 'Date');
//               Navigator.of(context).pop();
//             },
//             child: Text('Date'),
//           ),
//         ),
//         PopupMenuItem(
//           child: TextButton(
//             onPressed: () {
//               updateFieldType(index, 'File Upload');
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
//   void updateFieldType(int index, String fieldType) {
//     setState(() {
//       formFieldsAnswerTypes[index][0] = fieldType;
//     });
//   }
//
// }

// CreateFormPage.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CreateFormPage extends StatefulWidget {
  final String email;

  CreateFormPage({required this.email});

  @override
  _CreateFormPageState createState() => _CreateFormPageState();
}

class _CreateFormPageState extends State<CreateFormPage> {
  List<List<TextEditingController>> formFieldsControllers = [];
  List<List<String>> formFieldsAnswerTypes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Form'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              addFormField();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Display form fields with delete and options buttons
                    for (int i = 0; i < formFieldsControllers.length; i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: formFieldsControllers[i][0], // Use the first controller in the inner list
                                  decoration: InputDecoration(labelText: 'Field ${i + 1}'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Field cannot be empty';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.more_vert), // "Options" button
                                onPressed: () {
                                  showOptionsDialog(i);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  deleteFormField(i);
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Text('Answer Type: ${formFieldsAnswerTypes[i][0]}'),
                          SizedBox(height: 16.0),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your logic to save the form here
                    saveFormDataToFirebase(email: widget.email);
                  },
                  child: Text('Save Form'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void saveFormDataToFirebase({required String email}) {
    try {
      // Replace 'organizations' with your actual collection name
      CollectionReference organizationCollection =
      FirebaseFirestore.instance.collection('organizations');

      // Get the reference to the document using the user's email as the ID
      DocumentReference userDocument = organizationCollection.doc(email);

      // Create a list of maps representing the form data
      List<Map<String, dynamic>> formDataList = [];
      for (int i = 0; i < formFieldsControllers.length; i++) {
        Map<String, dynamic> formData = {
          'field${i + 1}': formFieldsControllers[i].map((controller) => controller.text.trim()).toList(),
          'field${i + 1}answertype': formFieldsAnswerTypes[i][0],
        };
        formDataList.add(formData);
      }

      // Update the 'forms' array in the document with the new form data
      userDocument.update({
        'forms': formDataList,
      }).then((value) {
        print('Form data saved to Firebase');
        // Clear the form fields after saving
        clearFormFields();
      }).catchError((error) {
        print('Error saving form data to Firebase: $error');
      });
    } catch (error) {
      print('Error saving form data: $error');
    }
  }

  void clearFormFields() {
    setState(() {
      formFieldsControllers.clear();
      formFieldsAnswerTypes.clear();
    });
  }

  void addFormField() {
    setState(() {
      List<TextEditingController> controllers = [TextEditingController()];
      List<String> answerTypes = ['Short Answer'];
      formFieldsControllers.add(controllers);
      formFieldsAnswerTypes.add(answerTypes);
    });
  }

  void deleteFormField(int index) {
    setState(() {
      formFieldsControllers.removeAt(index);
      formFieldsAnswerTypes.removeAt(index);
    });
  }

  void showOptionsDialog(int index) {
    showFieldTypeDropdown(context, index);
  }

  void showFieldTypeDropdown(BuildContext context, int index) {
    String selectedFieldType = formFieldsControllers[index][0].text;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0, 100, 0, 0),
      items: [
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              updateFieldType(index, 'Short Answer');
              Navigator.of(context).pop();
            },
            child: Text('Short Answer'),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              updateFieldType(index, 'Number');
              Navigator.of(context).pop();
            },
            child: Text('Number'),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              updateFieldType(index, 'Time');
              Navigator.of(context).pop();
            },
            child: Text('Time'),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              updateFieldType(index, 'Date');
              Navigator.of(context).pop();
            },
            child: Text('Date'),
          ),
        ),
        PopupMenuItem(
          child: TextButton(
            onPressed: () {
              updateFieldType(index, 'File Upload');
              Navigator.of(context).pop();
            },
            child: Text('File Upload'),
          ),
        ),
      ],
      elevation: 8.0,
    );
  }

  void updateFieldType(int index, String fieldType) {
    setState(() {
      formFieldsAnswerTypes[index][0] = fieldType;
    });
  }
}

