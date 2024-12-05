import 'package:flutter/material.dart';
import 'package:sparkpay/widgets/bottom_menu.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Örnek döviz verileri (statik)
    final List<Map<String, String>> currencies = [
      {'currency': 'USD', 'rate': '34.47'},
      {'currency': 'EUR', 'rate': '36.81'},
      {'currency': 'GBP', 'rate': '44.37'},
      {'currency': 'JPY', 'rate': '0.23'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Döviz Kurları (Son Güncellenme: 02:22  6/12/2024 )"),
      ),
      body: CurrencyList(currencies: currencies), // CurrencyList widget'ını çağırıyoruz
      bottomNavigationBar: const BottomMenu(), // Alt menüyü ekliyoruz
    );
  }
}

// Döviz verilerini listelemek için kullanılan widget
class CurrencyList extends StatelessWidget {
  final List<Map<String, String>> currencies;

  const CurrencyList({Key? key, required this.currencies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currencies.length,
      itemBuilder: (context, index) {
        final currency = currencies[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(currency['currency']!),
            subtitle: Text('Kur: ${currency['rate']} TL'),
            leading: const Icon(Icons.attach_money),
          ),
        );
      },
    );
  }
}
