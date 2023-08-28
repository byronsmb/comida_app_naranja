import 'package:flutter/material.dart';

class MyBottomNavigation extends StatefulWidget {
  MyBottomNavigation({super.key, required this.currentIndex});
  int currentIndex;

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    //final textTheme = Theme.of(context).textTheme;

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.currentIndex,
      backgroundColor: colorScheme.surface,
      selectedItemColor: const Color.fromARGB(255, 231, 76, 20),
      unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
      onTap: (value) {
        // Respond to item press.
        setState(() => widget.currentIndex = value);
      },
      items: const [
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.shopping_cart),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.grid_view_sharp),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.favorite),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Icon(Icons.person_2_rounded),
        ),
      ],
    );
  }
}
