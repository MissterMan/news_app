import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/data/models/article.dart';

class ApiService {
  static const String _baseUrl = 'https://newsapi.org/v2/';
  static const String _apiKey = 'de743b9322234183aa80aee0875097c2';
  static const String _category = 'business';
  static const String _country = 'id';

  Future<ArticlesResult> topHeadLines() async {
    final response = await http.get(Uri.parse(
        '${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey'));
    if (response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('failed to load');
    }
  }
}
