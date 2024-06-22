class Users {
  final int userId;
  final String userName;
  final String email;
  final String accessToken;
  final String role;
  final bool banned;

  Users(
      {required this.accessToken,
      required this.banned,
      required this.email,
      required this.role,
      required this.userId,
      required this.userName});
}