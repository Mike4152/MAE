import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'my_event_card.dart';

class MyEventsTab extends StatelessWidget {
  const MyEventsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('events')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No events found.'));
        }

        // Map Firestore documents to Event objects
        final events = snapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Event(
            name: data['name'] ?? '',
            date: data['date'] ?? '',
            status: data['status'] ?? '',
          );
        }).toList();

        // Separate events into pending and approved categories
        final pendingEvents = events.where((e) => e.status == 'PENDING').toList();
        final approvedEvents = events.where((e) => e.status == 'APPROVED').toList();

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pending Events Section
                const Text(
                  'PENDING EVENTS',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: pendingEvents.length,
                  itemBuilder: (context, index) {
                    return MyEventCard(event: pendingEvents[index]);
                  },
                ),
                const SizedBox(height: 24),

                // Approved Events Section
                const Text(
                  'YOUR UPCOMING EVENTS',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: approvedEvents.length,
                  itemBuilder: (context, index) {
                    return MyEventCard(event: approvedEvents[index]);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}