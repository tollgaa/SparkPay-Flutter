import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../core/theme_provider.dart';
import '../core/user_provider.dart';
import '../widgets/bottom_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final local = AppLocalizations.of(context)!;

    TextEditingController messageController = TextEditingController();

    void showSupportDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
            title: Text(
              local.contactUs,
              style: TextStyle(
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            insetPadding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            content: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.85,
                minWidth: 280,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${local.emailAddress}:',
                      style: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkMode ? Colors.grey[900] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'tolga@istinye.edu.tr',
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '${local.sendMessage}:',
                      style: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: messageController,
                      maxLines: 5,
                      style: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: '${local.sendMessage}...',
                        hintStyle: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white54 : Colors.black54,
                        ),
                        filled: true,
                        fillColor: themeProvider.isDarkMode ? Colors.grey[900] : Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (messageController.text.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(local.messageSent),
                        backgroundColor: Colors.green,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                    messageController.clear();
                  }
                },
                child: Text(
                  local.sendMessage,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          local.profile,
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
                userProvider.name,
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
                  color: themeProvider.isDarkMode ? Colors.grey[400] : Colors.grey,
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
                local.settings,
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              tileColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
              onTap: () {
                context.go('/settings');
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.help_sharp,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                local.support,
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              tileColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
              onTap: () {
                showSupportDialog();
              },
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                local.logout,
                style: TextStyle(
                  fontFamily: 'Oswald',
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
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