import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/unit_screens/unit_homepage.dart';
import 'package:flutter_application_1/screens/unit_screens/unit_signup.dart';
import 'package:flutter_application_1/screens/user_screens/user_homepage.dart';
import 'package:flutter_application_1/screens/user_screens/user_signin.dart';
import 'package:flutter_application_1/screens/welcome_screen.dart';
import 'package:flutter_application_1/widgets/custom_scaffold.dart';
import 'package:flutter_application_1/theme/colors.dart';

class UnitLogin extends StatelessWidget {
  const UnitLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 25.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: 42.0,
                        height: 42.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.orange100,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const WelcomeScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )),
          Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 60.0),
                    child: Column(children: <Widget>[
                      const Expanded(
                          flex: 3,
                          child: Column(
                            children: <Widget>[
                              Text("Welcome Back",
                                  style: TextStyle(
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.orange200,
                                  )),
                              SizedBox(height: 3.0),
                              Text("Login to your Unit",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w100,
                                    color: AppColors.grey,
                                  )),
                            ],
                          )),
                      const Expanded(
                          flex: 4,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Unit ID",
                                  ),
                                ),
                                SizedBox(height: 17.0),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                  ),
                                ),
                                SizedBox(height: 1.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.orange200,
                                      ),
                                    ),
                                  ],
                                ),
                              ])),
                      Expanded(
                          flex: 3,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: double.infinity,
                                  height: 40.0,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const UnitHomepage()),
                                      );
                                    },
                                    child: const Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UnitSignup()),
                                    );
                                  },
                                  child: const Text.rich(
                                    TextSpan(
                                      text: "Don't have an account?",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w100,
                                        color: AppColors.grey,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: ' Sign Up ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.orange200,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor:
                                                AppColors.orange200,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ])),
                    ])),
              )),
        ],
      ),
    );
  }
}
