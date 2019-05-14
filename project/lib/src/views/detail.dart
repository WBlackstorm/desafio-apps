import 'package:flutter/material.dart';
import '../model/news.dart';
import 'package:intl/intl.dart';

class DetailsView extends StatelessWidget {

  News _news;

  DetailsView({News news}) {
    _news = news;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _news.section.name.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 43, 115, 163),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            tooltip: 'Compartilhar',
            onPressed: () => {
              print('Share')
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            buildTitleBlock(_news),

            buildSubtitleBlock(_news),

            buildAuthorBlock(_news),

            buildPublishingDateBlock(_news),

            buildImageBlock(_news),

            buildContentBlock(_news),
          ],
        ),
      ),
    );
  }

  // Build block with image and description of image
  Widget buildImageBlock(News news) {

    Widget widget;
    Widget widget2;

    if (news.images != null && news.images.isNotEmpty) {
      widget = Image.network(
        news.images[0].url,
      );

      widget2 = Positioned.fill(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              color: Color.fromARGB(100, 0, 0, 0),                  
              padding: EdgeInsets.only(                  
                left: 10.0,
                right: 10.0,
                bottom: 5.0,
                top: 5.0, 
              ),
              child: Text(                         
                news.images[0].description + ' - ' + news.images[0].source,
                textAlign: TextAlign.left,       
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,                                
                ),  
              ),
            ),
          ],
        ),
      );

    } else {
      widget = Container(
        child:Image.asset(
          'lib/src/assets/placeholder-image.png',
          fit: BoxFit.cover,
        )
      );

      widget2 = SizedBox(height: 0.0);
    }

    return Stack(
      children: <Widget>[
        widget,
        widget2,
      ],
    );

  }

  Widget buildTitleBlock(News news) {

    if (news.title == null || news.title.isEmpty) {
      return SizedBox(height: 0.0);
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 30.0,
        bottom: 10.0,
        left: 10.0,
        right: 10.0,
      ),
      child: Text(
        news.title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
          color: Color.fromARGB(255, 26, 51, 75),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildSubtitleBlock(News news) {
    if (news.subTitle == null || news.subTitle == ''){
      return SizedBox(height: 0.0);
    }

    return Padding(
      padding: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 15.0,
        bottom: 25.0,
      ),
      child: Text(
        news.subTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 17,
          color: Color.fromARGB(255, 26, 51, 75),
        ),
      ),
    );
  }

  Widget buildAuthorBlock(News news) {

    if (news.authors == null || news.authors.isEmpty) {
      return SizedBox(height: 0.0);
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 5.0,
      ),
      child:Text(
        'POR ' + news.authors[0].toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: Color.fromARGB(255, 26, 51, 75),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildContentBlock(News news) {

    if (news.text == null || news.text.isEmpty) {
      return SizedBox(height: 0.0);
    }

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
        news.text,
        textAlign: TextAlign.left,
        style: TextStyle(
          height: 1.3,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildPublishingDateBlock(News news) {

    if (news.publishedAt == null || news.publishedAt.isEmpty) {
      return SizedBox(height: 0.0);
    }

    return Padding(
      padding: EdgeInsets.only(
        bottom: 15.0,
      ),
      child:Text(
        buildTimeText(_news.publishedAt),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          color: Color.fromARGB(255, 26, 51, 75),
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  // Format date in brazillian format.
  String buildTimeText(String time) {
    var dateTime = DateTime.parse(time);
    return new DateFormat("d/M/y H:m").format(dateTime).toString();
  }

}