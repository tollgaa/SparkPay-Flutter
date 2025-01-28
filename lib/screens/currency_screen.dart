import 'package:flutter/material.dart';
import 'package:sparkpay/widgets/bottom_menu.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> currencies = [
      {'currency': 'USD', 'rate': '34.47', 'icon': 'usd'},
      {'currency': 'EUR', 'rate': '36.81', 'icon': 'eur'},
      {'currency': 'GBP', 'rate': '44.37', 'icon': 'gbp'},
      {'currency': 'JPY', 'rate': '0.23', 'icon': 'jpy'},
      {'currency': 'AUD', 'rate': '21.85', 'icon': 'aud'},
      {'currency': 'CAD', 'rate': '26.45', 'icon': 'cad'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Döviz Kurları (Son Güncellenme: 02:22  6/12/2024 )",
          style: TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Playwrite India'),
        ),
      ),
      body: CurrencyList(currencies: currencies),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

class CurrencyList extends StatelessWidget {
  final List<Map<String, String>> currencies;

  const CurrencyList({Key? key, required this.currencies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: currencies.length,
      itemBuilder: (context, index) {
        final currency = currencies[index];
        Widget currencyIcon;

        switch (currency['icon']) {
          case 'usd':
            currencyIcon = const Icon(Icons.attach_money, size: 24);
            break;
          case 'eur':
            currencyIcon = const Icon(Icons.euro_symbol, size: 24);
            break;
          case 'gbp':
            currencyIcon = Text('£', style: TextStyle(fontSize: 24));
            break;
          case 'jpy':
            currencyIcon = const Icon(Icons.money, size: 24);
            break;
          case 'aud':
            currencyIcon = const Icon(Icons.attach_money, size: 24);
            break;
          case 'cad':
            currencyIcon = const Icon(Icons.attach_money, size: 24);
            break;
          default:
            currencyIcon = const Icon(Icons.monetization_on, size: 24);
        }

        return Card(
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            title: Text(
              currency['currency']!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
            subtitle: Text(
              'Kur: ${currency['rate']} TL',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Montserrat',
              ),
            ),
            leading: currencyIcon,
          ),
        );
      },
    );
  }
}
