import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            context.go('/login');
          },
        ),
        title: const Text(
          'Kayıt Ol',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xFF121212),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset(
                  'assets/images/logo.webp',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField("İsim", icon: Icons.person),
              const SizedBox(height: 16),
              _buildTextField("Soyisim", icon: Icons.person),
              const SizedBox(height: 16),
              _buildTextField("E-posta", icon: Icons.email),
              const SizedBox(height: 16),
              _buildTextField("Şifre", icon: Icons.key),
              const SizedBox(height: 16),
              _buildTextField("Şifre Tekrar", icon: Icons.key),
              const SizedBox(height: 16),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Kayıt Başarılı!"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Future.delayed(const Duration(seconds: 2), () {
                      context.go("/login");
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    "Kayıt Ol",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {required IconData icon}) {
    return SizedBox(
      width: 300,
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
