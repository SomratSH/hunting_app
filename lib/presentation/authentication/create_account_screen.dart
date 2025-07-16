import 'package:flutter/material.dart';
import 'package:hunting_app/common/custom_padding.dart';
import 'package:hunting_app/common/custom_text_field.dart' show CustomTextField;
import 'package:hunting_app/common/text_style_custom.dart';
import 'package:hunting_app/presentation/authentication/login_screen.dart';
import '../../common/custom_button.dart';
import '../../common/custom_dialog_term_cons.dart';
import '../../constant/app_colors.dart';
import 'phone_number_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePasswordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isAgree = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vPad20,
              Image.asset("assets/splash_text_two.png"),
              vPad20,
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  "Create Account",
                  style: customTextStyleAuth(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Divider(),
              vPad20,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                        isPassword: false,
                        label: "Enter your Name",
                        controller: _nameController,
                        hintText: "John Doe",
                        prefixIconSvgPath: 'assets/icon/user.svg',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your name";
                          }
                          return null;
                        },
                      ),
                      _buildTextField(
                        isPassword: false,
                        label: "Enter your Email",
                        controller: _emailController,
                        hintText: "Johndoe@example.com",
                        prefixIconSvgPath: 'assets/icon/message.svg',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          }
                          // Regex validation for email
                          if (!RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          ).hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      _buildTextField(
                        isPassword: true,
                        label: "Create Password",
                        controller: _passwordController,
                        hintText: "ex: gfe9345@#chDF",
                        prefixIconSvgPath: 'assets/icon/password.svg',
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please create a password";
                          }
                          return null;
                        },
                      ),
                      _buildTextField(
                        isPassword: true,
                        label: "Confirm Password",
                        controller: _retypePasswordController,
                        hintText: "Re-type your password",
                        prefixIconSvgPath: 'assets/icon/password.svg',
                        obscureText: true,
                        validator: (value) {
                          if (value != _passwordController.text) {
                            return "Passwords do not match";
                          }
                          return null;
                        },
                      ),
                      _buildAgreeToTerms(),
                      vPad20,
                      CustomButton(
                        buttonText: "Create Account",
                        onPressed: _createAccount,
                      ),
                      vPad10,
                      _buildAlreadyHaveAccount(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build text fields with validation
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required String prefixIconSvgPath,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: customTextStyleAuth(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xff97BECA),
            ),
          ),
          vPad5,
          CustomTextField(
            controller: controller,
            hintText: hintText,
            borderRadius: 10,
            prefixIconSvgPath: prefixIconSvgPath,
            keyboardType: keyboardType,
            isPassword: isPassword,
          ),
        ],
      ),
    );
  }

  // Checkbox and terms text
  Widget _buildAgreeToTerms() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          activeColor: textLightColor,
          value: _isAgree,
          checkColor: Colors.white,
          onChanged: (bool? value) {
            setState(() {
              _isAgree = value ?? false;
            });
          },
        ),
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "I agree to the ",
                  style: customTextStyleAuth(
                    fontSize: 14,
                    color: Color(0xff97BECA),
                  ),
                ),
                TextSpan(
                  text: "Terms & Condition ",
                  style: customTextStyleAuth(
                    fontSize: 14,
                    color: Color(0xff2C739E),
                  ),
                ),
                TextSpan(
                  text: "and ",
                  style: customTextStyleAuth(
                    fontSize: 14,
                    color: Color(0xff97BECA),
                  ),
                ),
                TextSpan(
                  text: "Privacy policy.",
                  style: customTextStyleAuth(
                    fontSize: 14,
                    color: Color(0xff2C739E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Navigate to Phone Number Screen
  void _createAccount() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_isAgree) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => PhoneNumberScreen()),
        );
      } else {
        // Show alert dialog if terms are not agreed upon
        _showTermsErrorDialog();
      }
    }
  }

  // Show dialog for missing agreement to terms
  void _showTermsErrorDialog() {

    showTermConditionDialog(context);
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: Text("Terms & Conditions"),
    //     content: Text("You must agree to the terms & conditions to proceed."),
    //     actions: [
    //       TextButton(
    //         onPressed: () => Navigator.pop(context),
    //         child: Text("OK"),
    //       ),
    //     ],
    //   ),
    // );
  }

  // Already have an account section
  Widget _buildAlreadyHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: customTextStyleAuth(
            fontSize: 14,
            color: Color(0xff97BECA),
            fontWeight: FontWeight.w400,
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          ),
          child: Text(
            "Log In",
            style: customTextStyleAuth(
              fontSize: 14,
              color: Color(0xff2765A1),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
