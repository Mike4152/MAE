import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EventApp());
}

class EventApp extends StatefulWidget {
  const EventApp({Key? key}) : super(key: key);

  @override
  State<EventApp> createState() => _EventAppState();
}

class _EventAppState extends State<EventApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APU Event App',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: HomeScreen(
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        isDarkMode: isDarkMode,
      ),
    );
  }
}