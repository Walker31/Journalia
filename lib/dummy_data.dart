import 'Models/article_box.dart';

List<ArticleBox> generateDummyArticles(int topicIndex) {
  switch (topicIndex) {
    case 0: // Random
      return [
        ArticleBox(
          title: 'Random Article 1',
          author: 'John Doe',
          content: 'Random content for article 1.',
          upVotes: 10,
          downVotes: 2,
          comments: ['Comment 1', 'Comment 2'],
        ),
        ArticleBox(
          title: 'Random Article 2',
          author: 'Jane Smith',
          content: 'Random content for article 2.',
          upVotes: 8,
          downVotes: 1,
          comments: ['Comment 1', 'Comment 2', 'Comment 3'],
        ),
      ];
    case 1: // Raising Issues
      return [
        ArticleBox(
          title: 'Issue 1',
          author: 'John Doe',
          content: 'Content for issue 1.',
          upVotes: 15,
          downVotes: 3,
          comments: ['Issue comment 1'],
        ),
        ArticleBox(
          title: 'Issue 2',
          author: 'Jane Smith',
          content: 'Content for issue 2.',
          upVotes: 12,
          downVotes: 2,
          comments: ['Issue comment 1', 'Issue comment 2'],
        ),
      ];
    case 2: // Resource Sharing
      return [
        ArticleBox(
          title: 'Resource Sharing 1',
          author: 'Alex Johnson',
          content: 'Content for resource sharing 1.',
          upVotes: 20,
          downVotes: 1,
          comments: ['Resource comment 1'],
        ),
        ArticleBox(
          title: 'Resource Sharing 2',
          author: 'Emily Brown',
          content: 'Content for resource sharing 2.',
          upVotes: 18,
          downVotes: 0,
          comments: ['Resource comment 1', 'Resource comment 2'],
        ),
      ];
    // Add cases for other topics as needed
    default:
      return []; // Empty list as default
  }
}
