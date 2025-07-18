import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:wellness_app/core/route_config/route_names.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Admin Dashboard",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 15.h,),
                _totalUser(),
                SizedBox(height: 35.h,),
                _addNew(
                  count: "100",
                  text: "Total Category",
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.addCategoryScreen,
                    );
                  },
                ),
                SizedBox(height: 20.h,),
                _addNew(
                  count: "200",
                  text: "Total Quotes",
                  onTap: () {

                    Navigator.pushNamed(context, RoutesName.addQuotesScreen);
                  },
                ),
                SizedBox(height: 20.h,),
                _addNew(
                  count: "50",
                  text: "Total Health Tips",
                  onTap: () {
                    //For Future
                  },
                ),
                SizedBox(height: 50.h),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.loginScreen,
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 50.h,
                        width: 180.w,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.h),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.exit_to_app, size: 25.h, color: Colors
                                .black),
                            SizedBox(width: 10.w),
                            Text(
                              "Log Out",
                              style: TextStyle(
                                  fontSize: 22.h, color: Colors.black),
                            ),
                          ],
                        ),
                      )

                    ],

                  ),
                ),
              ],
            ),
          )
      ),
    );
  }

  Widget _totalUser() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.supervised_user_circle_outlined, size: 80.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Total User",
                style: TextStyle(fontSize: 20.w,
                    color: Colors.grey),),
              SizedBox(height: 8.w,),
              Text("148900",
                style: TextStyle(
                    fontSize: 25.w,
                    fontWeight: FontWeight.bold
                ),)
            ],
          )

        ],
      ),
    );
  }

  Widget _addNew(
      {required String count, required String text, VoidCallback? onTap}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h,),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                count,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(30.r),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[800],
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 20.sp),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Add New",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


