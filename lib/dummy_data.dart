import 'Models/article_box.dart';

List<ArticleBox> generateDummyArticles() {
  return [
    ArticleBox(
      title: 'Flutter Widgets Overview',
      author: 'John Doe',
      content:
          'This is a detailed overview of different Flutter widgets and their usage.',
      upVotes: 15,
      downVotes: 3,
      comments: [
        'Great article!',
        'I found this really helpful.',
        'Could use more examples.',
      ],
    ),
    ArticleBox(
      title: 'State Management in Flutter',
      author: 'Jane Smith',
      content:
          'Learn how to manage state effectively in your Flutter applications.',
      upVotes: 10,
      downVotes: 2,
      comments: [
        'Very informative!',
        'Could you explain more about provider?',
      ],
    ),
    ArticleBox(
      title: 'Advanced Dart Features',
      author: 'Alex Johnson',
      content:
          'Explore advanced Dart language features like mixins, generics, and more.',
      upVotes: 20,
      downVotes: 1,
      comments: [
        'This helped me understand generics better.',
        'Can you write about async programming next?',
      ],
    ),
    ArticleBox(
      title: 'Flutter Animations Deep Dive',
      author: 'Emily Brown',
      content:
          'Deep dive into Flutter animations with examples and best practices.',
      upVotes: 18,
      downVotes: 0,
      comments: [
        'Animations are so cool!',
        'Could you cover staggered animations too?',
      ],
    ),
    ArticleBox(
      title: 'Effective UI Design Principles',
      author: 'David Lee',
      content:
          'Learn about effective UI design principles and how to apply them.',
      upVotes: 25,
      downVotes: 5,
      comments: [
        'This changed the way I design!',
        'More examples would be great.',
      ],
    ),
    ArticleBox(
      title: 'Firebase Integration with Flutter',
      author: 'Sarah Johnson',
      content:
          'Integrate Firebase services like Firestore and Authentication in Flutter.',
      upVotes: 12,
      downVotes: 2,
      comments: [
        'Firebase is awesome!',
        'Could you explain Firebase Realtime Database too?',
      ],
    ),
    ArticleBox(
      title: 'Responsive Design in Flutter',
      author: 'Michael White',
      content:
          'Design responsive Flutter applications for various screen sizes.',
      upVotes: 16,
      downVotes: 3,
      comments: [
        'Very helpful for cross-platform apps!',
        'How about handling landscape orientation?',
      ],
    ),
    ArticleBox(
      title: 'Testing Strategies in Flutter',
      author: 'Lisa Green',
      content:
          'Implement effective testing strategies for Flutter applications.',
      upVotes: 14,
      downVotes: 1,
      comments: [
        'Testing is crucial!',
        'Could you cover unit testing in more detail?',
      ],
    ),
    ArticleBox(
      title: 'Flutter vs. React Native Comparison',
      author: 'Mark Anderson',
      content:
          'Compare Flutter and React Native frameworks for mobile app development.',
      upVotes: 22,
      downVotes: 4,
      comments: [
        'Interesting comparison!',
        'What about performance differences?',
      ],
    ),
    ArticleBox(
      title: 'CI/CD Pipelines in Mobile App Development',
      author: 'Sophia Clark',
      content:
          'Set up Continuous Integration and Deployment pipelines for mobile apps.',
      upVotes: 19,
      downVotes: 2,
      comments: [
        'CI/CD is a game-changer!',
        'Could you explain Jenkins integration too?',
      ],
    ),
    // Add more dummy articles as needed
  ];
}