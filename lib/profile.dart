import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_app/core/route_config/route_names.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile", style:
        TextStyle(fontSize: 25, color: Colors.grey[400] ),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileBox(),
              ],
            ),
            const SizedBox(height: 30,),
            const Text(
              "MAKE IT YOURS",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            _tile(CupertinoIcons.book, "Content Preferences",
            onTap: (){
              Navigator.pushNamed(
                  context,
                  RoutesName.preferenceScreen,);
            }
            ),
            const SizedBox(height: 30,),
            const Text(
              "ACCOUNT",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30,),
            _tile(CupertinoIcons.pen, "Theme"),
            _tile(Icons.password, "Forgot Password"),
            _tile(Icons.exit_to_app,
                "Logout",
              onTap: (){
              Navigator.pushNamed(
                  context,
                  RoutesName.loginScreen,);
              }

            ),

          ],
        ),
      ),
    );
  }
  // WIDGETS that can be reused
  Widget _profileBox(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      width: 380,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.png'),
            radius: 35,
          ),
          const SizedBox(width: 16,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const[
              Text("Shreejesh Pathak", style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),
              ),
              Text("shreejeshpathak@gmail.com",
                style: TextStyle(
                    fontSize: 15, color: Colors.grey),
              ),

            ],
          ),
        ],
      )
    );

  }
  Widget _tile(IconData icon, String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: Colors.white),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Icon(Icons.chevron_right, size: 30, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
