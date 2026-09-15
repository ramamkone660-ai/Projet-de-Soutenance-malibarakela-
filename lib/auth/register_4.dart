import 'package:flutter/material.dart';
import 'register_5.dart';

class Register4Page extends StatefulWidget {
  const Register4Page({super.key});

  @override
  State<Register4Page> createState() => _Register4PageState();
}

class _Register4PageState extends State<Register4Page> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const SizedBox(height: 16),
              Image.asset(
                'assets/images/images_register_3.png',
                height: 140,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const Text(
                'Quel est votre savoir-faire ?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Entrez le nom de votre métier !!',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Métier Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Métier',
                    labelStyle: TextStyle(color: Colors.black38, fontSize: 14),
                    border: InputBorder.none,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Ce champ est obligatoire'
                      : null,
                ),
              ),

              const SizedBox(height: 80),

              // Next Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register5Page(),
                      ),
                    );
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
                    'Suivant',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Log in link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Deja un compte ? ",
                    style: TextStyle(color: Colors.black87, fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                    },
                    child: const Text(
                      "Se connecter",
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

