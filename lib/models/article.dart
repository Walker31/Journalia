class Article {
  final String title;
  final String author;
  final String content;
  final int upVotes;
  final int downVotes;
  final List<String> comments;

  Article({
    required this.title,
    required this.author,
    required this.content,
    required this.upVotes,
    required this.downVotes,
    required this.comments,
  });
}

class Articles {
  final int articleId;
  final int topicId;
  final String writerId;
  final String imageUrl;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Articles(
      {required this.articleId,
      required this.content,
      required this.createdAt,
      required this.imageUrl,
      required this.topicId,
      required this.updatedAt,
      required this.writerId});
}
