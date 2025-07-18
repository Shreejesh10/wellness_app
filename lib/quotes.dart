import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> quotes = [
    {
      'quote': 'The only way to do great work is to love what you do.',
      'author': 'Steve Jobs'
    },
    {
      'quote': 'Success is not final, failure is not fatal: It is the courage to continue that counts.',
      'author': 'Winston Churchill'
    },
    {
      'quote': 'Believe you can and you\'re halfway there.',
      'author': 'Theodore Roosevelt'
    },
    {
      'quote': 'Don’t watch the clock; do what it does. Keep going.',
      'author': 'Sam Levenson'
    },
    {
      'quote': 'Everything you’ve ever wanted is on the other side of fear.',
      'author': 'George Addair'
    },
    {
      'quote': 'Hardships often prepare ordinary people for an extraordinary destiny.',
      'author': 'C.S. Lewis'
    },
    {
      'quote': 'You miss 100% of the shots you don’t take.',
      'author': 'Wayne Gretzky'
    },
    {
      'quote': 'Opportunities don’t happen. You create them.',
      'author': 'Chris Grosser'
    },
    {
      'quote': 'Success is not how high you have climbed, but how you make a positive difference to the world.',
      'author': 'Roy T. Bennett'
    },
    {
      'quote': 'It always seems impossible until it’s done.',
      'author': 'Nelson Mandela'
    },
    {
      'quote': 'Your time is limited, don’t waste it living someone else’s life.',
      'author': 'Steve Jobs'
    },
    {
      'quote': 'Great things never come from comfort zones.',
      'author': 'Unknown'
    },
    {
      'quote': 'Push yourself, because no one else is going to do it for you.',
      'author': 'Unknown'
    },
    {
      'quote': 'Dream it. Wish it. Do it.',
      'author': 'Unknown'
    },
    {
      'quote': 'Stay focused and never give up.',
      'author': 'Unknown'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: quotes.length,
          onPageChanged: (index) => setState(() => currentPage = index),
          itemBuilder: (context, index) {
            final quote = quotes[index];
            return Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back, color: Colors.white, size: 24.sp),
                      ),
                      Text(
                        'Motivation',
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          '${index + 1}/${quotes.length}',
                          style: TextStyle(color: Colors.white, fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),

                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '❝ ${quote['quote']} ❞',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          '- ${quote['author']}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  right: 16.w,
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[800],
                    radius: 24.r,
                    child: Icon(Icons.volume_up, color: Colors.white, size: 24.sp),
                  ),
                ),

                Positioned(
                  bottom: 40.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Icon(Icons.swipe, color: Colors.white, size: 60.sp),
                      Text(
                        'Swipe',
                        style: TextStyle(color: Colors.white, fontSize: 30.sp),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.favorite_border, color: Colors.white, size: 40.sp),
                          SizedBox(width: 30.w),
                          Icon(Icons.local_offer_outlined, color: Colors.white, size: 40.sp),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
