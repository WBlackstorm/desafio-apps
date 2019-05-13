import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../model/news.dart';
 import 'dart:convert';

class HomeView extends StatefulWidget {

  createState() {
    return HomeViewState();
  }

}

class HomeViewState extends State<HomeView> {

  List<News> _newsList;

  initState() {
    _newsList = List<News>();
    _loadAsset().then((value) => {
      setState(() {
        _newsList = value;
      }),
    });
  }

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

  loadContent() {
    return Container(
      child: ListView.builder(
        itemCount: _newsList.length,
        itemBuilder: (BuildContext context, int index) {
          return buildItemByIndex(index);
        },
      ),
    );
  }

  buildItemByIndex(int index) {

    var news = _newsList[index];

    if (index == 0) {
      return buildHeader(news);
    } else {
      return buildCell(news);
    }
  }

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

  buildCell(News news) {
    return Container(
      color: Colors.teal,
      child: Row (
        children: <Widget>[
          buildImage(news),
          Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                news.section.name,
                softWrap: false,
              ),
              Text(
                news.title,
                softWrap: false,
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<List<News>> _loadAsset() async {

    var _listNews = List<News>();
    var json = await rootBundle.loadString('lib/src/assets/capa.json');
    
    var jsonDecoded = jsonDecode(json);
    
    for (var i = 0; i < jsonDecoded[0]['conteudos'].length; i++) {
      _listNews.add(new News.fromJson(jsonDecoded[0]['conteudos'][i]));
    }

    return _listNews;
  }

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