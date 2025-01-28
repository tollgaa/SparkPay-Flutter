import 'package:flutter/material.dart';
import 'package:sparkpay/widgets/bottom_menu.dart';
import 'package:provider/provider.dart';
import '../core/theme_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Arama Ekranı',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Playwrite India',
          ),
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
        iconTheme: IconThemeData(
          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: themeProvider.isDarkMode ? Colors.black : Colors.white,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Arama yapın...',
                hintStyle: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: themeProvider.isDarkMode ? Colors.grey[800] : Colors.grey[200],
                prefixIcon: Icon(
                  Icons.search,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          
          Expanded(
            child: const Center(
              child: Text("Aradığınız içerik buraya gelecektir."),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}
