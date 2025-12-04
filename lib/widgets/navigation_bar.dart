import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomNavigationBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(context, '/', (r) => false);
              break;
            case 1:
              Navigator.pushNamed(context, '/immobilien');
              break;
            case 2:
              Navigator.pushNamed(context, '/ueber-uns');
              break;
            case 3:
              Navigator.pushNamed(context, '/kontakt');
              break;
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Start'),
          NavigationDestination(icon: Icon(Icons.house), label: 'Immobilien'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Über uns'),
          NavigationDestination(icon: Icon(Icons.phone), label: 'Kontakt'),
        ],
      ),
    );
  }
}