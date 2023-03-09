import 'package:cationary/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = Provider.of<HomeViewModel>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: homeViewModel.searchController,
              onChanged: ((value) => homeViewModel.searchCats(value)),
              decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
              onPressed: () => homeViewModel.clearSearch(),
              icon: const Icon(Icons.close))
        ],
      ),
    );
  }
}
