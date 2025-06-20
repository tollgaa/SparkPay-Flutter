import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../core/theme_provider.dart';
import '../widgets/bottom_menu.dart';

class BalanceProvider with ChangeNotifier {
  double _balance = 50000.00;

  double get balance => _balance;

  void deductBalance(double amount) {
    if (_balance >= amount) {
      _balance -= amount;
      notifyListeners();
    } else {
      throw Exception('Yetersiz bakiye');
    }
  }

  void addBalance(double amount) {
    _balance += amount;
    notifyListeners();
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController amountControllerSend = TextEditingController();
  final TextEditingController nameControllerSend = TextEditingController();
  final TextEditingController phoneControllerSend = TextEditingController();

  final TextEditingController amountControllerRequest = TextEditingController();
  final TextEditingController nameControllerRequest = TextEditingController();
  final TextEditingController phoneControllerRequest = TextEditingController();

  @override
  void dispose() {
    amountControllerSend.dispose();
    nameControllerSend.dispose();
    phoneControllerSend.dispose();
    amountControllerRequest.dispose();
    nameControllerRequest.dispose();
    phoneControllerRequest.dispose();
    super.dispose();
  }

  void showMoneyDialog({
    required BuildContext context,
    required String title,
    required String actionText,
    required VoidCallback onAction,
    required TextEditingController nameController,
    required TextEditingController phoneController,
    required TextEditingController amountController,
  }) {
    bool isPersonSelected = false;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final local = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
              title: Text(
                title,
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
              insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              content: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.9,
                  minWidth: 280,
                  maxHeight: MediaQuery.of(context).size.height * 0.7,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        local.savedContacts,
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/images/rabiaa.jpg'),
                        ),
                        title: Text(
                          local.contactName,
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            if (isPersonSelected) {
                              isPersonSelected = false;
                              nameController.clear();
                              phoneController.clear();
                            } else {
                              isPersonSelected = true;
                              nameController.text = local.contactName;
                              phoneController.text = '+905551234567';
                            }
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${local.fullName}:',
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: nameController,
                        enabled: true,
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: local.enterFullName,
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
                      const SizedBox(height: 16),
                      Text(
                        '${local.phoneNumber}:',
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: phoneController,
                        enabled: true,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: local.enterPhoneNumber,
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
                      const SizedBox(height: 16),
                      Text(
                        '${local.amount} (${local.currencySymbol}):',
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: local.enterAmount,
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
                    if (nameController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty &&
                        amountController.text.isNotEmpty) {
                      onAction();
                    }
                  },
                  child: Text(
                    actionText,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showSendMoneyDialog() {
    final local = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    showMoneyDialog(
      context: context,
      title: local.sendMoney,
      actionText: local.send,
      nameController: nameControllerSend,
      phoneController: phoneControllerSend,
      amountController: amountControllerSend,
      onAction: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    local.recipient,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    local.recipientNameDisplay(nameControllerSend.text),
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    local.recipientPhoneDisplay(phoneControllerSend.text),
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    local.recipientAmountDisplay(local.currencySymbol, amountControllerSend.text),
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    local.confirm,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    local.no,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    try {
                      double amount = double.parse(amountControllerSend.text);
                      Provider.of<BalanceProvider>(context, listen: false).deductBalance(amount);
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(const Duration(seconds: 2), () {
                            Navigator.of(context).pop();
                          });
                          return AlertDialog(
                            backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 60,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  local.moneySent,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  local.receiptSent,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                      amountControllerSend.clear();
                      nameControllerSend.clear();
                      phoneControllerSend.clear();
                    } catch (e) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 60,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  e.toString().contains('Yetersiz')
                                      ? 'Yetersiz Bakiye'
                                      : 'Geçersiz miktar girdiniz',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: Text(local.close),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text(
                    local.yes,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void showRequestMoneyDialog() {
    final local = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    showMoneyDialog(
      context: context,
      title: local.requestMoney,
      actionText: local.request,
      nameController: nameControllerRequest,
      phoneController: phoneControllerRequest,
      amountController: amountControllerRequest,
      onAction: () {
        Navigator.of(context).pop();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 60,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    local.moneyRequested,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            );
          },
        );
        amountControllerRequest.clear();
        nameControllerRequest.clear();
        phoneControllerRequest.clear();
      },
    );
  }

  void showPaymentsDialog() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final local = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
          title: Text(
            local.payments,
            style: TextStyle(
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              minWidth: 280,
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    local.noOutstandingPayments,
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                local.close,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  void showBillsDialog() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final local = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
          title: Text(
            local.bills,
            style: TextStyle(
              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              minWidth: 280,
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    local.phoneBill,
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${local.billAmountVodafone} ${local.currencySymbol}',
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Divider(
                    thickness: 0.5,
                    color: themeProvider.isDarkMode ? Colors.grey[600] : Colors.grey[400],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    local.electricityBill,
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${local.billAmountCkEnergy} ${local.currencySymbol}',
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white70 : Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                local.close,
                style: const TextStyle(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(local.appName),
        iconTheme: IconThemeData(
          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: themeProvider.isDarkMode ? Colors.grey[900] : Colors.white,
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
                  Text(
                    'Tolga',
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                local.home,
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                context.go('/home');
              },
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                local.settings,
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {
                context.go('/settings');
              },
            ),
            ListTile(
              leading: Icon(
                themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                themeProvider.isDarkMode ? local.themeLight : local.themeDark,
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
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
                local.welcomeMessage('Tolga'),
                style: TextStyle(
                  fontFamily: 'Playwrite India',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: themeProvider.isDarkMode
                        ? [Colors.grey[900]!, Colors.grey[850]!]
                        : [Colors.white, Colors.grey[100]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: themeProvider.isDarkMode ? Colors.white12 : Colors.black12,
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      local.accountBalance,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${local.currencySymbol} ${Provider.of<BalanceProvider>(context).balance.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontFamily: 'Lexend Giga',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF4CAF50),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildActionButton(
                          icon: Icons.send,
                          label: local.sendMoney,
                          onTap: showSendMoneyDialog,
                        ),
                        _buildActionButton(
                          icon: Icons.request_page,
                          label: local.requestMoney,
                          onTap: showRequestMoneyDialog,
                        ),
                        _buildActionButton(
                          icon: Icons.payment,
                          label: local.payments,
                          onTap: showPaymentsDialog,
                        ),
                        _buildActionButton(
                          icon: Icons.receipt,
                          label: local.bills,
                          onTap: showBillsDialog,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(
                local.recentExpenses,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  _buildExpenseCard(local.expenseNetflix,
                    "${local.currencySymbol} 150.00", Colors.red, Icons.movie, themeProvider, 0),
                  _buildExpenseCard(local.expenseSpotify,
                    "${local.currencySymbol} 49.99", Colors.green, Icons.music_note, themeProvider, 1),
                  _buildExpenseCard(local.expenseSokBeylerbeyi,
                    "${local.currencySymbol} 1250.24", Colors.blue, Icons.store, themeProvider, 2),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  Widget _buildExpenseCard(String title, String amount, Color color, IconData icon,
      ThemeProvider themeProvider, int index) {
    return AnimatedExpenseCard(
      key: ValueKey(index),
      title: title,
      amount: amount,
      color: color,
      icon: icon,
      themeProvider: themeProvider,
      index: index,
    );
  }

  Widget _buildActionButton({required IconData icon, required String label, VoidCallback? onTap}) {
    return AnimatedActionButton(
      icon: icon,
      label: label,
      onTap: onTap,
    );
  }
}

class AnimatedActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const AnimatedActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  _AnimatedActionButtonState createState() => _AnimatedActionButtonState();
}

class _AnimatedActionButtonState extends State<AnimatedActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: themeProvider.isDarkMode
                      ? [Colors.grey[700]!, Colors.grey[900]!]
                      : [Colors.grey[200]!, Colors.grey[300]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: themeProvider.isDarkMode ? Colors.black54 : Colors.grey[400]!,
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Icon(
                widget.icon,
                size: 32,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedExpenseCard extends StatefulWidget {
  final String title;
  final String amount;
  final Color color;
  final IconData icon;
  final ThemeProvider themeProvider;
  final int index;

  const AnimatedExpenseCard({
    Key? key,
    required this.title,
    required this.amount,
    required this.color,
    required this.icon,
    required this.themeProvider,
    required this.index,
  }) : super(key: key);

  @override
  _AnimatedExpenseCardState createState() => _AnimatedExpenseCardState();
}

class _AnimatedExpenseCardState extends State<AnimatedExpenseCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
  }

  void _initializeAnimation() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 500 + (widget.index.clamp(0, 10) * 200)),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
    if (mounted) {
      _controller.forward();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentTheme = Provider.of<ThemeProvider>(context, listen: false);
    if (currentTheme != widget.themeProvider) {
      _controller.stop();
      _controller.dispose();
      _initializeAnimation();
    }
  }

  @override
  void didUpdateWidget(covariant AnimatedExpenseCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != oldWidget.index || widget.themeProvider.isDarkMode != oldWidget.themeProvider.isDarkMode) {
      _controller.stop();
      _controller.dispose();
      _initializeAnimation();
    }
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    if (themeProvider == null) return const SizedBox();
    return SlideTransition(
      position: _slideAnimation,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(15),
          color: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
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
                        widget.color.withOpacity(0.7),
                        widget.color,
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
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        local.expenseAmount,
                        style: TextStyle(
                          fontSize: 12,
                          color: themeProvider.isDarkMode ? Colors.grey[400] : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  widget.amount,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkMode ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }