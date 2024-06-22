class Votes {
  final int voteId;
  final int articleId;
  final int userId;
  final int voteType;

  Votes(
      {required this.articleId,
      required this.voteType,
      required this.userId,
      required this.voteId});
}