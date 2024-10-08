import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viksera/config/typography/app_styles.dart';

class PostsGrid extends StatelessWidget {
  final List<String> posts;

  const PostsGrid({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Posts',
              style: AppStyles.style18.copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('See More'),
            ),
          ],
        ),
        SizedBox(
          height: posts.isEmpty ? 0 : 250,
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
              return CachedNetworkImage(
                  imageUrl: posts[index], fit: BoxFit.cover);
            },
          ),
        ),
      ],
    );
  }
}
