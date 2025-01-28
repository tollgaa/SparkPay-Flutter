import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../core/theme_provider.dart';
import '../widgets/bottom_menu.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SparkPay'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/profilepicture.jpeg',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Tolga',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.home),
              title: const Text('Ana Sayfa'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.settings),
              title: const Text('Ayarlar'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(CupertinoIcons.person_2),
              title: const Text('Bize Ulaşın'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(themeProvider.isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode),
              title: Text(themeProvider.isDarkMode
                  ? 'Gündüz Modu'
                  : 'Gece Modu'),
              onTap: () {
                themeProvider.toggleTheme();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                 "SparkPay'e Hoş Geldiniz!",
                  style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: themeProvider.isDarkMode ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: themeProvider.isDarkMode
                          ? Colors.white12
                          : Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hesap Bakiyeniz",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "₺ 5,000.00",
                      style: TextStyle(
                        fontFamily: 'Lexend Giga',
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(
                          icon: Icons.send,
                          label: "Para Gönder",
                        ),
                        _buildActionButton(
                          icon: Icons.request_page,
                          label: "Para İste",
                        ),
                        _buildActionButton(
                          icon: Icons.payment,
                          label: "Ödemeler",
                        ),
                        _buildActionButton(
                          icon: Icons.receipt,
                          label: "Faturalar",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                "Son Harcamalar",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  _buildExpenseCard('Netflix', '₺ 150.00', Colors.red, Icons.movie),
                  _buildExpenseCard('Spotify', '₺ 49.99', Colors.green, Icons.music_note),
                  _buildExpenseCard('Şok Beylerbeyi Şube', '₺ 1250.24', Colors.blue, Icons.store),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  Widget _buildExpenseCard(String title, String amount, Color color, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "Harcama Tutarı: $amount",
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildActionButton({required IconData icon, required String label}) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: const Color.fromARGB(255, 208, 208, 208),
          child: Icon(
            icon,
            size: 30,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
