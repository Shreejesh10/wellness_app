import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/route_config/route_config.dart';
import 'core/route_config/route_names.dart';
import 'features/auth/login.dart';

void main() {
  runApp(const WellnessApp());
}

class WellnessApp extends StatelessWidget {
  const WellnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // optional, adjust as per your design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Wellness App',
          theme: ThemeData(
            fontFamily: 'Poppins',
            scaffoldBackgroundColor: Colors.black,
            colorScheme: const ColorScheme.dark(
              secondary: Color(0xFF262626),
            ),
            iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.white),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
            ),
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.black,
              elevation: 3,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              fillColor: Color(0xFF1E1E1E),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              hintStyle: TextStyle(color: Colors.grey),
            ),
            timePickerTheme: const TimePickerThemeData(
              backgroundColor: Color(0xFF1E1E1E),
              hourMinuteTextColor: Color(0xFF1E1E1E),
              hourMinuteColor: Colors.grey,
              dayPeriodTextColor: Colors.white70,
              dialBackgroundColor: Colors.black,
              dialHandColor: Colors.white,
              dialTextColor: Colors.white,
              entryModeIconColor: Colors.white,
              helpTextStyle: TextStyle(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24)),
              ),
            ),
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
            ),
            hoverColor: Colors.transparent,
          ),
          initialRoute: AuthRouteName.loginScreen,
          onGenerateRoute: RouteConfig.generateRoute,
          // fallback home route if initialRoute fails
          home: const LoginScreen(),
        );
      },
    );
  }
}
