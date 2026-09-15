import 'package:flutter/material.dart';
import '../dashboard/home_page.dart';
import 'login.dart';

class Register8Page extends StatelessWidget {
  const Register8Page({super.key});

  void _goToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(title: 'MaliBarakela'),
      ),
      (route) => false,
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 62),
              const Text(
                'Bienvenue sur MaliBarakela ! 🎉',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 38),
              Image.asset(
                'assets/images/images_register_8.png',
                height: 160,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const Text(
                'Votre compte est prêt. Il ne reste plus qu’à\ncommencer.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 68),
              SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () => _goToHome(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007A4B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    elevation: 3,
                    shadowColor: Colors.black26,
                  ),
                  child: const Text(
                    'Continuer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 72),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Deja un compte ? ',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 11,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _goToLogin(context),
                    child: const Text(
                      'Se connecter',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
