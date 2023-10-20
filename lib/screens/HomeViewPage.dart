import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/view/Small_item_view.dart';
import '../models/Article_model.dart';
import '../services/news_service.dart';
import '../view/Big_item_view.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: const TextSpan(
              text: "News",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xff24242c),
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Cloud",
                  style: TextStyle(
                    color: Color(0xffe2b958),
                  ),
                )
              ]),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              sliver: SliverToBoxAdapter(child: Small_item_view())),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          const NewsListViewBuilder(
            category: "general",
          ),
        ],
      ),
    );
  }
}

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;

  final connectivityResult = (Connectivity().checkConnectivity());
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: "general");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Article_model>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Big_item_view(
            artical: snapshot.data!,
          );
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
                child: Text(
              "OOPS there was error, try later",
            )),
          );
        } else {
          return const SliverToBoxAdapter(
              child: SizedBox(
            height: 450,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ));
        }
      },
    );
  }
}
