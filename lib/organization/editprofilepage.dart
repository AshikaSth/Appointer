// // editprofile.dart
//
// import 'package:flutter/material.dart';
//
// class EditProfilePage extends StatelessWidget {
//   final String email;
//
//   EditProfilePage({required this.email});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('This is the Edit Profile page'),
//             Text('Email: $email'),
//             // Add your edit profile content here
//           ],
//         ),
//       ),
//     );
//   }
// }
// editprofile.dart

// editprofile.dart

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/cupertino.dart';


class EditProfilePage extends StatefulWidget {
  final String email;

  EditProfilePage({required this.email});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _organizationTypeController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TimeOfDay? _openingTime;
  TimeOfDay? _closingTime;
  String _imageUrl = ''; // Initialize _imageUrl with an empty string
  File? _selectedImage;
  List<Widget> additionalFields = [];

  @override
  void initState() {
    super.initState();
    // Fetch organization details when the page is initialized
    _fetchOrganizationDetails();
  }

  void _fetchOrganizationDetails() async {
    try {
      // Access Firebase to get organization details based on the passed email
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('organizations')
          .doc(widget.email)
          .get();

      if (snapshot.exists) {
        // Update the form fields with organization details
        setState(() {
          _nameController.text = snapshot.data()?['name'] ?? '';
          _addressController.text = snapshot.data()?['address'] ?? '';
          _phoneNumberController.text = snapshot.data()?['contact'] ?? '';
          _organizationTypeController.text = snapshot.data()?['orgType'] ?? '';
          _descriptionController.text = snapshot.data()?['description'] ?? '';
          // Set the image URL
          _imageUrl = snapshot.data()?['ImageURL'] ?? '';

          // Set placeholders for Opening Time and Closing Time
          _openingTime = _convertStringToTime(snapshot.data()?['openingTime']);
          _closingTime = _convertStringToTime(snapshot.data()?['closingTime']);
        });
      } else {
        print('Organization details not found.');
      }
    } catch (e) {
      print('Error fetching organization details: $e');
    }
  }

  TimeOfDay? _convertStringToTime(String? timeString) {
    if (timeString != null) {
      List<String> timeComponents = timeString.split(':');
      return TimeOfDay(
        hour: int.parse(timeComponents[0]),
        minute: int.parse(timeComponents[1]),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: Colors.grey,
              child: _imageUrl.isNotEmpty
                  ? Image.network(
                _imageUrl,
                fit: BoxFit.cover,
              )
                  : IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  _showImageSelectionBottomSheet(context);
                },
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                if (_imageUrl.isNotEmpty) {
                  _saveProfilePicture();
                } else {
                  // Handle the case where no image is selected
                  // You can show a message or take appropriate action
                }
              },
              child: Text('Save Profile Picture'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                    DropdownButtonFormField<String>(
                      value: _organizationTypeController.text,
                      onChanged: (value) {
                        setState(() {
                          _organizationTypeController.text = value ?? '';
                        });
                      },
                      items: <String>[
                        'Non-profit',
                        'Business',
                        'Educational Institution',
                        'Government',
                        'Healthcare',
                        'Technology',
                        'Other'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                          labelText: 'Organization Type'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
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
                            _selectTime(
                                context, _openingTime ?? TimeOfDay.now(), (
                                time) {
                              setState(() {
                                _openingTime = time;
                              });
                            });
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
                            _selectTime(
                                context, _closingTime ?? TimeOfDay.now(), (
                                time) {
                              setState(() {
                                _closingTime = time;
                              });
                            });
                          },
                          child: Text(
                            _closingTime != null
                                ? _closingTime!.format(context)
                                : 'Select Time',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(), // This will expand to fill the remaining space
                        ),
                        TextButton(
                          onPressed: () {
                            _addMoreField();
                          },
                          child: Text('Add More'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Added space between the "Add More" button and the next widget
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Save the form data
                          //_saveFormData();
                        }
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _saveOrganizationData(String? imageUrl) async {
    try {
      // Get a reference to the Firestore collection for organizations
      CollectionReference organizations = FirebaseFirestore.instance.collection('organizations');

      // Use the email as the document ID for simplicity, replace this with a unique ID generation logic
      String documentId = widget.email;

      // Create a map to hold the fields that need to be updated
      Map<String, dynamic> updateData = {
        'name': _nameController.text,
        'address': _addressController.text,
        'contact': _phoneNumberController.text,
        'orgType': _organizationTypeController.text,
        'description': _descriptionController.text,
        'openingTime': _openingTime?.format(context),
        'closingTime': _closingTime?.format(context),
        // Add other fields as needed
      };

      // Add the 'ImageURL' field to the map if imageUrl is not null
      if (imageUrl != null) {
        updateData['ImageURL'] = imageUrl;
      }

      // Update the specific fields in the Firestore document
      await organizations.doc(documentId).update(updateData);

      // Print a success message to the console
      print('Organization data updated successfully.');

      // You can also navigate back or perform other actions after saving the data
      Navigator.pop(context);
    } catch (e) {
      // Handle errors, e.g., print an error message to the console
      print('Error updating organization data: $e');
    }
  }


  Future<void> _selectTime(BuildContext context,
      TimeOfDay initialTime,
      Function(TimeOfDay) onTimeSelected,) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );

    if (selectedTime != null && selectedTime != initialTime) {
      onTimeSelected(selectedTime);
    }
  }

  void _showImageSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Take Photo'),
              onTap: () {
                _getImage(ImageSource.camera);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Choose from Gallery'),
              onTap: () {
                _getImage(ImageSource.gallery);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _selectedImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Method to add more fields dynamically
  // Method to add more fields dynamically
  void _addMoreField() {
    setState(() {
      additionalFields.add(
        TextFormField(
          controller: TextEditingController(),
          decoration: InputDecoration(labelText: 'New Field'),
        ),
      );
    });
  }
}
void _saveProfilePicture() {
  // Add your logic here to save the profile picture
  // For example, you can update the Firebase Firestore document with the new image URL
  // Or perform any other action based on your app's requirements
  // The current implementation is just a placeholder, replace it with your actual logic
  print('Profile picture saved!');
}


void _showImageSelectionBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Wrap(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Take Photo'),
            onTap: () async {
              Navigator.pop(context);
              await _requestCameraPermissionAndOpenCamera(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.photo),
            title: Text('Choose from Gallery'),
            onTap: () async {
              Navigator.pop(context);
              await _requestGalleryPermissionAndOpenGallery(context);
            },
          ),
        ],
      );
    },
  );
}
Future<void> _requestCameraPermissionAndOpenCamera(BuildContext context) async {
  var status = await Permission.camera.request();
  if (status.isGranted) {
    //_getImage(ImageSource.camera);
  } else {
    _showPermissionDeniedDialog(context);
  }
}

Future<void> _requestGalleryPermissionAndOpenGallery(BuildContext context) async {
  var status = await Permission.photos.request();
  if (status.isGranted) {
    //_getImage(ImageSource.gallery);
  } else {
    _showPermissionDeniedDialog(context);
  }
}

// Future<void> _getImage(ImageSource source) async {
//   final pickedFile = await ImagePicker().pickImage(source: source);
//
//   // setState(() {
//   //   if (pickedFile != null) {
//   //     _selectedImage = File(pickedFile.path);
//   //   } else {
//   //     print('No image selected.');
//   //   }
//   });
// }

void _showPermissionDeniedDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Permission Denied'),
        content: Text('Please grant the necessary permissions to access the camera or gallery.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}