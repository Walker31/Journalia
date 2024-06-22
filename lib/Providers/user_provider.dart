import 'package:flutter/material.dart';
import 'package:journalia/models/users.dart';

class UsersProvider extends ChangeNotifier {
  List<Users> _users = [];
  Users? currentUser; // Initial list of users

  // Method to fetch users (replace with actual data fetch logic)
  Future<void> fetchUsers() async {
    // Simulate fetching data from API or database
    _users = [
      Users(
        userId: 1,
        userName: "John Doe",
        email: "john.doe@example.com",
        accessToken: "sample_access_token",
        role: "user",
        banned: false,
      ),
      // Add more users here
    ];
    notifyListeners(); // Notify listeners after data is updated
  }

  // Getter for users
  List<Users> get users => _users;

  // Method to add a new user
  void addUser(Users user) {
    _users.add(user);
    notifyListeners(); // Notify listeners after data is updated
  }

  void setUserDetails(String userName, String email) {
    currentUser = Users(
      userId: _users.length + 1, // Generate a new userId
      userName: userName,
      email: email,
      accessToken: '', // Set appropriate access token
      role: 'user', // Default role
      banned: false,
    );
    notifyListeners(); // Notify listeners after data is updated
  }

  // Method to update an existing user
  void updateUser(Users updatedUser) {
    // Find and update the user in the list
    final index = _users.indexWhere((user) => user.userId == updatedUser.userId);
    if (index != -1) {
      _users[index] = updatedUser;
      notifyListeners(); // Notify listeners after data is updated
    }
  }

  // Method to delete a user
  void deleteUser(Users user) {
    _users.remove(user);
    notifyListeners(); // Notify listeners after data is updated
  }
}
