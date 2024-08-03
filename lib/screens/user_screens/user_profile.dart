import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController personalController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController preferenceController = TextEditingController();

  final TextEditingController dateController = TextEditingController();
  final TextEditingController newunitController = TextEditingController();
  final TextEditingController durationController = TextEditingController();

  final TextEditingController dutyDateController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();

  bool isEditingPersonal = false;
  bool isEditingDate = false;
  bool isEditingDutyDate = false;

  @override
  void dispose() {
    personalController.dispose();
    nameController.dispose();
    preferenceController.dispose();

    dateController.dispose();
    newunitController.dispose();
    durationController.dispose();

    dutyDateController.dispose();
    fromController.dispose();
    toController.dispose();

    super.dispose();
  }

  void toggleEditingMode(String field) {
    setState(() {
      if (field == 'personal') {
        isEditingPersonal = !isEditingPersonal;
        if (!isEditingPersonal) {
          nameController.text = '';
          preferenceController.text = '';
        }
      } else if (field == 'date') {
        isEditingDate = !isEditingDate;
        if (!isEditingDate) {
          newunitController.text = '';
          durationController.text = '';
        }
      } else if (field == 'dutyDate') {
        isEditingDutyDate = !isEditingDutyDate;
        if (!isEditingDutyDate) {
          fromController.text = '';
          toController.text = '';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Personal ${personalController.text}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              IconButton(
                icon: isEditingPersonal
                    ? const Icon(Icons.keyboard_arrow_up)
                    : const Icon(Icons.border_color, size: 20.0),
                onPressed: () {
                  toggleEditingMode('personal');
                },
              ),
            ],
          ),
          if (isEditingPersonal) ...[
            const SizedBox(height: 16.0),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: preferenceController,
              decoration: const InputDecoration(
                labelText: 'Preference',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 100, // Adjust the width as needed
                height: 40, // Adjust the height as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                    print('Saving'); // Check later
                  },
                  child: const Text('Save'),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.zero, // Removes extra padding if necessary
                  ),
                ),
              ),
            )
          ],

          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Change of Unit ${dateController.text}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              IconButton(
                icon: isEditingDate
                    ? const Icon(Icons.keyboard_arrow_up)
                    : const Icon(Icons.border_color, size: 20.0),
                onPressed: () {
                  toggleEditingMode('date');
                },
              ),
            ],
          ),
          if (isEditingDate) ...[
            const SizedBox(height: 16.0),
            TextFormField(
              controller: newunitController,
              decoration: const InputDecoration(
                labelText: 'New Unit ID',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: durationController,
              decoration: InputDecoration(
                labelText: 'Duration',
                suffixIcon: Icon(
                  Icons.today,
                  color: AppColors.orange200.withOpacity(0.8),
                ),
                border: OutlineInputBorder(),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  // initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  // setState(() {
                  //   _selectedDate = pickedDate;
                  //   String formattedDate = DateFormat('dd-MM-yy').format(pickedDate);
                  //   _lastDayInUnit.text = formattedDate;
                  // });
                }
              },
            ),
            const SizedBox(height: 16.0), // Space before the button
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 100, // Adjust the width as needed
                height: 40, // Adjust the height as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                    print('Saving'); // Check later
                  },
                  child: const Text('Save'),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.zero, // Removes extra padding if necessary
                  ),
                ),
              ),
            )
          ],
          const SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Leave/Ty Dy Details ${dutyDateController.text}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              IconButton(
                icon: isEditingDutyDate
                    ? const Icon(Icons.keyboard_arrow_up)
                    : const Icon(Icons.border_color, size: 20.0),
                onPressed: () {
                  toggleEditingMode('dutyDate');
                },
              ),
            ],
          ),
          if (isEditingDutyDate) ...[
            const SizedBox(height: 16.0),
            TextFormField(
              controller: fromController,
              decoration: const InputDecoration(
                labelText: 'From',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: toController,
              decoration: const InputDecoration(
                labelText: 'To',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32.0),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: 100, // Adjust the width as needed
                height: 40, // Adjust the height as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                    print('Saving'); // Check later
                  },
                  child: const Text('Save'),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.zero, // Removes extra padding if necessary
                  ),
                ),
              ),
            )
          ],

          //ElevatedButton(
          //onPressed: () {
          // Handle form submission here
          // print('Personal Number ${personalController.text}');
          //print('Date ${dateController.text}');
          //print('Duty Date ${dutyDateController.text}');
          // },
          // child: const Text('Save'),
          //),
        ],
      ),
    );
  }
}
