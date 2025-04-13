import 'package:go_router/go_router.dart';
import 'package:sparkpay/screens/currency_screen.dart';
import 'package:sparkpay/screens/profile_screen.dart';
import 'package:sparkpay/screens/search_screen.dart';
import 'package:sparkpay/screens/register_screen.dart'; 
import '../screens/login_screen.dart';
import '../screens/home_screen.dart';
import '../screens/settings_screen.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/currency',
      builder: (context, state) => const CurrencyScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
