import 'package:flutter/material.dart';
import 'package:wellness_app/core/route_config/route_names.dart';

class UserPreferenceScreen extends StatefulWidget {
  const UserPreferenceScreen({super.key});

  @override
  State<UserPreferenceScreen> createState() => _UserPreferenceScreenState();
}

class _UserPreferenceScreenState extends State<UserPreferenceScreen> {
  final List<String> topics = [
    'Hard times',
    'Working Out',
    'Focus',
    'Mindfulness',
    'Discipline',
    'Growth',
    'Mental Strength',
    'Confidence',
    'Peace',
    'Hustle',
  ];

  final Set<String> selectedTopics = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preferences"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            _topic(),
            const SizedBox(height: 30),
            _iconGrid(),
            const SizedBox(height: 40),
            _saveButton(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _topic() {
    return const Text(
      "Select All Topics That\nMotivate You",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _iconGrid() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: topics.map((topic) => _iconBox(topic)).toList(),
    );
  }

  Widget _iconBox(String label) {
    final isSelected = selectedTopics.contains(label);

    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected ? selectedTopics.remove(label) : selectedTopics.add(label);
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 24,
        height: 70,
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[750] : Colors.grey[900],
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(color: Colors.white, fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _saveButton() {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          // Handle save logic
          if (selectedTopics.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please select at least one topic')),
            );
          } else {
            Navigator.pushNamed(
                context,
                RoutesName.dashboardScreen);
          }
        },
        child: const Text(
          "Save Preferences",
          style: TextStyle(color: Colors.black, fontSize: 16),

        ),
      ),
    );
  }
}
