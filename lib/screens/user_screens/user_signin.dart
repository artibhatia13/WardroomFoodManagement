import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/user_screens/user_menu.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/screens/user_screens/user_login.dart';
import 'package:flutter_application_1/theme/colors.dart';

class UserSignin extends StatelessWidget {
  const UserSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: <Widget>[
                      Container(
                        width: 42.0,
                        height: 42.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.orange200.withOpacity(0.4),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserLogin()),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60.0),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Register",
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orange200,
                      )),
                  SizedBox(height: 3.0),
                  Text("Create your new account",
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w100,
                        color: AppColors.grey,
                      )),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Column(
                children: <Widget>[
                  const SignUpForm(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserSignin()),
                      );
                    },
                    child: const Text.rich(
                      TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w100,
                          color: AppColors.grey,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Sign Up ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.orange200,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.orange200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _mobileNumber;
  String? _password;
  String? _confirmPassword;
  String? _unitId;
  TextEditingController _lastDayInUnit = TextEditingController();
  String? _preference;
  DateTime? _selectedDate;
  bool _rankError = false;
  bool _mobileError = false;
  bool _passwordError = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _buildNameField(),
          const SizedBox(height: 17.0),
          _buildMobileNumberField(),
          const SizedBox(height: 17.0),
          _buildPasswordField(),
          const SizedBox(height: 17.0),
          _buildConfirmPasswordField(),
          const SizedBox(height: 17.0),
          _buildUnitIdField(),
          const SizedBox(height: 17.0),
          _buildLastDayInUnitPicker(context),
          const SizedBox(height: 17.0),
          _buildPreferenceDropdown(),
          const SizedBox(height: 50.0),
          _buildSignUpButton(),
        ],
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        errorText: _rankError ? 'Name should not include rank' : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        if (value
            .toLowerCase()
            .contains(RegExp(r'\b(slt|lt|lt cdr|cdr|capt|cmde)\b'))) {
          setState(() {
            _rankError = true;
          });
          return 'Name should not include rank';
        }
        setState(() {
          _rankError = false;
        });
        return null;
      },
      onSaved: (value) => _name = value,
    );
  }

  Widget _buildMobileNumberField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Mobile Number',
        errorText:
            _mobileError ? 'Please enter a valid 10-digit mobile number' : null,
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your mobile number';
        }
        String cleaned = value.replaceAll(RegExp(r'\D'), '');
        if (cleaned.length != 10) {
          setState(() {
            _mobileError = true;
          });
          return 'Mobile number should have exactly 10 digits';
        }
        setState(() {
          _mobileError = false;
        });
        return null;
      },
      onSaved: (value) => _mobileNumber = value,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 8) {
          return 'Password should be at least 8 characters long';
        }
        return null;
      },
      onSaved: (value) => _password = value,
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please confirm your password';
        }
        if (value != _password) {
          return 'Passwords do not match';
        }
        return null;
      },
      onSaved: (value) => _confirmPassword = value,
    );
  }

  Widget _buildUnitIdField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Unit ID',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your unit ID';
        }
        return null;
      },
      onSaved: (value) => _unitId = value,
    );
  }

  Widget _buildLastDayInUnitPicker(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: _lastDayInUnit,
      decoration: InputDecoration(
        labelText: "Last day in Unit",
        suffixIcon: Icon(
          Icons.today,
          color: AppColors.orange200.withOpacity(0.8),
        ),
      ),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          setState(() {
            _selectedDate = pickedDate;
            String formattedDate = DateFormat('dd-MM-yy').format(pickedDate);
            _lastDayInUnit.text = formattedDate;
          });
        }
      },
    );
  }

  Widget _buildPreferenceDropdown() {
    return SizedBox(
        width: double.infinity,
        child: DropdownMenu(
          expandedInsets: EdgeInsets.zero,
          // width: double.infinity,
          label: const Text("Preference"),
          onSelected: (preference) {
            if (preference != null) {
              setState(() {
                _preference = preference;
              });
            }
          },
          textStyle: const TextStyle(
            fontSize: 13.0,
          ),
          menuStyle: const MenuStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white)),
          dropdownMenuEntries: const <DropdownMenuEntry<String>>[
            DropdownMenuEntry(
                value: "veg",
                label: "Vegetarian",
                leadingIcon: Icon(
                  Icons.ramen_dining,
                  color: Colors.green,
                )),
            DropdownMenuEntry(
                value: "nonveg",
                label: "Non-Vegetarian",
                leadingIcon: Icon(
                  Icons.set_meal,
                  color: Colors.red,
                )),
          ],
        ));
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 40.0,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            // Perform signup logic with saved data
            // Navigate to another screen or perform other actions
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const UserMenu()),
            ); // Navigate back to login page
          }
        },
        child: const Text(
          'Sign In',
          style: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
