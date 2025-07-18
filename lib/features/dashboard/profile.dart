import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          "Profile",
          style: TextStyle(fontSize: 25.sp, color: Colors.grey[400]),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileBox(),
              ],
            ),
            SizedBox(height: 30.h),
            Text(
              "MAKE IT YOURS",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            _tile(
              CupertinoIcons.book,
              "Content Preferences",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.preferenceScreen,
                );
              },
            ),
            SizedBox(height: 30.h),
            Text(
              "ACCOUNT",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),
            _tile(CupertinoIcons.pen, "Theme"),
            _tile(Icons.password, "Forgot Password"),
            _tile(
              Icons.exit_to_app,
              "Logout",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.loginScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // WIDGETS that can be reused
  Widget _profileBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20.r),
      ),
      width: 380.w,
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: const AssetImage('assets/images/profile.png'),
            radius: 35.r,
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Shreejesh Pathak",
                style: TextStyle(
                  fontSize: 23.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "shreejeshpathak@gmail.com",
                style: TextStyle(fontSize: 15.sp, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tile(IconData icon, String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        margin: EdgeInsets.only(bottom: 18.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16.r),
        ),
        width: double.infinity,
        height: 65.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 30.sp, color: Colors.white),
                SizedBox(width: 15.w),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            Icon(Icons.chevron_right, size: 30.sp, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
