import 'package:flutter/material.dart';
import '../../Models/article_box.dart';
import '../../colors.dart';

class ArticleCard extends StatefulWidget {
  final ArticleBox article;

  const ArticleCard({
    super.key,
    required this.article,
  });

  @override
  ArticleCardState createState() => ArticleCardState();
}

class ArticleCardState extends State<ArticleCard> {
  late int likes;
  late int dislikes;
  bool isLiked = false;
  bool isDisliked = false;

  @override
  void initState() {
    super.initState();
    likes = widget.article.upVotes;
    dislikes = widget.article.downVotes;
  }

  void _toggleLike() {
    setState(() {
      if (isLiked) {
        likes--;
      } else {
        likes++;
        if (isDisliked) {
          dislikes--;
          isDisliked = false;
        }
      }
      isLiked = !isLiked;
    });
  }

  void _toggleDislike() {
    setState(() {
      if (isDisliked) {
        dislikes--;
      } else {
        dislikes++;
        if (isLiked) {
          likes--;
          isLiked = false;
        }
      }
      isDisliked = !isDisliked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.article.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (widget.article.author.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "- ${widget.article.author}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: accentColor,
                  ),
                ),
              ),
            const SizedBox(height: 10),
            Text(
              widget.article.content,
              style: const TextStyle(
                fontSize: 16,
                color: textColor,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.thumb_up_alt : Icons.thumb_up_off_alt,
                        color: tertiaryColor,
                      ),
                      onPressed: _toggleLike,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      likes.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isDisliked
                            ? Icons.thumb_down
                            : Icons.thumb_down_off_alt,
                        color: tertiaryColor,
                      ),
                      onPressed: _toggleDislike,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      dislikes.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.share, color: tertiaryColor),
                  label: const Text(
                    'Share',
                    style: TextStyle(color: tertiaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              title: const Text(
                "Comments",
                style: TextStyle(color: textColor),
              ),
              children: widget.article.comments
                  .map((comment) => ListTile(
                        title: Text(
                          comment,
                          style: const TextStyle(color: textColor),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
