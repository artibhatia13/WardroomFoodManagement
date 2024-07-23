import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/custom_scaffold.dart';

class UserMenu extends StatefulWidget {
  const UserMenu({Key? key}) : super(key: key);

  @override
  _UserMenuState createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  int activeIndex =
      0; // Track the index of the active date, -1 means none active

  List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  List<int> padding = [1, 22, 18, 20, 13, 12, 16];
  List<String> dates = ["15", "16", "17", "18", "19", "20", "21"];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              children: [
                const Text(
                  "MENU",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Handle the download action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(75, 138, 165, 0.49),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10.0),
                  ),
                  icon: const Icon(Icons.download_rounded),
                  label: const Text(
                    "Weekly Menu",
                    style: TextStyle(fontSize: 10.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: weekdays
                    .map((day) => Text(
                          day,
                          style: const TextStyle(color: Colors.white),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 7.0),
            Row(
              children: dates.asMap().entries.map((entry) {
                int index = entry.key;
                String date = entry.value;
                int padAmount = padding[index];
                bool isActive = activeIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: padAmount.toDouble()),
                    child: Container(
                      width: 34, // Adjust the width of the container as needed
                      height:
                          34, // Adjust the height of the container as needed
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive
                            ? const Color.fromRGBO(75, 138, 165, 1)
                            : Colors.transparent,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        date,
                        style: TextStyle(
                          color: isActive
                              ? Colors.white
                              : Color.fromRGBO(175, 173, 173, 1),
                          fontWeight:
                              isActive ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 18.0),
            Container(
              height: 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(167, 167, 167, 0.6)),
            )
          ],
        ),
      ),
    );
  }
}
