import 'package:go_router/go_router.dart';
import 'package:upalerts/screens/authentication/login_screen.dart';
import 'package:upalerts/screens/authentication/register_screen.dart';
import 'package:upalerts/screens/boarding/boarding_screen.dart';
import 'package:upalerts/screens/dashboard/dashboard_screen.dart';
import 'package:upalerts/screens/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/on_boarding';
  static const String onRegisterRoute = '/register_screen';
  static const String onLoginRoute = '/login_screen';
  static const String onDashboard = '/dashboard';
}


final GoRouter router = GoRouter(
  //initialLocation: Routes.onDashboard,
  routes: [
    
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/on_boarding',
      builder: (context, state) => const BoardingScreen(),
    ),
    GoRoute(
        path: '/register_screen',
        builder: (context, state) => const RegisterScreen()),
        GoRoute(path: '/login_screen',
        builder: (context, state) => const LoginScreen(),),
        GoRoute(path: '/dashboard',
        builder: (context, state) => const DashBoardScreen(),)
  ],
);
