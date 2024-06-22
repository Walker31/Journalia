import 'package:flutter/material.dart';
import 'package:journalia/models/topic.dart';

class TopicProvider extends ChangeNotifier {
  List<Topic> _topics = []; // Initial list of topics

  // Method to fetch topics (replace with actual data fetch logic)
  Future<void> fetchTopics() async {
    // Simulate fetching data from API or database
    _topics = [
      Topic(
        topicId: 1,
        topicName: "Random",
      ),
      // Add more topics here
    ];
    notifyListeners(); // Notify listeners after data is updated
  }

  // Getter for topics
  List<Topic> get topics => _topics;

  // Method to add a new topic
  void addTopic(Topic topic) {
    _topics.add(topic);
    notifyListeners(); // Notify listeners after data is updated
  }

  // Method to update an existing topic
  void updateTopic(Topic updatedTopic) {
    // Find and update the topic in the list
    final index = _topics.indexWhere((topic) => topic.topicId == updatedTopic.topicId);
    if (index != -1) {
      _topics[index] = updatedTopic;
      notifyListeners(); // Notify listeners after data is updated
    }
  }

  // Method to delete a topic
  void deleteTopic(Topic topic) {
    _topics.remove(topic);
    notifyListeners(); // Notify listeners after data is updated
  }
}
