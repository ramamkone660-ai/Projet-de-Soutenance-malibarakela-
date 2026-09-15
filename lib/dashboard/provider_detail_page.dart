import 'package:flutter/material.dart';

class ProviderDetailPage extends StatelessWidget {
  const ProviderDetailPage({
    super.key,
    required this.name,
    required this.location,
    required this.profession,
    required this.imagePath,
  });

  final String name;
  final String location;
  final String profession;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _buildHero(context)),
                SliverToBoxAdapter(child: _buildDetails()),
                SliverToBoxAdapter(child: _buildProjects()),
                const SliverToBoxAdapter(child: SizedBox(height: 110)),
              ],
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: _buildContactButton(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: const Color(0xFFE8EEEE),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          Positioned(
            top: 12,
            left: 14,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new, size: 20),
              color: Colors.black87,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            child: Container(
              height: 38,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetails() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 13, color: Colors.black45),
              const SizedBox(width: 3),
              Text(location, style: const TextStyle(fontSize: 10, color: Colors.black45)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(height: 1),
          ),
          const Text(
            'A propos de moi',
            style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 7),
          Text(
            '$profession professionnel avec plus de 5 ans\nd’expérience, je réalise vos travaux avec\nattention et précision. Je vous accompagne\npour tous vos besoins, avec sérieux et\nponctualité.',
            style: const TextStyle(fontSize: 10, color: Colors.black38, height: 1.35),
          ),
        ],
      ),
    );
  }

  Widget _buildProjects() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Mes réalisations',
                style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                child: const Text('voir tous', style: TextStyle(fontSize: 10, color: Colors.black38)),
              ),
            ],
          ),
          const SizedBox(height: 3),
          SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              separatorBuilder: (context, index) => const SizedBox(width: 7),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 88,
                    color: const Color(0xFFEAF0F5),
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton() {
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.chat_outlined, size: 27, color: Color(0xFF43C879)),
        label: const Text(
          'Contacter-Moi',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF007A4B),
          foregroundColor: Colors.white,
          elevation: 2,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
