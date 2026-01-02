import 'package:flutter/material.dart';

class TuitionScreen extends StatelessWidget {
  const TuitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tuition & Teachers'),
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFF87CEEB).withOpacity(0.1),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for tuition or teachers...',
                prefixIcon: const Icon(Icons.search, color: Color(0xFF808000)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),
          
          // Teachers List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: 5,
              itemBuilder: (context, index) {
                return _buildTeacherCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherCard(BuildContext context, int index) {
    final names = ['Sarah Johnson', 'Michael Chen', 'Emily Davis', 'Robert Wilson', 'Jessica Brown'];
    final subjects = ['Mathematics', 'Physics', 'English Literature', 'Chemistry', 'Biology'];
    final ratings = [4.8, 4.9, 4.7, 4.5, 4.9];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xFF87CEEB),
              child: Text(
                names[index][0],
                style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    names[index],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subjects[index],
                    style: const TextStyle(
                      color: Color(0xFF808000), // Olive
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        ratings[index].toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.location_on, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        '2.5 km',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF808000), // Olive
                foregroundColor: Colors.white,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(12),
              ),
              child: const Icon(Icons.message),
            ),
          ],
        ),
      ),
    );
  }
}
