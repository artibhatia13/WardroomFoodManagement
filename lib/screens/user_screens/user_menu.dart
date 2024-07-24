import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/colors.dart';

class UserMenu extends StatefulWidget {
  const UserMenu({Key? key}) : super(key: key);

  @override
  _UserMenuState createState() => _UserMenuState();
}

class _UserMenuState extends State<UserMenu> {
  List<String> weekdays = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  String wardroomName = "Valsura";
  bool _switchValue = true;

  final List<Map<String, String>> meals = [
    {"title": "Breakfast", "image": "assets/images/cereals.jpeg"},
    {"title": "Lunch", "image": "assets/images/lunch.jpeg"},
    {"title": "Dinner", "image": "assets/images/dinner.jpeg"},
  ];

  final List<Map<String, dynamic>> weeklyMenu = [
    {
      "key": 0,
      "date": "28-07-2024",
      "day": "Mon",
      "menu": [
        {
          "meal": "Breakfast",
          "food": [
            "bhaji",
            "paav",
            "sweet corn chat",
            "cold coffee/ milk",
            "fresh fruits"
          ]
        },
        {
          "meal": "Lunch",
          "food": [
            "roti/ pulao",
            "palak paneer",
            "moong daal",
            "cold coffee/ milk",
            "aalo bhindi",
            "diplomatic pudding"
          ]
        },
        {
          "meal": "Dinner",
          "food": [
            "roti/ rice",
            "paneer bhuji",
            "rajma daal",
            "cold coffee/ milk",
            "aalo baigan"
          ]
        },
      ]
    },
    {
      "key": 1,
      "date": "29-07-2024",
      "day": "Tue",
      "menu": [
        {
          "meal": "Breakfast",
          "food": [
            "bhaji",
            "paav",
            "sweet corn chat",
            "cold coffee/ milk",
            "fresh fruits"
          ]
        },
        {
          "meal": "Lunch",
          "food": [
            "roti/ pulao",
            "palak paneer",
            "moong daal",
            "cold coffee/ milk",
            "aalo bhindi",
            "diplomatic pudding"
          ]
        },
        {
          "meal": "Dinner",
          "food": [
            "roti/ rice",
            "paneer bhuji",
            "rajma daal",
            "cold coffee/ milk",
            "aalo baigan"
          ]
        },
      ]
    },
    {
      "key": 2,
      "date": "30-07-2024",
      "day": "Wed",
      "menu": [
        {
          "meal": "Breakfast",
          "food": [
            "bhaji",
            "paav",
            "sweet corn chat",
            "cold coffee/ milk",
            "fresh fruits"
          ]
        },
        {
          "meal": "Lunch",
          "food": [
            "roti/ pulao",
            "palak paneer",
            "moong daal",
            "cold coffee/ milk",
            "aalo bhindi",
            "diplomatic pudding"
          ]
        },
        {
          "meal": "Dinner",
          "food": [
            "roti/ rice",
            "paneer bhuji",
            "rajma daal",
            "cold coffee/ milk",
            "aalo baigan"
          ]
        },
      ]
    },
    {
      "key": 3,
      "date": "31-07-2024",
      "day": "Thu",
      "menu": [
        {
          "meal": "Breakfast",
          "food": [
            "bhaji",
            "paav",
            "sweet corn chat",
            "cold coffee/ milk",
            "fresh fruits"
          ]
        },
        {
          "meal": "Lunch",
          "food": [
            "roti/ pulao",
            "palak paneer",
            "moong daal",
            "cold coffee/ milk",
            "aalo bhindi",
            "diplomatic pudding"
          ]
        },
        {
          "meal": "Dinner",
          "food": [
            "roti/ rice",
            "paneer bhuji",
            "rajma daal",
            "cold coffee/ milk",
            "aalo baigan"
          ]
        },
      ]
    },
    {
      "key": 4,
      "date": "01-08-2024",
      "day": "Fri",
      "menu": [
        {
          "meal": "Breakfast",
          "food": [
            "bhaji",
            "paav",
            "sweet corn chat",
            "cold coffee/ milk",
            "fresh fruits"
          ]
        },
        {
          "meal": "Lunch",
          "food": [
            "roti/ pulao",
            "palak paneer",
            "moong daal",
            "cold coffee/ milk",
            "aalo bhindi",
            "diplomatic pudding"
          ]
        },
        {
          "meal": "Dinner",
          "food": [
            "roti/ rice",
            "paneer bhuji",
            "rajma daal",
            "cold coffee/ milk",
            "aalo baigan"
          ]
        },
      ]
    },
    {
      "key": 5,
      "date": "02-07-2024",
      "day": "Sat",
      "menu": [
        {
          "meal": "Breakfast",
          "food": [
            "bhaji",
            "paav",
            "sweet corn chat",
            "cold coffee/ milk",
            "fresh fruits"
          ]
        },
        {
          "meal": "Lunch",
          "food": [
            "roti/ pulao",
            "palak paneer",
            "moong daal",
            "cold coffee/ milk",
            "aalo bhindi",
            "diplomatic pudding"
          ]
        },
        {
          "meal": "Dinner",
          "food": [
            "roti/ rice",
            "paneer bhuji",
            "rajma daal",
            "cold coffee/ milk",
            "aalo baigan"
          ]
        },
      ]
    },
    {
      "key": 6,
      "date": "03-07-2024",
      "day": "Sun",
      "menu": [
        {
          "meal": "Breakfast",
          "food": [
            "bhaji",
            "paav",
            "sweet corn chat",
            "cold coffee/ milk",
            "fresh fruits"
          ]
        },
        {
          "meal": "Lunch",
          "food": [
            "roti/ pulao",
            "palak paneer",
            "moong daal",
            "cold coffee/ milk",
            "aalo bhindi",
            "diplomatic pudding"
          ]
        },
        {
          "meal": "Dinner",
          "food": [
            "roti/ rice",
            "paneer bhuji",
            "rajma daal",
            "cold coffee/ milk",
            "aalo baigan"
          ]
        },
      ]
    },
  ];

