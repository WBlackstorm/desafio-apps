import 'package:flutter_test/flutter_test.dart';
import 'package:project/src/model/news.dart';
import 'dart:convert';

void main() {
  group('fromJson content tests', () {
    test('Test using an empty json', () {

      var rawJson = '{}';
      
      var newsObject = json.decode(rawJson);
      
      expect(News, News.fromJson(newsObject).runtimeType);

    });

    test('Test if authors not exist', () {
      
      var rawJson = '{"autores":[]}';

      var newsObject = json.decode(rawJson);

      expect(0, News.fromJson(newsObject).authors.length);

    });

    test('Test if has just one author', () {
      
      var rawJson = '{"autores":["João Silveira dos Santos"]}';

      var newsObject = json.decode(rawJson);

      expect(1, News.fromJson(newsObject).authors.length);

    });

    test('Test if has more than author', () {
      
      var rawJson = '{"autores":["João Silveira dos Santos", "Lia Conobre"]}';

      var newsObject = json.decode(rawJson);

      expect(2, News.fromJson(newsObject).authors.length);

    });

    test('Test if has no subtitle', () {
      
      var rawJson = '{}';

      var newsObject = json.decode(rawJson);

      expect(null, News.fromJson(newsObject).subTitle);

    });

    test('Test if has subtitle', () {
      
      var rawJson = '{"subTitulo": "Teste"}';

      var newsObject = json.decode(rawJson);

      expect("Teste", News.fromJson(newsObject).subTitle);

    });

    test('Test if has no title', () {
      
      var rawJson = '{}';

      var newsObject = json.decode(rawJson);

      expect(null, News.fromJson(newsObject).title);

    });

    test('Test if has title', () {
      
      var rawJson = '{"titulo": "Teste"}';

      var newsObject = json.decode(rawJson);

      expect("Teste", News.fromJson(newsObject).title);

    });

    test('Test if has no news content', () {
      
      var rawJson = '{}';

      var newsObject = json.decode(rawJson);

      expect(null, News.fromJson(newsObject).text);

    });

    test('Test if has news content', () {
      
      var rawJson = '{"texto": "Teste"}';

      var newsObject = json.decode(rawJson);

      expect('Teste', News.fromJson(newsObject).text);

    });

    test('Test if has no publish date', () {
      
      var rawJson = '{}';

      var newsObject = json.decode(rawJson);

      expect(null, News.fromJson(newsObject).publishedAt);

    });

    test('Test if has publish date', () {
      
      var rawJson = '{"publicadoEm": "2019-08-21T08:00:00"}';

      var newsObject = json.decode(rawJson);

      expect("2019-08-21T08:00:00", News.fromJson(newsObject).publishedAt);

    });

    test('Test if image url is correct', () {
      
      var rawJson = '{"imagens":[{ "autor": "Guito", "fonte": "Agência O Globo", "legenda": "", "url": "https://ogimg.infoglobo.com.br/in/20620804-669-05e/FT1086A/cabral-preso.jpg"}]}';

      var newsObject = json.decode(rawJson);

      expect(true, News.fromJson(newsObject).images[0].url.contains("https://"));

    });

    test('Test if image array is empty', () {
      
      var rawJson = '{"imagens":[]}';

      var newsObject = json.decode(rawJson);

      expect(0, News.fromJson(newsObject).images.length);

    });

    test('Test if image array is not empty', () {
      
      var rawJson = '{"imagens":[{ "autor": "Guito", "fonte": "Agência O Globo", "legenda": "", "url": "https://ogimg.infoglobo.com.br/in/20620804-669-05e/FT1086A/cabral-preso.jpg"}]}';

      var newsObject = json.decode(rawJson);

      expect(1, News.fromJson(newsObject).images.length);

    }); 

  });
}