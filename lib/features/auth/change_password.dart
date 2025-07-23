import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common_widgets/common_widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  final _currentPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              topic("Current Password:"),
              _passwordField(_currentPasswordController, "Current Password"),

              SizedBox(height: 30.h),
              topic("New Password:"),
              _changePasswordField(_passwordController, "Create Password"),

              SizedBox(height: 15.h),
              topic("Confirm New Password:"),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password.';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  prefixIcon: Icon(Icons.done),
                  contentPadding: EdgeInsets.symmetric(vertical: 17.h),
                ),
              ),

              SizedBox(height: 30.h),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password changed successfully")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    'Change Password',
                    style: TextStyle(fontSize: 16.sp,
                    color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _passwordField(TextEditingController controller, String hintText) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Current password is required.';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.lock_outline),
        contentPadding: EdgeInsets.symmetric(vertical: 17.h),
      ),
    );
  }

  Widget _changePasswordField(TextEditingController controller, String hintText) {
    return StatefulBuilder(
      builder: (context, setState) {
        return TextFormField(
          controller: controller,
          obscureText: !_passwordVisible,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Password is required.';
            } else if (value.length < 8) {
              return 'Password must be at least 8 characters.';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17.h),
          ),
        );
      },
    );
  }
}
