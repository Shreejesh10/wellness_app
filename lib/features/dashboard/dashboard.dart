import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/core/route_config/route_names.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Explore",
          style: TextStyle(fontSize: 35.sp, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.profileScreen);
              },
              child: CircleAvatar(
                radius: 22.r,
                backgroundImage: const AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _iconBox(CupertinoIcons.heart, "My favorites"),
                  _iconBox(CupertinoIcons.bell, "Remind Me"),
                ],
              ),
              SizedBox(height: 30.h),
              Text(
                "Today's Quotes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),
              _quoteCard(
                '"Your wellness is an investment,\nnot an expense."',
                'Shreejesh Pathak',
              ),
              SizedBox(height: 18.h),
              Text(
                "Quotes",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 18.h),
              _tile(CupertinoIcons.sun_min, "Feeling Blessed", onTap: () {
                Navigator.pushNamed(context, RoutesName.quotesScreen);
              }),
              SizedBox(height: 8.h,),
              _tile(Icons.woman, "Pride Month", onTap: (){
                Navigator.pushNamed(context, RoutesName.quotesScreen);
              }),
              SizedBox(height: 8.h,),
              _tile(CupertinoIcons.star, "Self Worth", onTap: (){
                Navigator.pushNamed(context, RoutesName.quotesScreen);
              }),
              SizedBox(height: 8.h,),
              _tile(CupertinoIcons.heart, "Love",onTap: (){
                Navigator.pushNamed(context, RoutesName.quotesScreen);
              }),
              SizedBox(height: 18.h),
              Text(
                "Health Tips",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 18.h),
              _tile(CupertinoIcons.sun_min, "Breathe to Reset"),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _iconBox(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20.r),
      ),
      height: 70.h,
      padding: EdgeInsets.symmetric(horizontal: 11.w),
      child: Row(
        children: [
          Icon(icon, size: 25.sp, color: Colors.white),
          SizedBox(width: 5.w),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
        ],
      ),
    );
  }

  Widget _quoteCard(String quote, String author) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // shrink-wrap content vertically
        children: [
          Text(
            quote,
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '- $author',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 14.sp,
            ),
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
