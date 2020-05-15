import 'package:flutter/material.dart';
import 'package:flutterapp1/demo/postDetail.dart';
import 'package:flutterapp1/model/post.dart';

class listViewDemo extends StatelessWidget {
  //列表项目预处理
  Widget _listItemBuiler(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.network(posts[index].imageUrl),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.center,
                ),
                Text(
                  posts[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  posts[index].author,
                  style: Theme.of(context).textTheme.subhead,
                ),
                SizedBox(height: 16.0)
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(0.1),
                  onTap: () {
                    // debugPrint('tap');
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => postDetail(post: posts[index],))
                    );
                  },
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuiler,
    );
  }
}
