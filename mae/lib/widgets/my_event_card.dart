import 'package:flutter/material.dart';

class Event {
  final String name;
  final String date;
  final String status;

  Event({
    required this.name,
    required this.date,
    required this.status,
  });
}

class MyEventCard extends StatelessWidget {
  final Event event;

  const MyEventCard({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Safely split the date
    List<String> dateParts = event.date.split(' ');
    String dateMain = dateParts.isNotEmpty ? dateParts[0] : '';
    String dateSub = dateParts.length > 1 ? dateParts[1] : '';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Section
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                children: [
                  Text(
                    dateMain,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    dateSub,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Event Details Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.status,
                    style: TextStyle(
                      color: event.status == 'APPROVED'
                          ? Colors.green
                          : Colors.orange,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}