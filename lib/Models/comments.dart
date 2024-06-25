class Comments {
  final int commentId;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Comments({
    required this.commentId,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      commentId: json['commentId'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
