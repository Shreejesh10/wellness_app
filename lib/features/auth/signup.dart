import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/features/auth/login.dart';
import '../../core/route_config/route_names.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _rememberMe = false;
  bool _passwordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80.h),
                  Text(
                    "Start Your Wellness\nJourney Today.",
                    style:
                    TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 40.h),

                  /// Name Field
                  TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter Your Full Name",
                      prefixIcon: Icon(Icons.person),
                      contentPadding: EdgeInsets.symmetric(vertical: 17.h),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  /// Email Field
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.symmetric(vertical: 17.h),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  _changePasswordField(_passwordController, "Create Password"),

                  SizedBox(height: 15.h),

                  /// Confirm Password Field
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
                  SizedBox(height: 10.h),

                  /// Remember Me
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                        activeColor: Colors.white,
                      ),
                      Text("Remember Me", style: TextStyle(fontSize: 15.sp)),
                    ],
                  ),
                  SizedBox(height: 15.h),

                  /// Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: TextButton(
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {


                            // Navigate to login screen
                            Navigator.pushNamed(context, RoutesName.loginScreen);
                          }
                        },
                        child: Text(
                          "Sign up",
                          style:
                          TextStyle(color: Colors.black, fontSize: 20.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 22.h),

                  /// Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 17.w,
                          endIndent: 10.w,
                        ),
                      ),
                      const Text('Or'),
                      Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 10.w,
                          endIndent: 17.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),

                  /// Google Login
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Google login logic
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.g_translate, color: Colors.black),
                            SizedBox(width: 5.w),
                            Text(
                              'Google',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 17.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  /// Already have account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Login.",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.sp,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
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
