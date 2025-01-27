import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../core/theme_provider.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              context.go("/home");
            },
            icon: Icon(
              CupertinoIcons.home,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black, 
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/search");
            },
            icon: Icon(
              CupertinoIcons.search,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black, 
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/currency");
            },
            icon: Icon(
              CupertinoIcons.money_dollar_circle,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/profile");
            },
            icon: Icon(
              CupertinoIcons.person,
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
