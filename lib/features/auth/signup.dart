import 'package:flutter/material.dart';
import 'package:wellness_app/features/auth/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _passwordVisibility = false;
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 80,),
                Center(
                  child: Text(
                    "Start Your Wellness\nJourney Today.",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 50,),
                SizedBox(
                  child:TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Your Full Name",
                      prefixIcon: Icon(Icons.person),
                        contentPadding: EdgeInsets.symmetric(vertical: 17),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                SizedBox(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your Email",
                      prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.symmetric(vertical: 17)
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                SizedBox(
                  child: TextFormField(
                    obscureText: !_passwordVisibility,
                    decoration: InputDecoration(
                      hintText: "Create new Password",
                      prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                _passwordVisibility = !_passwordVisibility;
                              });
                            },
                            icon:Icon(_passwordVisibility? Icons.visibility: Icons.visibility_off) ),
                        contentPadding: EdgeInsets.symmetric(vertical: 17)
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.black,

                            fillColor: WidgetStateColor.resolveWith((Set<WidgetState> states){
                              if (states.contains(WidgetState.selected)) {
                                return Colors.white; //bg when checked
                              }
                              return Colors.black; //bg when unchecked
                            }),
                            value: _rememberMe,
                            onChanged: (value){
                              setState(() {
                                _rememberMe = value!;
                              });
                            }
                        ),
                        Text("Remember Me",
                        style: TextStyle(fontSize: 15),),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 380,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 17, //spacing before line
                        endIndent: 10, //spacing after line
                      ),
                    ),
                    const Text('Or'),
                    const Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: 10,
                        endIndent: 17,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: 380,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: TextButton(
                      onPressed: () {
                        //logic for handling google login logic
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_translate, color: Colors.black),
                          SizedBox(width: 5),
                          Text(
                            'Google',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Row(
                      children: [
                        const Text("Already have an account?",
                        style: TextStyle(
                          fontSize: 15,
                        ),),
                      ],
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> const LoginScreen()),
                        );
                      },
                      child:
                      Text(
                        "Login.",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
