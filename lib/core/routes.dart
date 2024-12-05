import 'package:go_router/go_router.dart';
import 'package:sparkpay/screens/currency_screen.dart';  // CurrencyScreen doğru import edilmeli
import 'package:sparkpay/screens/profile_screen.dart';
import 'package:sparkpay/screens/search_screen.dart';
import '../screens/loading_screen.dart';
import '../screens/home_screen.dart';

// Router yapılandırması
final router = GoRouter(
  initialLocation: '/',  // Başlangıç rotası
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoadingScreen(),
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
      builder: (context, state) => const CurrencyScreen(), // CurrencyScreen olarak düzeltilmeli
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchScreen(),
    ),
  ],
);
