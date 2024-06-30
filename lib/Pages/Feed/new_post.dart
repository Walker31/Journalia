import 'package:flutter/material.dart';
import 'package:journalia/Widgets/base_scaffold.dart';
import 'package:logger/logger.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  CreatePostPageState createState() => CreatePostPageState();
}

class CreatePostPageState extends State<CreatePostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  String? selectedCommunity = 'Community 1';
  String selectedCategory = 'Clubs';

  List<String> communityList = ['Community 1', 'Community 2', 'Community 3'];
  List<String> topic = [
    'Clubs',
    'Experience Sharing',
    'Random',
    'Internship',
    'Politics',
    'Raising Issues',
    'Resource Sharing',
    'New Initiatives'
  ];

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            PostHeader(),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Create Post',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Caveat',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {
                      // Open drafts
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.purple.withOpacity(0.1),
                    ),
                    child: const Text(
                      'My Drafts',
                      style: TextStyle(color: Colors.purpleAccent),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            _buildCommunityDropdown(),
            const SizedBox(height: 20.0),
            
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'An Interesting title',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: contentController,
                    decoration: const InputDecoration(
                      hintText: 'Your text post (optional)',
                      hintStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    style: const TextStyle(color: Colors.black),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryDropdown(),
                      IconButton(
                        icon: const Icon(Icons.image),
                        onPressed: () {
                          // Add image
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Save draft
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text('Save Draft'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    // Post
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Post'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedCommunity,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
        hintText: 'Choose a community',
      ),
      items: communityList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCommunity = value!;
        });
      },
    );
  }

  Widget _buildCategoryDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const Text("Mark as: ", style: TextStyle(color: Colors.black)),
          const SizedBox(width: 8.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.zero,
              elevation: 0,
            ),
            onPressed: null,
            child: DropdownButton<String>(
              value: selectedCategory,
              items: topic.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.grey),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Logger logger = Logger();

  PostHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 36,color: Colors.black,),
        ),
        
        const Text(
          "Journalia",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Caveat',
            fontWeight: FontWeight.bold,
            fontSize: 48,
          ),
        ),
        IconButton(
          onPressed: () {
            logger.d('Person icon button pressed!');
          },
          icon: const Icon(Icons.menu,color: Colors.black,)
        ),
      ],
    );
  }
}

