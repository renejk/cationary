import 'dart:collection';

import 'package:cationary/models/cat_model.dart';
import 'package:cationary/models/response_model.dart';
import 'package:cationary/repo/cat_service.dart';
import 'package:cationary/views/detail_cat.dart';
import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  // variables
  bool _isLoading = false;
  String _searchText = '';
  List<Cat> _cats = [];
  FailureResponseModel? _errorResponse;
  final TextEditingController _searchController = TextEditingController();

  // getters
  bool get isLoading => _isLoading;
  FailureResponseModel? get errorResponse => _errorResponse;
  TextEditingController get searchController => _searchController;
  UnmodifiableListView<Cat> get cats => _searchText.isEmpty
      ? UnmodifiableListView(_cats)
      : UnmodifiableListView(_cats
          .where((element) =>
              element.name!.toLowerCase().contains(_searchText.toLowerCase()))
          .toList());

  // constructor
  HomeViewModel() {
    getCats();
  }

  // setters
  // set loading
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  // set list of cats
  setCats(List<Cat> value) {
    _cats = value;
    notifyListeners();
  }

  // set error
  setError(FailureResponseModel value) {
    _errorResponse = value;
    notifyListeners();
  }

  // methods
  // get list of cats from api
  getCats() async {
    setLoading(true);
    final response = await CatService().getCats();
    if (response is SuccessResponseModel) {
      setCats(response.response as List<Cat>);
    }
    if (response is FailureResponseModel) {
      setError(response);
    }
    setLoading(false);
  }

  // search cats by name
  searchCats(String value) {
    _searchText = value;
    notifyListeners();
  }

  // clear search
  clearSearch() {
    _searchText = '';
    _searchController.clear();
    notifyListeners();
  }

  Future getUrlPrincipalImage(String? id) async {
    if (id != null) {
      final response = await CatService().getImageCat(id);
      if (response is SuccessResponseModel) {
        return response.response as Map;
      }
      return '';
    }
  }

  toDetail(Cat cat, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailCatScreen(cat: cat)),
    );
  }
}
