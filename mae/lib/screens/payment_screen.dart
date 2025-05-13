import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'registration_success_screen.dart';

class Event {
  final String name;
  final String date;
  final String time;
  final String location;
  final String organizer;
  final double fee;
  final String status;
  final String imageUrl;
  final String details;

  Event({
    required this.name,
    required this.date,
    required this.time,
    required this.location,
    required this.organizer,
    required this.fee,
    required this.status,
    required this.imageUrl,
    required this.details,
  });
}

class PaymentScreen extends StatefulWidget {
  final Event event;
  final VoidCallback onPaymentComplete;

  const PaymentScreen({
    Key? key,
    required this.event,
    required this.onPaymentComplete,
  }) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _selectedPaymentMethod = 'Debit/Credit Card';
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Register Details',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Applicant Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Applicant Name*',
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email*',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Register Fee',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'RM ${widget.event.fee.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'PAYMENT METHOD',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Radio<String>(
                    value: 'Ewallet',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                  ),
                  const Text('Ewallet'),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Debit/Credit Card',
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                  ),
                  const Text('Debit/Credit Card'),
                ],
              ),
              if (_selectedPaymentMethod == 'Debit/Credit Card')
                Column(
                  children: [
                    const SizedBox(height: 8),
                    TextField(
                      controller: _cardNumberController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card Number*',
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade500,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    // Save registration info to Firebase
                    await FirebaseFirestore.instance.collection('registrations').add({
                      'applicantName': _nameController.text,
                      'email': _emailController.text,
                      'eventName': widget.event.name,
                      'eventId': widget.event.name +
                          widget.event.date +
                          widget.event.organizer, // or use a real eventId if available
                      'eventDetails': {
                        'name': widget.event.name,
                        'organizer': widget.event.organizer,
                        'date': widget.event.date,
                        'time': widget.event.time,
                        'location': widget.event.location,
                        'fee': widget.event.fee,
                        'status': widget.event.status,
                        'imageUrl': widget.event.imageUrl,
                        'details': widget.event.details,
                      },
                      'registeredAt': FieldValue.serverTimestamp(),
                    });
                    // Call the callback to update registered status
                    widget.onPaymentComplete();
                    // Navigate to success screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationSuccessScreen(),
                      ),
                    );
                  },
                  child: const Text('Confirm Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}