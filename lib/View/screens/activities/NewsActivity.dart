import 'package:flutter/material.dart';
import 'package:flutter_project/View/widgets/ImageCardBackground.dart';

class NewsActivity extends StatelessWidget {
  final newsHeader, imgPath, newsMessage;
  const NewsActivity(
      {Key? key,
      required this.newsHeader,
      required this.imgPath,
      this.newsMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(newsHeader),
              background: imageCardBackground(
                width: double.infinity,
                height: 350.0,
                imgPath: imgPath,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(newsMessage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
