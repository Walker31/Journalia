class User {
  final int userId;
  final String userName;
  final String email;
  final String accessToken;
  final String role;
  final bool banned;

  User({
    required this.userId,
    required this.userName,
    required this.email,
    required this.accessToken,
    required this.role,
    required this.banned,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      userName: json['userName'],
      email: json['email'],
      accessToken: json['accessToken'],
      role: json['role'],
      banned: json['banned'],
    );
  }
}
