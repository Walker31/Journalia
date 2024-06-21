import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF00796B);
const Color secondaryColor = Color(0xFF004D40);
const Color tertiaryColor = Color(0xFF009688);
const Color accentColor = Color(0xFF80CBC4);
const Color backgroundColor = Color(0xFFE0F2F1);
const Color cardColor = Color(0xFF004D40);
const Color textColor = Colors.white;

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journalia'),
        backgroundColor: primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [secondaryColor, primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: textColor),
                  prefixIcon: const Icon(Icons.search, color: textColor),
                  filled: true,
                  fillColor: accentColor.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Clubs',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: textColor),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward, color: textColor),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_vert, color: textColor),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  _buildArticleCard(
                    title: "How Bad do you hate your College?",
                    author: "Krishna",
                    content: "Ahh it’s the worst place you can be at, Firstly the climate here is horrible and don’t even get me started at the mess food. The minute you take a bite in, you will feel like puking...",
                    likes: 6969,
                  ),
                  _buildArticleCard(
                    title: "How Bad do you hate your College?",
                    author: "Anonymous",
                    content: "Ahh it’s the worst place you can be at, Firstly the climate here is horrible and don’t even get me started at the mess food. The minute you take a bite in, you will feel like puking...",
                    likes: 6969,
                  ),
                  _buildArticleCard(
                    title: "How Bad do you hate your College?",
                    author: "",
                    content: "Ahh it’s the worst place you can be at, Firstly the climate here is horrible and don’t even get me started at the mess ....",
                    likes: 6969,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondaryColor,
        selectedItemColor: tertiaryColor,
        unselectedItemColor: accentColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildArticleCard({
    required String title,
    required String author,
    required String content,
    required int likes,
  }) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            if (author.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "- $author",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: accentColor,
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: textColor,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.favorite, color: tertiaryColor),
                    const SizedBox(width: 5),
                    Text(
                      likes.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share, color: tertiaryColor),
                  label: const Text(
                    'Share',
                    style: TextStyle(color: tertiaryColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
