import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news/models/Article_model.dart';
import 'package:news/services/news_service.dart';
import 'package:news/view/Big_item_view.dart';

class SmallItemViewAllGatrgroy extends StatelessWidget {
  const SmallItemViewAllGatrgroy({super.key, required this.category});
  final String category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SmallItemGategory(
                category: category,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SmallItemGategory extends StatefulWidget {
  const SmallItemGategory({
    super.key,
    required this.category,
  });
  final String category;
  @override
  State<SmallItemGategory> createState() => _SmallItemGategoryState();
}

class _SmallItemGategoryState extends State<SmallItemGategory> {
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getNews(category: widget.category);
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
