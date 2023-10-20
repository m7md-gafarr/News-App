import 'package:flutter/material.dart';
import 'package:news/models/Article_model.dart';
import '../widgets/Big_item.dart';

class Big_item_view extends StatelessWidget {
  final List<Article_model> artical;
  const Big_item_view({super.key, required this.artical});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: artical.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Big_item(
              article_model: artical[index],
            ),
          );
        },
      ),
    );
  }
}
