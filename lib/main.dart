import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme_provider.dart';
import 'core/user_provider.dart'; 
import 'core/routes.dart';
import 'core/themes.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: 'SparkPay',
      theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
