import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  final TextEditingController _categoryController = TextEditingController();
  String selected ="Quotes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Category",
          style: TextStyle(fontSize: 22.h),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              _topic("Category Name:"),
              SizedBox(height: 30.h),
              _categoryName(_categoryController),
              SizedBox(height: 35.h),
              _topic("Category Type:"),
              SizedBox(height: 28.h,),
              Row(
                children: [
                  _buildToggle("Quotes"),
                  SizedBox(width: 12.w),
                  _buildToggle("Health"),
                ],
              ),
              SizedBox( height: 35.h,),
              _topic("Choose image for category:"),
              SizedBox(height: 25.h,),
              _addImage()

            ],
          ),
        ),
      ),
    );
  }
  Widget _topic(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),
    );
  }

  Widget _categoryName(TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Enter category name",
          hintStyle: TextStyle(color: Colors.white54),
          border: InputBorder.none,
        ),
      ),
    );
  }
  Widget _buildToggle(String label) {
    bool isSelected = selected == label;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selected = label;
          });
        },
        borderRadius: BorderRadius.circular(16.r),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.grey[850] : Colors.transparent,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: Colors.white,
                size: 24.sp,
              ),
              SizedBox(width: 10.w),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _addImage({VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: DottedBorder(
        color: Colors.white54,
        strokeWidth: 1,
        dashPattern: [6, 3],
        borderType: BorderType.RRect,
        radius: Radius.circular(12.r),
        child: Container(
          width: double.infinity,
          height: 150.h,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, color: Colors.white, size: 30.sp),
              SizedBox(height: 8.h),
              Text(
                "Tap to choose image",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}


// Center
// (
// child: SizedBox(
// width: double.infinity,
// child: ElevatedButton(
// style: ElevatedButton.styleFrom(
// backgroundColor: Colors.white,
// padding: EdgeInsets.symmetric(vertical: 14.h),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20.r),
// ),
// ),
// onPressed: () {
// String name = _categoryController.text.trim();
// if (name.isNotEmpty) {
// // Handle saving logic here
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text("Category '$name' added!")),
// );
// } else {
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(content: Text("Please enter a category name.")),
// );
// }
// },
// child: Text(
// "Add Category",
// style: TextStyle(
// color: Colors.black,
// fontSize: 18.sp,
// fontWeight: FontWeight.bold,
// ),
// ),
// ),
// ),
// )
