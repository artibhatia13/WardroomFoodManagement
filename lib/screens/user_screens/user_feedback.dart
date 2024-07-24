import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

class UserFeedback extends StatelessWidget {
  const UserFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(
        height: 10.0,
      ),
      const Text(
        "Feed Us Your Thoughts!",
        style: TextStyle(
            color: AppColors.black,
            fontSize: 28.0,
            fontWeight: FontWeight.w600),
      ),
      const SizedBox(
        height: 5.0,
      ),
      const Text(
        "Your Opinion is Our Secret Ingredient",
        style: TextStyle(
            color: AppColors.grey, fontSize: 12.0, fontWeight: FontWeight.w300),
      ),
      const SizedBox(height: 55.0),
      TextField(
        readOnly: true,
        // controller: _lastDayInUnit,
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: "Date",
          suffixIcon: Icon(
            Icons.today,
            color: AppColors.orange200.withOpacity(0.8),
          ),
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
      const SizedBox(height: 10.0),
      const TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: "Meal",
        ),
      ),
      const SizedBox(height: 10.0),
      const TextField(
        maxLines: 5, // Set the number of lines for the input field
        decoration: InputDecoration(
          fillColor: Colors.white,
          labelText: 'Feedback',
        ),
      ),
      const SizedBox(height: 30.0),
      SizedBox(
        width: double.infinity,
        height: 40.0,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            'Submit Feedback',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ]);
  }
}
