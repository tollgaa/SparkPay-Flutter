import 'package:flutter/material.dart';
import 'core/theme_provider.dart';
import 'core/routes.dart';
import 'core/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
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
