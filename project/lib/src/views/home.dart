import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../model/news.dart';
import 'detail.dart';
import 'dart:convert';

class HomeView extends StatefulWidget {

  createState() {
    return HomeViewState();
  }

}

class HomeViewState extends State<HomeView> {

  List<News> _newsList;

  @override
  initState() {
    _newsList = List<News>();
    _loadAsset().then((value) => {
      setState(() {
        _newsList = value;
      }),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'O GLOBO',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 43, 115, 163),
      ),
      body: loadContent(),
    );
  }    

  // Load listview content
  loadContent() {
    return Container(
      child: ListView.builder(
        itemCount: _newsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsView(news: _newsList[index])),
              );
            },
            child: buildItemByIndex(index),
          );
        },
      ),
    );
  }

  // Build list item according cell index.
  buildItemByIndex(int index) {

    var news = _newsList[index];

    if (index == 0) {
      return buildHeader(news);
    } else {
      return buildCell(news);
    }
  }

  // Build and load list header cell from news object.
  buildHeader(News news) {
    return Stack(
      children: <Widget>[
        Image.network(
          news.images[0].url
        ),
        Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  news.section.name.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black,
                  ),
                ),
                Container(
                  color: Color.fromARGB(40, 0, 0, 0),
                  margin: EdgeInsets.only(top:10.0),
                  padding: EdgeInsets.only(
                    bottom: 10.0,
                    top: 8.0,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Text(
                    news.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,                    
                    ),  
                  ),
                ),
              ],
            ),
        ),
      ],
    );
  }

  // Build and load cells with thumbnail and headline from news object.
  buildCell(News news) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              buildImage(news),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        news.section.name.toUpperCase(),
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 162, 181, 190),                    
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        news.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 31, 55, 90),                    
                        ),
                      ),
                    ],
                  ),
                ),
              ),          
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10.0
            ),
            child: Divider(
              color: Color.fromARGB(255, 61, 61, 61),
              height: 1.0,        
            ),
          ),
        ],
      ),
    );
  }

  // Load local json file that contains news.
  Future<List<News>> _loadAsset() async {

    var _listNews = List<News>();
    var rawJson = await rootBundle.loadString('lib/src/assets/capa.json');
    
    var jsonDecoded = json.decode(rawJson);
    
    for (var i = 0; i < jsonDecoded[0]['conteudos'].length; i++) {
      _listNews.add(new News.fromJson(jsonDecoded[0]['conteudos'][i]));
    }

    return _listNews;
  }

  // Build image widget from image url or placeholder.
  Image buildImage(News news) {

    if (news.images.length == 0) {
      return Image.asset(
        'lib/src/assets/placeholder-image.png',
        width: 120,
        height: 70,
        fit: BoxFit.cover,
      );
    }

    return Image.network(
      news.images[0].url,
      width: 120,
      height: 70,
      fit: BoxFit.cover,
    );
  }

}