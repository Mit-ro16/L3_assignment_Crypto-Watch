import 'package:assignment/presentation/discover/screen/discover_screen.dart';

import 'package:assignment/presentation/home/screens/favourites_screen.dart';
import 'package:assignment/presentation/profile/screens/profile_screen.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final screens = [DiscoverScreen(), FavouritesScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Widget buildBottomNavBar() {
    final items = [
      {'icon': Icons.dashboard, 'label': 'Discover'},
      {'icon': Icons.favorite, 'label': 'Favourites'},
      {'icon': Icons.person, 'label': 'Profile'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(color: Color.fromARGB(255, 3, 53, 97)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final bool active = selectedIndex == index;

          return GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item['icon'] as IconData,
                  color: active ? Colors.blueAccent : Colors.white,
                  size: 22,
                ),
                const SizedBox(height: 4),
                Text(
                  item['label'] as String,
                  style: TextStyle(
                    color: active ? Colors.blueAccent : Colors.white,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
