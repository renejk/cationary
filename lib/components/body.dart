import 'package:cationary/components/card_cat.dart';
import 'package:cationary/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context);
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: homeViewModel.cats.map((e) => CardCatWidget(cat: e)).toList(),
      ),
    );
  }
}
