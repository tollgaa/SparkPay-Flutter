import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sparkpay/widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profilim',
          style: TextStyle(fontFamily: 'Montserrat'),
        ),
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
                  fontFamily: 'Lexend Giga',
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
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(
                'Ayarlar',
                style: TextStyle(fontFamily: 'Oswald'),
              ),
              onTap: () {
                // Ayarlar sayfası eklendiğinde buraya yönlendirme eklenebilir
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help_sharp),
              title: const Text(
                'Teknik Destek',
                style: TextStyle(fontFamily: 'Oswald'),
              ),
              onTap: () {
                // Teknik destek sayfası eklendiğinde buraya yönlendirme eklenebilir
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(
                'Çıkış Yap',
                style: TextStyle(fontFamily: 'Oswald'),
              ),
              onTap: () {
                context.go('/register');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
