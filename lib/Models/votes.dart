class Vote {
  final int voteId;
  final int articleId;
  final int userId;
  final int voteType;

  Vote({
    required this.voteId,
    required this.articleId,
    required this.userId,
    required this.voteType,
  });

  factory Vote.fromJson(Map<String, dynamic> json) {
    return Vote(
      voteId: json['voteId'],
      articleId: json['articleId'],
      userId: json['userId'],
      voteType: json['voteType'],
    );
  }
}
