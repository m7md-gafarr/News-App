import 'package:flutter/material.dart';
import 'package:news/models/Article_model.dart';

class Big_item extends StatelessWidget {
  const Big_item({super.key, required this.article_model});

  final Article_model article_model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(7.0)),
            image: DecorationImage(
              image: NetworkImage(article_model.image ??
                  "https://images.pexels.com/photos/2882552/pexels-photo-2882552.jpeg?auto=compress&cs=tinysrgb&w=600"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          article_model.title ?? "Aya Elamroussi, Brian Todd, Aaron Cooper",
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Text(
          article_model.subtitle ?? "Aya Elamroussi, Brian Todd, Aaron Cooper",
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
