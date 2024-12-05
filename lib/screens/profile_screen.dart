import 'package:flutter/material.dart';
import 'package:sparkpay/widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profilim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profil Resmi ve Kullanıcı Adı
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/profilepicture.jpeg'), // Profil resmi
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: const Text(
                'Tolga', // Buraya dinamik bir kullanıcı adı ekleyebilirsiniz.
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: const Text(
                'tolga@istinye.edu.tr', // Buraya kullanıcı e-posta adresi ekleyebilirsiniz.
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 30),
             // Ayarlar Butonu
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                // Ayarlar sayfasına yönlendirme
              },
            ),

            const Divider(),

            // Profil Düzenleme Butonu
            ListTile(
              leading: const Icon(Icons.help_sharp),
              title: const Text('Teknik Destek'),
              onTap: () {
                // Profil düzenleme sayfasına yönlendirme
              },
            ),
            
           
            const Divider(),
            // Çıkış Yapma Butonu
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Çıkış Yap'),
              onTap: () {
                // Çıkış işlemi yapma
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
