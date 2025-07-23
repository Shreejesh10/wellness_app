import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/core/route_config/route_names.dart';
import 'package:wellness_app/features/auth/auth_service.dart';
import 'signup.dart';
import 'package:wellness_app/features/dashboard/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _rememberMe = false;
  bool _passwordVisibility = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: 50.h),
                SizedBox(
                  width: 380.w,
                  child: TextFormField(
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
                      hintText: 'Enter your Email',
                      prefixIcon: const Icon(Icons.email),
                      contentPadding: EdgeInsets.symmetric(vertical: 17.h),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                SizedBox(
                  width: 380.w,
                  child: TextFormField(
                    obscureText: !_passwordVisibility,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisibility
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisibility = !_passwordVisibility;
                          });
                        },
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 17.h),
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                         value: _rememberMe,
                          onChanged: (bool? newValue){
                           setState(() {
                             _rememberMe = newValue!;
                           });
                          },
                          activeColor: Colors.white,

                        ),
                        const Text("Remember Me"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle forgot password
                      },
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: 380.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: TextButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState!.validate()) {
                          final email = _emailController.text.trim();

                          if (email == 'admin@gmail.com'){
                            Navigator.of(context).pushNamed(RoutesName.adminDashboardScreen);
                          }else{
                            Navigator.of(context).pushNamed(RoutesName.dashboardScreen);
                          }

                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black, fontSize: 20.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22.h),
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
                SizedBox(
                  width: 380.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        UserCredential? user =
                        await AuthService().signInWithGoogle();
                        if (user != null) {
                          log("login success");
                          Navigator.of(
                            context,
                          ).pushNamed(RoutesName.preferenceScreen);
                        } else {
                          log("login failed");
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_translate, color: Colors.black, size: 24.sp),
                          SizedBox(width: 5.w),
                          Text(
                            'Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    SizedBox(width: 5.w),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Create new Account",
                          style: TextStyle(
                            fontSize: 18.sp,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
