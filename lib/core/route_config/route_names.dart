interface class AuthRouteName {
  static const String loginScreen = '/login-screen';
  static const String signupScreen = '/signup-screen';
}

class RoutesName {
  RoutesName._();

  static const String defaultScreen = '/';
  static const String dashboardScreen = '/dashboard-screen';
  static AuthRouteName get auth => AuthRouteName(); //getter for login, signup, forgot password and change password
}