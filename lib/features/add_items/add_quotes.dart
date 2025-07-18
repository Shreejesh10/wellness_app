import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common_widgets/common_widget.dart';

class AddQuotesScreen extends StatefulWidget {
  const AddQuotesScreen({super.key});

  @override
  State<AddQuotesScreen> createState() => _AddQuotesScreenState();
}

class _AddQuotesScreenState extends State<AddQuotesScreen> {
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _quoteController = TextEditingController();

  String selectedCategory = "Motivation";
  final List<String> categories = ["Quotes", "Motivation", "Life", "Success", "Friendship"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Quotes", style: TextStyle(fontSize: 22.h)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              topic("Select Category"),
              SizedBox(height: 15.h),
              _dropDown(),

              SizedBox(height: 30.h),
              topic("Author Name:"),
              SizedBox(height: 15.h),
              categoryName(_authorController, "Author Name"),

              SizedBox(height: 30.h),
              topic("Quote:"),
              SizedBox(height: 15.h),
              SizedBox(
                height: 205.h,
                child: quoteInputField(
                  "Write a quote",
                  maxLines: 6,
                  controller: _quoteController,
                ),
              ),

              SizedBox(height: 40.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _handleSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text("Save", style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,fontWeight: FontWeight.bold
                  )),
                ),
              )
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

  Widget quoteInputField(
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

  void _handleSubmit() {
    String author = _authorController.text.trim();
    String quote = _quoteController.text.trim();

    if (author.isEmpty || quote.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    // Proceed to save or handle submission
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Quote added successfully!")),
    );

    // Optionally reset the form
    _authorController.clear();
    _quoteController.clear();
    setState(() => selectedCategory = "Motivation");
  }
}
