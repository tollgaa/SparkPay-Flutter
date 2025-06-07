import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/theme_provider.dart';
import '../core/user_provider.dart';
import '../core/locale_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    final loc = AppLocalizations.of(context)!;

    TextEditingController nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loc.settings,
          style: const TextStyle(fontFamily: 'Playwrite India'),
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        iconTheme: IconThemeData(
          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            context.go('/profile');
          },
        ),
        actions: [
          IconButton(
            icon: Text(
              localeProvider.locale.languageCode == 'tr' ? 'EN' : 'TR',
              style: TextStyle(
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              final newLocale = localeProvider.locale.languageCode == 'tr'
                  ? const Locale('en')
                  : const Locale('tr');
              localeProvider.setLocale(newLocale);
            },
          ),
        ],
      ),
      backgroundColor: themeProvider.isDarkMode ? Colors.black : const Color(0xFFD0D0D0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              loc.updateName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              style: TextStyle(
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              decoration: InputDecoration(
                hintText: loc.enterName,
                hintStyle: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white54 : Colors.black54,
                ),
                filled: true,
                fillColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: themeProvider.isDarkMode ? Colors.grey[700] : Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              onPressed: () {
                String updatedName = nameController.text;
                userProvider.updateName(updatedName);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(loc.updateSuccess),
                    duration: const Duration(seconds: 2),
                  ),
                );
                context.go('/profile');
              },
              child: Text(
                loc.update,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Divider(color: themeProvider.isDarkMode ? Colors.white : Colors.black),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                themeProvider.isDarkMode ? loc.themeLight : loc.themeDark,
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme();
                },
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              title: Text(
                loc.emailAddress,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Text(
                'tolga@istinye.edu.tr',
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
              tileColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                loc.identityNumber,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Text(
                '12345678901',
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
              tileColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
            ),
            const SizedBox(height: 10),
            ListTile(
              title: Text(
                loc.address,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              subtitle: Text(
                'Şişli/İSTANBUL',
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white70 : Colors.black87,
                ),
              ),
              tileColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}