import 'package:cationary/components/data_detail.dart';
import 'package:cationary/components/header.dart';
import 'package:cationary/components/image.dart';
import 'package:cationary/models/cat_model.dart';
import 'package:cationary/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailCatScreen extends StatelessWidget {
  const DetailCatScreen({super.key, required this.cat});

  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              HeaderWidget(title: cat.name!, isback: true),
              ImageWidget(cat: cat, isBig: true),
              SizedBox(
                  height: MediaQuery.of(context).size.height *
                      AppConstants.NEW_LINE),
              Expanded(child: DataDetailWidget(cat: cat))
            ],
          ),
        ),
      ),
    );
  }
}
