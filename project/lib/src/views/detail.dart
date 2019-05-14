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
        child:Center(
          child: Column(
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.only(
                  top: 30.0,
                  bottom: 10.0,
                  left: 10.0,
                  right: 10.0,
                ),
                child: Text(
                  _news.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 26, 51, 75),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 15.0,
                  bottom: 25.0,
                ),
                child: Text(
                  _news.subTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 26, 51, 75),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 5.0,
                ),
                child:Text(
                  'POR ' + _news.authors[0].toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 26, 51, 75),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Padding(
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
              ),

              buildImageBlock(_news),

              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  _news.text,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    height: 1.3,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Build block with image and description of image
  Widget buildImageBlock(News news) {
    return Stack(
      children: <Widget>[
        
        Image.network(
          news.images[0].url,
        ),

        Positioned.fill(
          bottom: 0.0,
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(10.0),
            child: Text(
              news.images[0].description + ' - ' + news.images[0].source,
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),  
            ),
          ),
        )
      ],
    );

  }

  // Format date in brazillian format.
  String buildTimeText(String time) {
    var dateTime = DateTime.parse(time);
    return new DateFormat("d/M/y H:m").format(dateTime).toString();
  }

}