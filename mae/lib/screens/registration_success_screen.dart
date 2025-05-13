import 'package:flutter/material.dart';
import 'home_screen.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Registration Placed',
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                color: Colors.blue.shade500,
                size: 40,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Event Registered',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You can now track the\nstatus of your event',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade500,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        toggleTheme: () {},
                        isDarkMode: false,
                        initialTabIndex: 3, // Registered tab index
                      ),
                    ),
                    (route) => false,
                  );
                },
                child: const Text('Track Your Event'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade500,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        toggleTheme: () {},
                        isDarkMode: false,
                      ),
                    ),
                    (route) => false,
                  );
                },
                child: const Text('Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}