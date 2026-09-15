import 'package:flutter/material.dart';
import 'register_7.dart';

class Register6Page extends StatefulWidget {
  const Register6Page({super.key});

  @override
  State<Register6Page> createState() => _Register6PageState();
}

class _Register6PageState extends State<Register6Page> {
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
                'assets/images/images_register_6.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Où êtes-vous ? ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text('📍', style: TextStyle(fontSize: 22)),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Cela nous aide à vous proposer\na des Client proches de vous.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Localisation Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Localisation',
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
                        builder: (context) => const Register7Page(),
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

