import 'package:flutter/material.dart';
import '../dashboard/home_page.dart';
import 'register_1.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  void _goToHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MyHomePage(title: 'MaliBarakela'),
      ),
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const SizedBox(height: 80),
              Image.asset(
                'assets/images/logo_1.png',
                height: 60,
              ),
              const SizedBox(height: 24),
              const Text(
                'Content de te revoir',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Veuillez saisir vos coordonnées.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),
              
              // Email Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email / Numero',
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 14),
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Ce champ est obligatoire'
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              
              // Password Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Mot de passe',
                    labelStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.black38,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Ce champ est obligatoire'
                      : null,
                ),
              ),
              const SizedBox(height: 16),
              
              // Remember me & Forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: const BorderSide(color: Colors.black38),
                          activeColor: const Color(0xFF076633),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Souviens-toi de moi',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              
              // Login Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _goToHome();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF076633),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 3,
                    shadowColor: Colors.black26,
                  ),
                  child: const Text(
                    'Se connecter',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Continue as Guest Button
              TextButton(
                onPressed: _goToHome,
                child: const Text(
                  'Continuer Client',
                  style: TextStyle(
                    color: Color(0xFF076633),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              
              // Sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Vous n'avez pas de compte ? ",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 13,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Register1Page(),
                        ),
                      );
                    },
                    child: const Text(
                      "S'inscrire",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
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
      ),
    );
  }
}

