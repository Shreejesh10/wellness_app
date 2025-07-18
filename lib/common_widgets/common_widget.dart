import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget topic(String text) {
  return Text(
    text,
    style: TextStyle(fontSize: 16.h, fontWeight: FontWeight.bold),
  );
}

Widget categoryName(TextEditingController controller, String text, {int maxLines = 1}) {
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
        hintText: text,
        hintStyle: TextStyle(color: Colors.white54),
        border: InputBorder.none,
      ),
    ),
  );
}

