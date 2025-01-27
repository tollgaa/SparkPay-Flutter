import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profilim',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      ),
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
              child: const Text(
                'Tolga',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: const Text(
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
              title: const Text(
                'Ayarlar',
                style: TextStyle(fontFamily: 'Oswald', color: Colors.black),
              ),
              tileColor: Colors.white,
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.help_sharp,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: const Text(
                'Teknik Destek',
                style: TextStyle(fontFamily: 'Oswald', color: Colors.black),
              ),
              tileColor: Colors.white,
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: const Text(
                'Çıkış Yap',
                style: TextStyle(fontFamily: 'Oswald', color: Colors.black),
              ),
              tileColor: Colors.white,
              onTap: () {
              },
            ),
          ],
        ),
      ),
    );
  }
}
