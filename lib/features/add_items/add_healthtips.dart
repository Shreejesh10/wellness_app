import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddHealthTips extends StatefulWidget {
  const AddHealthTips({super.key});

  @override
  State<AddHealthTips> createState() => _AddHealthTipsState();
}

class _AddHealthTipsState extends State<AddHealthTips> {
  final TextEditingController _healthTipsController = TextEditingController();

  String selectedCategory = "Health";
  final List<String> categories = ["Health", "Cardio","Mental Health"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Health Tips',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                "Select Category:",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 18.h),
              _dropDown(),
              SizedBox(height: 28.h),
              Text(
                "Health Tips:",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 18.h),
              SizedBox(
                height: 205.h,
                child: _healthStringField(
                  "Write a health tip",
                  maxLines: 6,
                  controller: _healthTipsController,
                ),
              ),
              SizedBox(height: 28.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final tips = _healthTipsController.text.trim();
                    if (tips.isNotEmpty) {
                      print("Saved: $tips under category $selectedCategory");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Health tip saved!")),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please write a health tip.")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[900],
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dropDown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: DropdownButtonFormField<String>(
        dropdownColor: Colors.grey[900],
        value: selectedCategory,
        style: TextStyle(color: Colors.white, fontSize: 16.sp),
        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
        decoration: const InputDecoration(border: InputBorder.none),
        onChanged: (value) => setState(() => selectedCategory = value!),
        items: categories.map((String category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList(),
      ),
    );
  }

  Widget _healthStringField(
      String hintText, {
        required TextEditingController controller,
        int maxLines = 1,
      }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
