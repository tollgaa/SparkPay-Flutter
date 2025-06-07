import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:sparkpay/widgets/bottom_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/theme_provider.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  Map<String, double> exchangeRates = {};
  bool isLoading = true;
  String lastUpdated = "Yükleniyor...";
  Timer? timer;

  final String apiKey = "2330eeee0bfe14158ef0f34b";
  final String apiUrl = "https://v6.exchangerate-api.com/v6/";

  @override
  void initState() {
    super.initState();
    fetchExchangeRates();
    timer = Timer.periodic(const Duration(minutes: 5), (timer) {
      fetchExchangeRates();
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> fetchExchangeRates() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(Uri.parse('$apiUrl$apiKey/latest/TRY'));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          exchangeRates = Map<String, double>.from(data['conversion_rates']);
          isLoading = false;
          lastUpdated = DateTime.now().toString().substring(0, 19);
        });
      } else {
        throw Exception('API isteği başarısız: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        lastUpdated = "Veri alınamadı";
      });
      if (mounted) {
        final local = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(local.fetchError)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final local = AppLocalizations.of(context)!;

    final currencies = [
      {'currency': 'USD', 'icon': Icons.attach_money},
      {'currency': 'EUR', 'icon': Icons.euro_symbol},
      {'currency': 'GBP', 'icon': Icons.currency_pound},
      {'currency': 'JPY', 'icon': Icons.currency_yen},
      {'currency': 'AUD', 'icon': Icons.attach_money},
      {'currency': 'CAD', 'icon': Icons.attach_money},
    ];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: themeProvider.isDarkMode
                ? [Colors.grey[900]!, Colors.grey[800]!]
                : [Colors.grey[200]!, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 16, right: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      local.currencyRates,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: 'Playwrite India',
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        ),
                      )
                    : CurrencyList(
                        currencies: currencies,
                        exchangeRates: exchangeRates,
                        themeProvider: themeProvider,
                      ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }
}

class CurrencyList extends StatelessWidget {
  final List<Map<String, dynamic>> currencies;
  final Map<String, double> exchangeRates;
  final ThemeProvider themeProvider;

  const CurrencyList({
    Key? key,
    required this.currencies,
    required this.exchangeRates,
    required this.themeProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: currencies.length,
      itemBuilder: (context, index) {
        final currency = currencies[index];
        final rate = exchangeRates[currency['currency']] != null
            ? (1 / exchangeRates[currency['currency']]!).toStringAsFixed(2)
            : "N/A";

        return AnimatedCurrencyCard(
          currency: currency['currency'],
          rate: rate,
          icon: currency['icon'],
          index: index,
          themeProvider: themeProvider,
          rateLabel: local.rateLabel(rate),
        );
      },
    );
  }
}

class AnimatedCurrencyCard extends StatefulWidget {
  final String currency;
  final String rate;
  final String rateLabel;
  final IconData icon;
  final int index;
  final ThemeProvider themeProvider;

  const AnimatedCurrencyCard({
    required this.currency,
    required this.rate,
    required this.icon,
    required this.index,
    required this.themeProvider,
    required this.rateLabel,
  });

  @override
  _AnimatedCurrencyCardState createState() => _AnimatedCurrencyCardState();
}

class _AnimatedCurrencyCardState extends State<AnimatedCurrencyCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500 + (widget.index * 200)),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        color: widget.themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent.withOpacity(0.7),
                      Colors.blueAccent,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.currency,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        color: widget.themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.rateLabel,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        color: widget.themeProvider.isDarkMode ? Colors.grey[400] : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  color: widget.themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  final parentState = context.findAncestorStateOfType<_CurrencyScreenState>();
                  parentState?.fetchExchangeRates();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
