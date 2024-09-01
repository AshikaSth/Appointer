import 'package:appoiter/organization/createformpage.dart';
import 'package:appoiter/organization/defaultformpage.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  final String email;

  FormPage({required this.email});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to CreateFormPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DefaultFormPage(email: widget.email),
                ),
              );
            },
            child: Text('Default Form'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to CreateFormPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateFormPage(email: widget.email),
                ),
              );
            },
            child: Text('Create Form'),
          ),
        ],
      ),
    );
  }
}
