import 'package:flutter/material.dart';

void main() {
  runApp(ProfilePage());
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
        ),
        body: ProfileForm(),
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController personalNumberController =
      TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController dutyDateController = TextEditingController();

  @override
  void dispose() {
    personalNumberController.dispose();
    dateController.dispose();
    dutyDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            controller: personalNumberController,
            decoration: InputDecoration(
              labelText: 'Personal Number',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: dateController,
            decoration: InputDecoration(
              labelText: 'Date',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: dutyDateController,
            decoration: InputDecoration(
              labelText: 'Duty Date',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () {
              // Handle form submission here
              // You can access the entered values using:
              // personalNumberController.text
              // dateController.text
              // dutyDateController.text
              print('Personal Number: ${personalNumberController.text}');
              print('Date: ${dateController.text}');
              print('Duty Date: ${dutyDateController.text}');
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
