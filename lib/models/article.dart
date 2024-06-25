class Articles {
  final int articleId;
  final int topicId;
  final String writerId;
  final String imageUrl;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Articles({
    required this.articleId,
    required this.topicId,
    required this.writerId,
    required this.imageUrl,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      articleId: json['articleId'],
      topicId: json['topicId'],
      writerId: json['writerId'],
      imageUrl: json['imageUrl'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
