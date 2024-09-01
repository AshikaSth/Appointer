import 'package:flutter/material.dart';

class DefaultFormPage extends StatefulWidget {
  final String email;

  DefaultFormPage({required this.email});

  @override
  _DefaultFormPageState createState() => _DefaultFormPageState();
}

class _DefaultFormPageState extends State<DefaultFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Form fields variables
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  String? _selectedAppointmentType;
  String? _selectedHowYouKnew;
  TimeOfDay? _appointmentTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Default Form'),
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
                  controller: _dobController,
                  decoration: InputDecoration(labelText: 'Date of Birth'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your date of birth';
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
                  keyboardType: TextInputType.phone,
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
                Row(
                  children: [
                    Text('Appointment Time:'),
                    TextButton(
                      onPressed: () {
                        _selectAppointmentTime(context);
                      },
                      child: Text(
                        _appointmentTime != null
                            ? _appointmentTime!.format(context)
                            : 'Select Time',
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, save the data or perform any action
                      // For now, just print the form data along with the email
                      print('Email: ${widget.email}');
                      print('Name: ${_nameController.text}');
                      print('Date of Birth: ${_dobController.text}');
                      print('Address: ${_addressController.text}');
                      print('Phone Number: ${_phoneNumberController.text}');
                      print('Type of Appointment: $_selectedAppointmentType');
                      print('How did you know about us? $_selectedHowYouKnew');
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
  Future<void> _selectAppointmentTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _appointmentTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _appointmentTime = picked;
      });
    }
  }
}
