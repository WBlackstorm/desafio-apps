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

  Image(this._author, this._source, this._description, this._url);

}