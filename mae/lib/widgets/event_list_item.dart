import 'package:flutter/material.dart';

class EventListItem extends StatelessWidget {
  final String title;
  final String time;
  final String status;

  const EventListItem({
    Key? key,
    required this.title,
    required this.time,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Event Title and Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          // Event Status
          Text(
            status,
            style: TextStyle(
              color: status == 'APPROVED' ? Colors.green : Colors.orange,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}