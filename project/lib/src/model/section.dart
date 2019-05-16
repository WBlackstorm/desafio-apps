class Section {
  String _name;
  String _url;

  String get name {
    return _name;
  }

  String get url {
    return _url;
  }

  Section.fromJson(Map<String, dynamic> jsonDecoded) {

    if (jsonDecoded['secao'] == null) {
      return;
    }

    _name = jsonDecoded['secao']['nome'];
    _url = jsonDecoded['secao']['url'];
    
  }

}