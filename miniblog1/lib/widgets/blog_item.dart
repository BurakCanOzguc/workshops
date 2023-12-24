import 'package:flutter/material.dart';
import 'package:miniblog1/models/blog.dart';
import 'package:miniblog1/screens/blog_details.dart';

class BlogItem extends StatelessWidget {
  const BlogItem({super.key, required this.blogs});
  final Blog blogs;

  navigateToBlogDetail(BuildContext context, String blogId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlogDetailScreen(blog: blogs),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          navigateToBlogDetail(context,
              blogs.id.toString()); // Pass the blog ID to the next screen
        },
        child: Card(
          margin: EdgeInsets.all(25),
          child: Column(children: [
            AspectRatio(
                aspectRatio: 4 / 2,
                child: Container(
                    width: double.infinity,
                    color: Color.fromARGB(179, 122, 122, 122),
                    child: Image.network(blogs.thumbnail!))),
            ListTile(
              title: Text(blogs.title!),
              subtitle: Text(blogs.author!),
            )
          ]),
        ));
  }
}
