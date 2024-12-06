import 'package:flutter/material.dart';
import 'package:sparkpay/widgets/bottom_menu.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arama Ekranı'),
      ),
      body: Column(
        children: [
          // Arama Çubuğumuz
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Arama yapın...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          // Diğer içerikler
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
