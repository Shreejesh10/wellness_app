import 'package:flutter/material.dart';
import 'package:wellness_app/core/route_config/route_names.dart';
import 'package:wellness_app/features/add_items/add_category.dart';
import 'package:wellness_app/features/add_items/add_healthtips.dart';
import 'package:wellness_app/features/add_items/add_quotes.dart';
import 'package:wellness_app/features/auth/change_password.dart';
import 'package:wellness_app/features/dashboard/adminDashboard.dart';
import 'package:wellness_app/preference.dart';
import 'package:wellness_app/features/dashboard/profile.dart';
import 'package:wellness_app/quotes.dart';
import '../../features/auth/login.dart';
import '../../features/auth/signup.dart';
import '../../features/dashboard/dashboard.dart';

class RouteConfig {
  RouteConfig._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? screenName = settings.name;
    final dynamic args = settings.arguments;

    switch (screenName) {
      case RoutesName.defaultScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case RoutesName.dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case AuthRouteName.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AuthRouteName.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case RoutesName.preferenceScreen:
        return MaterialPageRoute(
            builder: (_) => UserPreferenceScreen()
        );
      case RoutesName.profileScreen:
        return MaterialPageRoute(
            builder: (_) => const UserProfileScreen()
        );
      case RoutesName.quotesScreen:
        return MaterialPageRoute(
            builder: (_) => QuotesScreen()
        );
      case RoutesName.adminDashboardScreen:
        return MaterialPageRoute(
            builder:(_) => AdminDashboard()
        );
      case RoutesName.addCategoryScreen:
        return MaterialPageRoute(
            builder:(_) => AddCategory()
        );
      case RoutesName.addQuotesScreen:
        return MaterialPageRoute(
            builder:(_) => AddQuotesScreen()
        );
      case RoutesName.addHealthTipsScreen:
        return MaterialPageRoute(
            builder:(_) => AddHealthTips()
        );
      case RoutesName.changePasswordScreen:
        return MaterialPageRoute(
            builder:(_) => ChangePasswordScreen()
        );

        default:
          return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: Text('No route defined')),
      ),
    );
  }
}