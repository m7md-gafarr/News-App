import 'package:dio/dio.dart';
import 'package:news/models/Article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);

  Future<List<Article_model>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=50b26d99e7d349e6a83eb586171118a5&category=$category',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      List<Article_model> articleList = [];

      for (var article in articles) {
        Article_model articleModel = Article_model.fromJson(articles);
        articleList.add(articleModel);
      }
      return articleList;
    } catch (e) {
      return [];
    }
  }
}
