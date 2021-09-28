import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/View/constants/constants.dart';
import 'package:flutter_project/View/screens/activities/NewsActivity.dart';
import 'package:flutter_project/View/widgets/ImageCardBackground.dart';
import 'package:flutter_project/View/widgets/listTileCard.dart';

class NewsFragment extends StatefulWidget {
  const NewsFragment({Key? key}) : super(key: key);

  @override
  _NewsFragmentState createState() => _NewsFragmentState();
}

class _NewsFragmentState extends State<NewsFragment> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [introHeader(), newsLetters()],
        )),
      ),
    );
  }

  introHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Information', style: kTextStyleHeader1),
        Text('News, Updates, Alerts', style: kTextStyleHint),
        SizedBox(height: 10),
        Material(
          color: kAccent,
          borderRadius: kBorderRadiusCircular,
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xc3000000),
              borderRadius: kImageRadiusTop,
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://images.unsplash.com/photo-1632500917012-685cf5c701c1?ixid=MnwxMjA3f'
                    'DB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8'
                    'fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello World ',
                    style: kTextStyleHint,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Sample header',
                    style: kTextStyleHeader2,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  newsLetters() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('News Letter', style: kTextStyleHeader1),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return listTileCard(
                  title: 'Sample header',
                  subheading: 'anotherSample $index',
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsActivity(
                          imgPath: '',
                          newsHeader: 'Sample Header',
                        ),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
