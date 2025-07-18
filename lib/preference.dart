import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wellness_app/core/route_config/route_names.dart';

class UserPreferenceScreen extends StatefulWidget {
  const UserPreferenceScreen({super.key});

  @override
  State<UserPreferenceScreen> createState() => PreferenceScreen();
}

class PreferenceScreen extends State<UserPreferenceScreen> {
  final List<String> topics = [
    'Hard times',
    'Working Out',
    'Focus',
    'Mindfulness',
    'Discipline',
    'Growth',
    'Mental Strength',
    'Confidence',
    'Peace',
    'Hustle',
  ];
  final Set<String> selectedTopics = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferences", style: TextStyle(fontSize: 20.sp)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            _topic(),
            SizedBox(height: 30.h),
            _iconGrid(),
            SizedBox(height: 40.h),
            _saveButton(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _topic() {
    return Text(
      "Select All Topics That\nMotivate You",
      style: TextStyle(
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _iconGrid() {
    return Wrap(
      spacing: 16.w,
      runSpacing: 16.h,
      children: topics.map((topic) => _iconBox(topic)).toList(),
    );
  }

  Widget _iconBox(String label) {
    final isSelected = selectedTopics.contains(label);

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected ? selectedTopics.remove(label) : selectedTopics.add(label);
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 24.w,
        height: 70.h,
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[900],
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: Colors.white,
              size: 22.sp,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Text(
                label,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saveButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 14.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        onPressed: () {
          if (selectedTopics.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select at least one topic')),
            );
          } else {
            Navigator.pushNamed(context, RoutesName.dashboardScreen);
          }
        },
        child: Text(
          "Save Preferences",
          style: TextStyle(color: Colors.black, fontSize: 16.sp),
        ),
      ),
    );
  }
}
