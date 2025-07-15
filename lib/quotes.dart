import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  final PageController _pageController = PageController();
  final List<Map<String, String>> quotes = [
    {
      'quote': 'The only way to do great work is to love what you do.',
      'author': 'Steve Jobs'
    },
    {
      'quote': 'Success is not final, failure is not fatal: It is the courage to continue that counts.',
      'author': 'Winston Churchill'
    },
    {
      'quote': 'Believe you can and you\'re halfway there.',
      'author': 'Theodore Roosevelt'
    },
    {
      'quote': 'Don’t watch the clock; do what it does. Keep going.',
      'author': 'Sam Levenson'
    },
    {
      'quote': 'Everything you’ve ever wanted is on the other side of fear.',
      'author': 'George Addair'
    },
    {
      'quote': 'Hardships often prepare ordinary people for an extraordinary destiny.',
      'author': 'C.S. Lewis'
    },
    {
      'quote': 'You miss 100% of the shots you don’t take.',
      'author': 'Wayne Gretzky'
    },
    {
      'quote': 'Opportunities don’t happen. You create them.',
      'author': 'Chris Grosser'
    },
    {
      'quote': 'Success is not how high you have climbed, but how you make a positive difference to the world.',
      'author': 'Roy T. Bennett'
    },
    {
      'quote': 'It always seems impossible until it’s done.',
      'author': 'Nelson Mandela'
    },
    {
      'quote': 'Your time is limited, don’t waste it living someone else’s life.',
      'author': 'Steve Jobs'
    },
    {
      'quote': 'Great things never come from comfort zones.',
      'author': 'Unknown'
    },
    {
      'quote': 'Push yourself, because no one else is going to do it for you.',
      'author': 'Unknown'
    },
    {
      'quote': 'Dream it. Wish it. Do it.',
      'author': 'Unknown'
    },
    {
      'quote': 'Stay focused and never give up.',
      'author': 'Unknown'
    },
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: quotes.length,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            final quote = quotes[index];
            return Stack(
              children: [
                // Top AppBar with title and page indicator
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      const Text(
                        'Motivation',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${index + 1}/${quotes.length}',
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),


                // Centered Quote Text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '❝ ${quote['quote']} ❞',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '- ${quote['author']}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Sound Icon
                Positioned(
                  right: 16,
                  top: MediaQuery.of(context).size.height * 0.25,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[800],
                    child: const Icon(Icons.volume_up, color: Colors.white),
                  ),
                ),

                // Bottom swipe up + icons
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      const Icon(Icons.swipe, color: Colors.white, size: 60,),
                      const Text(
                        'Swipe',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.favorite_border, color: Colors.white, size: 40,),
                          SizedBox(width: 30),
                          Icon(Icons.local_offer_outlined, color: Colors.white, size: 40,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
