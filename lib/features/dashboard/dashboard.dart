import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wellness_app/core/route_config/route_names.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Explore",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                    RoutesName.profileScreen,
                );

              },
              child: const CircleAvatar(
                radius: 22,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconBox(CupertinoIcons.heart, "My favorites"),
                _iconBox(CupertinoIcons.bell, "Remind Me"),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Today's Quotes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            _quoteCard(
              '"Your wellness is an investment,\nnot an expense."',
              'Shreejesh Pathak',
              height: 130,
            ),
            const SizedBox(height: 18),
            const Text(
              "Quotes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            _tile(CupertinoIcons.sun_min, "Feeling Blessed",
            onTap: (){
              Navigator.pushNamed(
                  context,
                  RoutesName.quotesScreen);
            }),
            _tile(Icons.woman, "Pride Month"),
            _tile(CupertinoIcons.star, "Self Worth"),
            _tile(CupertinoIcons.heart, "Love"),
            //For Health Tips
            const SizedBox(height: 18,),
            const Text(
              "Health Tips",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            _tile(CupertinoIcons.sun_min, "Breathe to Reset"),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Reusable icon box widget
  Widget _iconBox(IconData icon, String label) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
  // Reusable quote card
  Widget _quoteCard(String quote, String author, {double height = 100}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            quote,
            style: const TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 21,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '- $author',
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  // Reusable tile for the quote topics
  Widget _tile(IconData icon, String text, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
        ),
        width: double.infinity,
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: Colors.white),
                const SizedBox(width: 15),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            const Icon(Icons.chevron_right, size: 30, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
