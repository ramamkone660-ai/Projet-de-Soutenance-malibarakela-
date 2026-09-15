import 'package:flutter/material.dart';
import 'provider_detail_page.dart';
import 'search_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 0;
  final _searchController = TextEditingController();

  final _categories = const [
    ('Plombier', 'assets/images/images_plombier.png'),
    ('Electricien', 'assets/images/images_electricien.png'),
    ('Peintre', 'assets/images/images_peintre.png'),
    ('Informatique', 'assets/images/images_infor.png'),
    ('Menuisier', 'assets/images/images_menuisier.png'),
    ('Maçon', 'assets/images/images_maçon.png'),
  ];

  final _providers = const [
    ('Amadou Diawara', 'Plombier', 'assets/images/images_plombier.png'),
    ('Oumar Diallo', 'Electricien', 'assets/images/images_electricien.png'),
    ('Awa Doumbia', 'Peintre', 'assets/images/images_peintre.png'),
    ('Koffi Kalamoj', 'Informatique', 'assets/images/images_infor.png'),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _selectedTab == 0 ? _buildHome() : _selectedTab == 1
            ? const SearchPage()
            : _buildTabPlaceholder(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHome() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          sliver: SliverToBoxAdapter(child: _buildHeader()),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          sliver: SliverToBoxAdapter(child: _buildPartnerBanner()),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
          sliver: SliverToBoxAdapter(child: _buildSearchField()),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 14, 18, 0),
          sliver: SliverToBoxAdapter(child: _buildCategories()),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 22, 18, 10),
          sliver: SliverToBoxAdapter(child: _buildSectionTitle()),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildProviderCard(_providers[index]),
              childCount: _providers.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 14,
              childAspectRatio: .78,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Image.asset('assets/images/logo_1.png', height: 42),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded, size: 25),
          color: const Color(0xFF202124),
        ),
        const CircleAvatar(
          radius: 18,
          backgroundColor: Color(0xFFE5F3EC),
          child: Icon(Icons.person_outline, color: Color(0xFF007A4B)),
        ),
      ],
    );
  }

  Widget _buildPartnerBanner() {
    return Container(
      height: 126,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFB5C6E7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -4,
            bottom: -30,
            child: Image.asset(
              'assets/images/image 1635.png',
              height: 178,
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 18, 0, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Devenir partenaire',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                const SizedBox(
                  width: 130,
                  child: Text(
                    'Profitez de notre large réseau\nBénéficiez d’un contact rapide\nProposez vos services',
                    style: TextStyle(color: Colors.white, fontSize: 8, height: 1.35),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF007A4B),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(62, 24),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    textStyle: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text('Commencer'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: 'Rechercher un service',
        hintStyle: const TextStyle(fontSize: 12, color: Colors.black45),
        prefixIcon: const Icon(Icons.search, size: 20, color: Colors.black54),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.tune_rounded, size: 19),
        ),
        filled: true,
        fillColor: const Color(0xFFF4F4F4),
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(22),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 3.2,
      ),
      itemBuilder: (context, index) {
        final category = _categories[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Color(0x12000000), blurRadius: 2, offset: Offset(0, 1)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(category.$2, height: 24, width: 28, fit: BoxFit.contain),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    category.$1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle() {
    return Row(
      children: [
        const Text(
          'Recommander pour toi',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
          child: const Text(
            'voir plus',
            style: TextStyle(color: Color(0xFF007A4B), fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget _buildProviderCard((String, String, String) provider) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProviderDetailPage(
              name: provider.$1,
              location: 'Bamako, Mali',
              profession: provider.$2,
              imagePath: provider.$3,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0F5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(provider.$3, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: const Color(0xFFE5F3EC),
              child: Image.asset(provider.$3, fit: BoxFit.contain),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                provider.$1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        const SizedBox(height: 3),
        const Text(
          '⌖ Bamako, Mali',
          style: TextStyle(fontSize: 9, color: Colors.black45),
        ),
        Text(
          provider.$2,
          style: const TextStyle(fontSize: 9, color: Colors.black45),
        ),
        ],
      ),
    );
  }

  Widget _buildTabPlaceholder() {
    final labels = ['Accueil', 'Explorer', 'Profil'];
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _selectedTab == 1 ? Icons.search_rounded : Icons.person_outline,
            size: 48,
            color: const Color(0xFF007A4B),
          ),
          const SizedBox(height: 12),
          Text('${labels[_selectedTab]} bientôt disponible'),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return NavigationBar(
      height: 68,
      selectedIndex: _selectedTab,
      onDestinationSelected: (index) => setState(() => _selectedTab = index),
      backgroundColor: Colors.white,
      indicatorColor: const Color(0xFFE5F3EC),
      labelTextStyle: const WidgetStatePropertyAll(
        TextStyle(fontSize: 10, color: Color(0xFF007A4B)),
      ),
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Accueil'),
        NavigationDestination(icon: Icon(Icons.search), label: 'Explorer'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profil'),
      ],
    );
  }
}
