import 'package:flutter/material.dart';
import '../widgets/events_tab.dart';
import '../widgets/my_events_tab.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;
  final int initialTabIndex;

  const HomeScreen({
    Key? key,
    required this.toggleTheme,
    required this.isDarkMode,
    this.initialTabIndex = 0, // Default to the first tab
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTabIndex; // Use the passed tab index
    _screens = [
      const EventsTab(),
      const MyEventsTab(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APU Event App'),
        actions: [
          IconButton(
            icon: Icon(
              widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              widget.toggleTheme();
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'My Events',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}