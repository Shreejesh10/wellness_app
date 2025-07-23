interface class AuthRouteName {
  static const String loginScreen = '/login-screen';
  static const String signupScreen = '/signup-screen';
}

class RoutesName {
  RoutesName._();

  static const String defaultScreen = '/';
  static const String dashboardScreen = '/dashboard-screen';
  static const String profileScreen = '/profile-screen';
  static const String loginScreen = '/login-screen';
  static const String preferenceScreen = '/preference_screen';
  static const String quotesScreen = '/quotes_screen';
  static const String adminDashboardScreen = '/admin_dashboard-screen';
  static const String addCategoryScreen = '/add-category-screen';
  static const String addQuotesScreen = '/add-quotes-screen';
  static const String addHealthTipsScreen = '/add-health-tips-screen';
  static const String changePasswordScreen = '/change-password-screen';
  static AuthRouteName get auth => AuthRouteName(); //getter for login, signup, forgot password and change password
}