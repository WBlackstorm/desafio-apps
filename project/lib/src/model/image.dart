class Image {
  String _author;
  String _source;
  String _description;
  String _url;

  String get author {
    return _author;
  }

  String get source {
    return _source;
  }

  String get description {
    return _description;
  }

  String get url {
    return _url;
  }

  Image.fromJson(Map<String, dynamic> jsonDecoded) {
    _author = jsonDecoded['autor']; 
    _source =  jsonDecoded['fonte'];
    _description = jsonDecoded['legenda'];     
    _url = jsonDecoded['url'];
  }

}