class ArticleBox {
  final String title;
  final String author;
  final String content;
  final int upVotes;
  final int downVotes;
  final List<String> comments;

  ArticleBox({
    required this.title,
    required this.author,
    required this.content,
    required this.upVotes,
    required this.downVotes,
    required this.comments,
  });
}