  int activeIndex = 0;
  String activeMeal = "Breakfast";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15.0),
        _MenuHeader(),
        const SizedBox(height: 38.0),
        _buildDaySelector(),
        const SizedBox(height: 18.0),
        Container(
          height: 1.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[350],
          ),
        ),
        const SizedBox(height: 15.0),
        _buildMealSelector(),
        const SizedBox(height: 35.0),
        _buildMenuItems(),
        const SizedBox(height: 15.0),
        SizedBox(
          width: double.infinity,
          height: 40.0,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(
              'Submit',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // MenuHeader Widget
  Widget _MenuHeader() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Peek the menu &",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 22, // Set your desired height here
              child: ElevatedButton.icon(
                onPressed: () {
                  // Handle the download action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange200.withOpacity(0.7),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 2.0),
                ),
                icon: const Icon(
                  Icons.download,
                  color: Colors.white,
                  size: 15.0,
                ),
                label: const Text(
                  "Weekly Menu",
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 5.0),
        const Row(
          children: [
            Text(
              "Say if you are in!",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // DateSelector Widget
  Widget _buildDaySelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      textBaseline: TextBaseline.alphabetic,
      children: List.generate(weeklyMenu.length, (index) {
        bool isActive = activeIndex == index;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weeklyMenu[index]["day"],
              style: TextStyle(color: AppColors.black.withOpacity(0.8)),
            ),
            const SizedBox(height: 6.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                  activeMeal = "Breakfast";
                });
              },
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive ? AppColors.orange200 : Colors.transparent,
                ),
                alignment: Alignment.center,
                child: Text(
                  weeklyMenu[index]["date"].toString().substring(0, 2),
                  style: TextStyle(
                    color: isActive ? Colors.white : AppColors.grey,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // MealSelector Widget
  Widget _buildMealSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(meals.length, (index) {
        final meal = meals[index];
        final isActive = meal["title"] == activeMeal;

        return GestureDetector(
          onTap: () => setState(() {
            activeMeal = meal["title"]!;
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              color: isActive
                  ? AppColors.orange200.withOpacity(0.88)
                  : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 15.0, bottom: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      meal["image"]!,
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    meal["title"]!,
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                      color: isActive ? Colors.white : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMenuItems() {
    List<String> foodItems = weeklyMenu[activeIndex]["menu"]
        .firstWhere((meal) => meal["meal"] == activeMeal)["food"]
        .cast<String>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text("Dine with us?",
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 5.0,
            ),
            SizedBox(
                width: 35,
                height: 18,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    value: _switchValue,
                    onChanged: (bool value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                    activeTrackColor: Colors.green[400],
                    inactiveTrackColor: Colors.grey[400],
                    thumbColor: const WidgetStatePropertyAll(Colors.white),
                    trackOutlineColor:
                        const WidgetStatePropertyAll(Colors.transparent),
                  ),
                )),
          ],
        ),
        const SizedBox(height: 10.0),
        Column(
          children: foodItems.map((item) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8.0), // Space between items
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(12.0), // Padding inside the container
                child: Text(
                  item,
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 13.0,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
