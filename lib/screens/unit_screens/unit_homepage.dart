import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/unit_screens/headcount.dart';
import 'package:flutter_application_1/screens/unit_screens/upload_menu.dart';
import 'package:flutter_application_1/screens/unit_screens/view_feedback.dart';
import 'package:flutter_application_1/screens/user_screens/user_feedback.dart';
import 'package:flutter_application_1/screens/user_screens/user_menu.dart';
import 'package:flutter_application_1/screens/user_screens/user_profile.dart';
import 'package:flutter_application_1/theme/colors.dart';
import 'package:flutter_application_1/widgets/icon_only_navigation.dart';

class UnitHomepage extends StatefulWidget {
  const UnitHomepage({super.key});

  @override
  State<UnitHomepage> createState() => _UnitHomepageState();
}

class _UnitHomepageState extends State<UnitHomepage> {
  int currentPageIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: AppColors.grey,
        height: 60.0,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: <Widget>[
          IconOnlyNavigation(
            icon: Icon(
              Icons.menu_book_outlined,
              color: Colors.grey[400],
              size: 30.0,
            ),
            selectedIcon: const Icon(
              Icons.menu_book_outlined,
              color: AppColors.orange200,
              size: 37.0,
            ),
            isSelected: currentPageIndex == 0,
            onTap: () => _onItemTapped(0),
          ),
          IconOnlyNavigation(
            icon: Icon(
              Icons.groups_2_outlined,
              color: Colors.grey[400],
              size: 38.0,
            ),
            selectedIcon: const Icon(
              Icons.groups_2_outlined,
              color: AppColors.orange200,
              size: 45.0,
            ),
            isSelected: currentPageIndex == 1,
            onTap: () => _onItemTapped(1),
          ),
          IconOnlyNavigation(
            icon: Icon(
              Icons.thumbs_up_down_outlined,
              color: Colors.grey[400],
              size: 32.0,
            ),
            selectedIcon: const Icon(
              Icons.thumbs_up_down_outlined,
              color: AppColors.orange200,
              size: 39.0,
            ),
            isSelected: currentPageIndex == 2,
            onTap: () => _onItemTapped(2),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: <Widget>[
              const ViewFeedback(),
              const Headcount(),
              const UploadMenu(),
            ][currentPageIndex],
          ),
        ),
      ),
    );
  }
}
