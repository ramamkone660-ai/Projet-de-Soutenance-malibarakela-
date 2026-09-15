import 'package:flutter/material.dart';
import 'register_3.dart';

class Register2Page extends StatefulWidget {
  const Register2Page({super.key});

  @override
  State<Register2Page> createState() => _Register2PageState();
}

class _Register2PageState extends State<Register2Page> {
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
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/images_register_2.png',
                height: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 32),
              const Text(
                'Vos coordonnées 📬',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Comment pouvons-nous vous contacter ?',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Phone Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.phone_outlined, color: Colors.black38, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Numéro de téléphone',
                          labelStyle: TextStyle(color: Colors.black38, fontSize: 14),
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) => value == null || value.trim().isEmpty
                            ? 'Ce champ est obligatoire'
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Email Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.email_outlined, color: Colors.black38, size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black38, fontSize: 14),
                          border: InputBorder.none,
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        validator: (value) => value == null || value.trim().isEmpty
                            ? 'Ce champ est obligatoire'
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),

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
                        builder: (context) => const Register3Page(),
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
              const SizedBox(height: 48),

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
                      // Pop back to login
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushReplacementNamed(context, '/');
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

