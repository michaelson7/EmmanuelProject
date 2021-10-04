import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Model/core/NewsModel.dart';
import 'package:flutter_project/Provider/NewsProvider.dart';
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
  NewsProvider _newsProvider = NewsProvider();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await _newsProvider.getAllNews();
    setState(() => isLoading = !isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  introHeader(),
                  newsLetters(),
                ],
              )),
            ),
          );
  }

  introHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
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
                    'https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bmV3c3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
                  ),
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
      ),
    );
  }

  newsLetters() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('News Letter', style: kTextStyleHeader1),
          StreamBuilder(
              stream: _newsProvider.NewsListController,
              builder: (context, AsyncSnapshot<List<NewsModel>> snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      var newsValue = data[index];
                      return listTileCard(
                          title: newsValue.heading,
                          subheading: newsValue.message,
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsActivity(
                                  imgPath: newsValue.imagePath,
                                  newsHeader: newsValue.heading,
                                  newsMessage: newsValue.message,
                                ),
                              ),
                            );
                          });
                    },
                  );
                }
                return CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
