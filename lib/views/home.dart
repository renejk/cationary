import 'package:cationary/components/body.dart';
import 'package:cationary/components/header.dart';
import 'package:cationary/components/search.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          HeaderWidget(title: 'Cationary'),
          SearchWidget(),
          BodyWidget()
        ],
      ),
    );
  }
}
