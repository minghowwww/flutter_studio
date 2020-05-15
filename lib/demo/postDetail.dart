import 'package:flutter/material.dart';
import 'package:flutterapp1/model/post.dart';

class postDetail extends StatelessWidget {
  final Post post;
  
  postDetail({
    @required this.post
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${post.title}'),
        ),
      ),
    );
  }
}