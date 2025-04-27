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

    TextEditingController amountControllerSend = TextEditingController();
    TextEditingController nameControllerSend = TextEditingController();
    TextEditingController phoneControllerSend = TextEditingController();

    TextEditingController amountControllerRequest = TextEditingController();
    TextEditingController nameControllerRequest = TextEditingController();
    TextEditingController phoneControllerRequest = TextEditingController();

    void showSendMoneyDialog() {
      bool isPersonSelected = false;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
                title: Text(
                  'Para Gönder',
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
                          'Kayıtlı Kişiler',
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/images/rabiaa.jpg'),
                            child: const AssetImage('assets/images/rabiaa.jpg') == null
                                ? Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          title: Text(
                            'Rabia Dündar',
                            style: TextStyle(
                              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              if (isPersonSelected) {
                                isPersonSelected = false;
                                nameControllerSend.clear();
                                phoneControllerSend.clear();
                              } else {
                                isPersonSelected = true;
                                nameControllerSend.text = 'Rabia Dündar';
                                phoneControllerSend.text = '+905551234567';
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'İsim Soyisim:',
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: nameControllerSend,
                          enabled: true,
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'İsim soyisim girin',
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
                          'Telefon Numarası:',
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: phoneControllerSend,
                          enabled: true,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Telefon numarası girin',
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
                          'Tutar (₺):',
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: amountControllerSend,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Tutar girin',
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
                      if (nameControllerSend.text.isNotEmpty &&
                          phoneControllerSend.text.isNotEmpty &&
                          amountControllerSend.text.isNotEmpty) {
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
                                    'Paranın Gönderileceği Kişi:',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'İsim Soyisim: ${nameControllerSend.text}',
                                    style: TextStyle(
                                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Telefon: ${phoneControllerSend.text}',
                                    style: TextStyle(
                                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Tutar: ₺${amountControllerSend.text}',
                                    style: TextStyle(
                                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Onaylıyor musunuz?',
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
                                  child: const Text(
                                    'Hayır',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
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
                                                'Para Gönderildi!',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                                                ),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                'Dekont eposta adresinize gönderilmiştir!',
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
                                  },
                                  child: const Text(
                                    'Evet',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      'Gönder',
                      style: TextStyle(color: Colors.blue),
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
      bool isPersonSelected = false;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
                title: Text(
                  'Para İste',
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
                          'Kayıtlı Kişiler',
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage('assets/images/rabiaa.jpg'),
                            child: const AssetImage('assets/images/rabiaa.jpg') == null
                                ? Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                          title: Text(
                            'Rabia Dündar',
                            style: TextStyle(
                              color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              if (isPersonSelected) {
                                isPersonSelected = false;
                                nameControllerRequest.clear();
                                phoneControllerRequest.clear();
                              } else {
                                isPersonSelected = true;
                                nameControllerRequest.text = 'Rabia Dündar';
                                phoneControllerRequest.text = '+905551234567';
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'İsim Soyisim:',
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: nameControllerRequest,
                          enabled: true,
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'İsim soyisim girin',
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
                          'Telefon Numarası:',
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: phoneControllerRequest,
                          enabled: true,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Telefon numarası girin',
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
                          'Tutar (₺):',
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: amountControllerRequest,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Tutar girin',
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
                      if (nameControllerRequest.text.isNotEmpty &&
                          phoneControllerRequest.text.isNotEmpty &&
                          amountControllerRequest.text.isNotEmpty) {
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
                                    'Para Başarıyla İstendi!',
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
                      }
                    },
                    child: const Text(
                      'İste',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    }

    void showPaymentsDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
            title: Text(
              'Ödemeler',
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
                      'Güncel borcunuz bulunmamakta!',
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
                child: const Text(
                  'Kapat',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          );
        },
      );
    }

    void showBillsDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: themeProvider.isDarkMode ? Colors.grey[850] : Colors.white,
            title: Text(
              'Faturalar',
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
                      'VODAFONE GSM',
                      style: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '325.5 TL',
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
                      'CK ENERJİ BOĞAZİÇİ ELEKTRİK',
                      style: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '340.2 TL',
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
                child: const Text(
                  'Kapat',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('SparkPay'),
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
                'Ana Sayfa',
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                'Ayarlar',
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person_2,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                'Bize Ulaşın',
                style: TextStyle(
                  color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
              title: Text(
                themeProvider.isDarkMode ? 'Gündüz Modu' : 'Gece Modu',
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
                "SparkPay'e Hoş Geldin Tolga!",
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
                      blurRadius: 8, // Daha yumuşak gölge
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hesap Bakiyeniz",
                      style: TextStyle(
                        fontSize: 20, // Daha büyük font
                        fontWeight: FontWeight.w600, // Modern bir ağırlık
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "₺ 5,000.00",
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
                          label: "Para Gönder",
                          onTap: () {
                            showSendMoneyDialog();
                          },
                        ),
                        _buildActionButton(
                          icon: Icons.request_page,
                          label: "Para İste",
                          onTap: () {
                            showRequestMoneyDialog();
                          },
                        ),
                        _buildActionButton(
                          icon: Icons.payment,
                          label: "Ödemeler",
                          onTap: () {
                            showPaymentsDialog();
                          },
                        ),
                        _buildActionButton(
                          icon: Icons.receipt,
                          label: "Faturalar",
                          onTap: () {
                            showBillsDialog();
                          },
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
                  _buildExpenseCard('Netflix', '₺ 150.00', Colors.red, Icons.movie, themeProvider, 0),
                  _buildExpenseCard('Spotify', '₺ 49.99', Colors.green, Icons.music_note, themeProvider, 1),
                  _buildExpenseCard('Şok Beylerbeyi Şube', '₺ 1250.24', Colors.blue, Icons.store, themeProvider, 2),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomMenu(),
    );
  }

  Widget _buildExpenseCard(String title, String amount, Color color, IconData icon, ThemeProvider themeProvider, int index) {
    return AnimatedExpenseCard(
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

// Animasyonlu Buton Widget'ı
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

class _AnimatedActionButtonState extends State<AnimatedActionButton> with SingleTickerProviderStateMixin {
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
      onTapDown: (_) {
        _controller.forward();
      },
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap?.call();
      },
      onTapCancel: () {
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Column(
          children: [
            Container(
              width: 60, // Daha büyük buton
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
                size: 32, // Daha büyük simge
                color: themeProvider.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600, // Modern bir font ağırlığı
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
    required this.title,
    required this.amount,
    required this.color,
    required this.icon,
    required this.themeProvider,
    required this.index,
  });

  @override
  _AnimatedExpenseCardState createState() => _AnimatedExpenseCardState();
}

class _AnimatedExpenseCardState extends State<AnimatedExpenseCard> with SingleTickerProviderStateMixin {
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(15),
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
                          color: widget.themeProvider.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Harcama Tutarı',
                        style: TextStyle(
                          fontSize: 12,
                          color: widget.themeProvider.isDarkMode ? Colors.grey[400] : Colors.black54,
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
                    color: widget.themeProvider.isDarkMode ? Colors.white : Colors.black87,
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