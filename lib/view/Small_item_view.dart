import 'package:flutter/material.dart';
import '../models/Small_item_model.dart';
import '../widgets/Small_Item.dart';

class Small_item_view extends StatelessWidget {
  Small_item_view({super.key});
  final List<Small_item_model> SIIM = [
    const Small_item_model(
      text: "Business",
      path_image: "assets/images/busines.jpg",
    ),
    const Small_item_model(
      text: "Sports",
      path_image: "assets/images/soprts.jpg",
    ),
    const Small_item_model(
      text: "Technology",
      path_image: "assets/images/technology.jpg",
    ),
    const Small_item_model(
      text: "Health",
      path_image: "assets/images/health.jpg",
    ),
    const Small_item_model(
      text: "Science",
      path_image: "assets/images/busines.jpg",
    ),
    const Small_item_model(
      text: "Entertainment",
      path_image: "assets/images/busines.jpg",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: SIIM.length,
        itemBuilder: (context, index) {
          return Small_Item(SIM: SIIM[index]);
        },
      ),
    );
  }
}
