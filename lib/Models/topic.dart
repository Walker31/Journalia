class Topic {
  final int topicId;
  final String topicName;

  Topic({required this.topicId, required this.topicName});

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      topicId: json['topicId'],
      topicName: json['topicName'],
    );
  }
}
