import 'package:flutter/material.dart';
import '../screens/create_event_screen.dart';

class EventsTab extends StatelessWidget {
  const EventsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event_note, size: 80, color: Colors.deepPurple.shade300),
            const SizedBox(height: 24),
            const Text(
              'Create New Event',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'This section is for external organizers to propose and manage events.\n\nYou will not be able to register or join any events here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Create Event'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                backgroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateEventScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}