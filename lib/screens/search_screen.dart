import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sparkpay/widgets/bottom_menu.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../core/theme_provider.dart';
import '../screens/currency_screen.dart';
import '../screens/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> searchResults = [];

  late List<Map<String, String>> suggestions;

  void _onSearchChanged(String query) {
    setState(() {
      searchResults.clear();
      query = query.toLowerCase();
      if (query.isEmpty) return;

      for (var suggestion in suggestions) {
        if (suggestion['keyword']!.startsWith(query)) {
          searchResults.add({
            'title': suggestion['title']!,
            'route': suggestion['route']!,
          });
        }
      }
    });
  }

  void _navigateToScreen(String route) {
    Widget screen;
    switch (route) {
      case '/currency':
        screen = const CurrencyScreen();
        break;
      case '/profile':
        screen = const ProfileScreen();
        break;
      default:
        return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
    _searchController.clear();
    setState(() {
      searchResults.clear();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final local = AppLocalizations.of(context)!;

    suggestions = [
      {'keyword': local.keywordCurrency, 'title': local.titleCurrency, 'route': '/currency'},
      {'keyword': local.keywordProfile, 'title': local.titleProfile, 'route': '/profile'},
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
                padding: const EdgeInsets.only(left: 22, top: 16, right: 16, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      local.searchTitle,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: themeProvider.isDarkMode ? Colors.grey[800] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: themeProvider.isDarkMode ? Colors.black26 : Colors.grey[400]!,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: local.searchHint,
                      hintStyle: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54,
                      ),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(
                        Icons.search,
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final result = searchResults[index];
                    return AnimatedSearchCard(
                      title: result['title']!,
                      onTap: () => _navigateToScreen(result['route']!),
                      themeProvider: themeProvider,
                      index: index,
                    );
                  },
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

class AnimatedSearchCard extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final ThemeProvider themeProvider;
  final int index;

  const AnimatedSearchCard({
    required this.title,
    required this.onTap,
    required this.themeProvider,
    required this.index,
  });

  @override
  _AnimatedSearchCardState createState() => _AnimatedSearchCardState();
}

class _AnimatedSearchCardState extends State<AnimatedSearchCard> with SingleTickerProviderStateMixin {
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
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          title: Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              fontFamily: 'Montserrat',
              color: widget.themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          onTap: widget.onTap,
        ),
      ),
    );
  }
}
