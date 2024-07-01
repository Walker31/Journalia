import 'package:flutter/material.dart';
import 'package:journalia/Widgets/base_scaffold.dart';
import 'package:journalia/Widgets/bottom_nav_bar.dart';
import 'package:journalia/Widgets/drawer.dart';
import 'package:journalia/constants.dart';
import '../../colors.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  CreatePostPageState createState() => CreatePostPageState();
}

class CreatePostPageState extends State<CreatePostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  String? selectedCommunity; // Default selected community
  String selectedCategory = 'Experience Sharing'; // Default selected category

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Scaffold(
        appBar: buildAppBar2(context), // Custom app bar
        drawer: const CustomDrawer(), // Custom drawer widget
        backgroundColor: Colors.transparent,
        bottomNavigationBar: const BottomNavBar(), // Bottom navigation bar
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Create Post',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.bold,
                          color: primaryTextColor,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton(
                          onPressed: () {
                            // Open drafts
                          },
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Adjust border radius as needed
                          ),
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
                  _buildCommunityDropdown(), // Dropdown to select community
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
                            hintStyle: TextStyle(color: primaryTextColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          style: const TextStyle(color: primaryTextColor),
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          controller: contentController,
                          decoration: const InputDecoration(
                            hintText: 'Your text post (optional)',
                            hintStyle: TextStyle(color: primaryTextColor),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            ),
                          ),
                          style: const TextStyle(color: primaryTextColor),
                          maxLines: 5,
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildCategoryDropdown(), // Dropdown to select category
                            IconButton(
                              icon: const Icon(Icons.image_outlined,color: primaryTextColor,),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCommunityDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color:primaryTextColor,width: 2),
          borderRadius: BorderRadius.circular(32)
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const ImageIcon(AssetImage("assets/DashedCircle.png"),color: primaryTextColor),
            DropdownButton(
              hint: const Text("Choose a Community",style: TextStyle(color: primaryTextColor),),
              padding: const EdgeInsets.all(8.0),
              icon: const Icon(Icons.arrow_drop_down_rounded,color: primaryTextColor,size: 36,),
              dropdownColor: Colors.grey.shade200,
              value: selectedCommunity,
              items: communityList.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,style: const TextStyle(color: primaryTextColor,fontSize: 20),),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCommunity = value!;
                });
              },
            ),
          ],
        ),
      ),
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
          const Text("Mark as: ", style: TextStyle(color: primaryTextColor)),
          DropdownButton(
            isExpanded: false,
            icon:const Icon(Icons.arrow_drop_down_rounded,color: primaryTextColor,size: 36,),
            underline: const Text(''),
            value: selectedCategory,
            items: topics.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(32)
                  ),
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCategory = value!;
              });
            },
          ),
        ]
      ),
    );
  }
}
