import 'package:cationary/components/header.dart';
import 'package:cationary/components/search.dart';
import 'package:cationary/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(title: 'Cationary'),
          const SearchWidget(),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: homeViewModel.cats.map((e) => Text(e.name!)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
