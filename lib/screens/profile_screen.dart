import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../core/theme_provider.dart';
import '../widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profilim',
          style: TextStyle(
            fontFamily: 'Playwrite India',
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      ),
      backgroundColor: themeProvider.isDarkMode ? Colors.black : const Color(0xFFD0D0D0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/profilepicture.jpeg'),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Tolga',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                'tolga@istinye.edu.tr',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                'Ayarlar',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: themeProvider.isDarkMode ? Colors.black : Colors.black,
                ),
              ),
              tileColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.help_sharp,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                'Teknik Destek',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: themeProvider.isDarkMode ? Colors.black : Colors.black,
                ),
              ),
              tileColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
              onTap: () {},
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                'Çıkış Yap',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: themeProvider.isDarkMode ? Colors.black : Colors.black,
                ),
              ),
              tileColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
              onTap: () {
                context.go('/login');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
