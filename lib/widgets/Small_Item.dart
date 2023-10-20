import 'package:flutter/material.dart';
import 'package:news/models/Small_item_model.dart';

import '../screens/SmallItemViewAllGatrgroy.dart';

class Small_Item extends StatelessWidget {
  Small_Item({super.key, required this.SIM});
  Small_item_model SIM;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return SmallItemViewAllGatrgroy(
                category: SIM.text,
              );
            },
          ));
        },
        child: Container(
          height: 120,
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(7),
            image: DecorationImage(
              image: AssetImage(SIM.path_image),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
              child: Text(
            SIM.text,
            style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 25, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
