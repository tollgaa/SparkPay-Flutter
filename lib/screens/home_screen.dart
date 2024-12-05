//Ana ekran burada yapılacak.

import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sparkpay/core/constants.dart';
import 'package:sparkpay/core/routes.dart';
import 'package:sparkpay/screens/currency_screen.dart';
import 'package:sparkpay/widgets/bottom_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ArkaPlanRengi, // Arka plan rengis
      // AppBar
      appBar: AppBar(
        title: const Text('SparkPay'),
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.bell),
            onPressed: () {},
          ),
        ],
      ),

      // Drawer (Yan Menü)
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header
            SizedBox(
              height: 200,
              //color: Colors.blue,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.person_circle,
                    size: 80,
                    color: Color.fromARGB(255, 16, 24, 48),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),




            // Menü öğeleri
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person_2),
              title: const Text('Bize Ulaşın'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),



// Ana içerik
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center, // Ortalamak için
    children: [
      SizedBox(
        width: 150,  // Boyutunu istediğiniz gibi ayarlayabilirsiniz
        height: 150, // Boyutunu istediğiniz gibi ayarlayabilirsiniz
        child: DotLottieLoader.fromAsset(
          "motions/homelogo1.lottie",
          frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
            if (dotlottie != null) {
              return Lottie.memory(dotlottie.animations.values.single);
            } else {
              return Container();
            }
          },
        ),
      ),
      const SizedBox(height: 20), // Animasyon ile yazı arasında boşluk
      const Text(
        "SparkPay'e Hoş Geldiniz!", // Burada istediğiniz yazıyı yazabilirsiniz
        style: TextStyle(
          fontSize: 18,  // Yazı boyutunu ayarlayabilirsiniz
          fontWeight: FontWeight.bold,  // Yazı kalınlığı
          color: Colors.black,  // Yazı rengini ayarlayabilirsiniz
        ),
      ),
    ],
  ),
),




 // Alt navigasyon çubuğu
      bottomNavigationBar: const BottomMenu()
    );
  }
}

