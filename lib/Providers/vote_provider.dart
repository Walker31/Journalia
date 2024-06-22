import 'package:flutter/material.dart';
import 'package:journalia/models/votes.dart';

class VotesProvider extends ChangeNotifier {
  List<Votes> _votes = []; // Initial list of votes

  // Method to fetch votes (replace with actual data fetch logic)
  Future<void> fetchVotes() async {
    // Simulate fetching data from API or database
    _votes = [
      Votes(
        voteId: 1,
        articleId: 1,
        userId: 1,
        voteType: 1,
      ),
      // Add more votes here
    ];
    notifyListeners(); // Notify listeners after data is updated
  }

  // Getter for votes
  List<Votes> get votes => _votes;

  // Method to add a new vote
  void addVote(Votes vote) {
    _votes.add(vote);
    notifyListeners(); // Notify listeners after data is updated
  }

  // Method to update an existing vote
  void updateVote(Votes updatedVote) {
    // Find and update the vote in the list
    final index = _votes.indexWhere((vote) => vote.voteId == updatedVote.voteId);
    if (index != -1) {
      _votes[index] = updatedVote;
      notifyListeners(); // Notify listeners after data is updated
    }
  }

  // Method to delete a vote
  void deleteVote(Votes vote) {
    _votes.remove(vote);
    notifyListeners(); // Notify listeners after data is updated
  }
}
