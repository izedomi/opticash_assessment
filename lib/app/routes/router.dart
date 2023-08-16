import 'package:flutter/material.dart';
import 'package:opticash/app/routes/routes.dart';
import 'package:opticash/ui/screens/auth/lock_screen.dart';
import 'package:opticash/ui/screens/auth/signup_screen.dart';
import 'package:opticash/ui/screens/home_screen.dart';
import 'package:opticash/ui/screens/welcome/intro_screen.dart';
import '../../ui/screens/auth/signin_screen.dart';
import '../../ui/screens/welcome/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //var args = settings.arguments;
    switch (settings.name) {
      //welcome routes
      case WelcomeRoute.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case WelcomeRoute.intro:
        return MaterialPageRoute(builder: (_) => const IntroScreen());

      //AuthOnboarding routes
      case AuthOnboardingRoute.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AuthOnboardingRoute.sigin:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      case AuthOnboardingRoute.lock:
        return MaterialPageRoute(builder: (_) => const LockScreen());

      //Home routes
      case HomeRoute.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return errorScreen('No route defined for ${settings.name}');
    }
  }

  static MaterialPageRoute errorScreen(String msg) {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body: Center(
                child: Text(msg),
              ),
            ));
  }
}
