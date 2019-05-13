import 'section.dart';
import 'image.dart';

class News {

  List<String> _authors; 
  bool _isInformation;
  String _subtitle;
  String _text;
  String _updatedAt;
  int _id;
  String _publishedAt;
  Section _section;
  String _type;
  String _title;
  String _url;
  String _originalUrl;
  List<Image> _images;

  List<String> get authors {
    return _authors;
  }

  bool get isInformation {
    return _isInformation;
  }

  String get subTitle {
    return _subtitle;
  }

  String get text {
    return _text;
  }

  String get updatedAt {
    return _updatedAt;
  }

  int get id {
    return _id;
  }

  String get publishedAt {
    return _publishedAt;
  }

  Section get section {
    return _section;
  }

  String get type {
    return _type;
  }

  String get title {
    return _title;
  }

  String get url {
    return _url;
  }

  String get originalUrl {
    return _originalUrl;
  }

  List<Image> get images {
    return _images;
  }

  News.fromJson(dynamic jsonDecoded) {  
    _authors = List<String>();
  
    if (jsonDecoded['autores'] != null) {
      for (var i = 0; i < jsonDecoded['autores'].length; i++) {
        _authors.add(jsonDecoded['autores'][0]);
      }
    }

    _isInformation = jsonDecoded['informePublicitario'];
    _subtitle = jsonDecoded['subTitulo'];
    _text = jsonDecoded['texto'];
    _updatedAt = jsonDecoded['atualizadoEm'];
    _id = jsonDecoded['id'];
    _publishedAt = jsonDecoded['publicadoEm'];
    
    _section = Section(jsonDecoded['secao']['nome'], jsonDecoded['secao']['url']);
    _type = jsonDecoded['tipo'];
    _title = jsonDecoded['titulo'];
    _url = jsonDecoded['url'];
    _originalUrl = jsonDecoded['urlOriginal'];

    _images = List<Image>();
    for (var image in jsonDecoded['imagens']) {
      _images.add(Image(image['autor'], image['fonte'], image['legend'], image['url']));
    }

  }

}