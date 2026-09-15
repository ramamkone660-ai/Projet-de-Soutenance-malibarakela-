import 'package:flutter/material.dart';
import 'register_4.dart';
import 'register_5.dart';

class Register3Page extends StatefulWidget {
  const Register3Page({super.key});

  @override
  State<Register3Page> createState() => _Register3PageState();
}

class _Register3PageState extends State<Register3Page> {
  String? _selectedMetier;

  final List<Map<String, String>> _metiers = [
    {'label': 'Plombier', 'image': 'assets/images/images_plombier.png'},
    {'label': 'Electricien', 'image': 'assets/images/images_electricien.png'},
    {'label': 'Peintre', 'image': 'assets/images/images_peintre.png'},
    {'label': 'Informatique', 'image': 'assets/images/images_infor.png'},
    {'label': 'Menuisier', 'image': 'assets/images/images_menuisier.png'},
    {'label': 'Maçon', 'image': 'assets/images/images_maçon.png'},
  ];

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
                'Sélectionnez le métier qui vous représente\nle mieux.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),

              // Grid of professions
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1,
                ),
                itemCount: _metiers.length,
                itemBuilder: (context, index) {
                  final metier = _metiers[index];
                  final isSelected = _selectedMetier == metier['label'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedMetier = metier['label'];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF076633).withOpacity(0.1)
                            : Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF076633)
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            metier['image']!,
                            height: 60,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            metier['label']!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? const Color(0xFF076633)
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 16),
              // "Autres" link
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Register4Page(),
                    ),
                  );
                },
                child: Text(
                  'Autres',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    color: _selectedMetier == 'Autres'
                        ? const Color(0xFF076633)
                        : Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 32),
              // Next Button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _selectedMetier != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Register5Page(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF076633),
                    disabledBackgroundColor: Colors.grey[300],
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
    );
  }
}

