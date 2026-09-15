import 'package:flutter/material.dart';
import 'provider_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  String _query = '';

  final _providers = const [
    ('Amadou Diawara', 'Niamakoro', 'Plombier', 'assets/images/images_plombier.png'),
    ('Oumar Diallo', 'Baco-djicoroni', 'Electricien', 'assets/images/images_electricien.png'),
    ('Awa Doumbia', 'Niamana', 'Peintre', 'assets/images/images_peintre.png'),
    ('Koffi Kalamoj', 'Koulouba', 'Informatique', 'assets/images/images_infor.png'),
    ('Amadou Diawara', 'Niamakoro', 'Plombier', 'assets/images/images_plombier.png'),
    ('Oumar Diallo', 'Baco-djicoroni', 'Electricien', 'assets/images/images_electricien.png'),
    ('Awa Doumbia', 'Niamana', 'Peintre', 'assets/images/images_peintre.png'),
    ('Koffi Kalamoj', 'Koulouba', 'Informatique', 'assets/images/images_infor.png'),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredProviders = _providers.where((provider) {
      final searchableText = '${provider.$1} ${provider.$2} ${provider.$3}'.toLowerCase();
      return searchableText.contains(_query.toLowerCase());
    }).toList();

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 24, 18, 0),
          sliver: SliverToBoxAdapter(child: Image.asset('assets/images/logo_1.png', height: 42, alignment: Alignment.centerLeft)),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(18, 24, 18, 0),
          sliver: SliverToBoxAdapter(child: _buildSearchBar()),
        ),
        const SliverPadding(
          padding: EdgeInsets.fromLTRB(24, 16, 18, 10),
          sliver: SliverToBoxAdapter(
            child: Text(
              'Nos prestataires',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildProviderCard(filteredProviders[index]),
              childCount: filteredProviders.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 9,
              mainAxisSpacing: 14,
              childAspectRatio: .75,
            ),
          ),
        ),
        if (filteredProviders.isEmpty)
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text('Aucun prestataire trouvé')),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            onChanged: (value) => setState(() => _query = value),
            decoration: InputDecoration(
              hintText: 'Rechercher Prestataire',
              hintStyle: const TextStyle(fontSize: 11, color: Colors.black38),
              suffixIcon: const Icon(Icons.search, size: 19, color: Color(0xFF9BB5DD)),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 11),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(color: Color(0xFFE7E7E7)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(color: Color(0xFF007A4B)),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          height: 44,
          width: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFE7E7E7)),
            boxShadow: const [BoxShadow(color: Color(0x10000000), blurRadius: 2)],
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.location_on_outlined, color: Color(0xFFB4B4B4), size: 20),
          ),
        ),
      ],
    );
  }

  Widget _buildProviderCard((String, String, String, String) provider) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProviderDetailPage(
              name: provider.$1,
              location: provider.$2,
              profession: provider.$3,
              imagePath: provider.$4,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Expanded(
          child: Container(
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0F5),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Image.asset(provider.$4, fit: BoxFit.contain),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundColor: const Color(0xFFE5F3EC),
              child: Image.asset(provider.$4, fit: BoxFit.contain),
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
        Text(
          '⌖ ${provider.$2}',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 9, color: Colors.black45),
        ),
        Text(
          provider.$3,
          style: const TextStyle(fontSize: 9, color: Colors.black45),
        ),
        ],
      ),
    );
  }
}
