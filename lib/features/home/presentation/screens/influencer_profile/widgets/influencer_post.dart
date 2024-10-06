import 'package:flutter/material.dart';

class PostsGrid extends StatelessWidget {
  final List<String> posts;

  const PostsGrid({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: posts.isEmpty ? 0 : 300,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return Image.network(posts[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}
