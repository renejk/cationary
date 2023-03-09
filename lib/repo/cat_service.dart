import 'package:cationary/models/cat_model.dart';
import 'package:cationary/models/response_model.dart';
import 'package:cationary/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatService {
  Future<Object> getCats() async {
    try {
      final url = Uri.parse(AppConstants.URL_BREEDS);
      final response = await http.get(url, headers: {
        'x-api-key': AppConstants.API_KEY,
      });
      if (response.statusCode == AppConstants.SUCCESS_CODE) {
        return SuccessResponseModel(
          response: catFromJson(response.body),
          code: response.statusCode,
        );
      }
      return FailureResponseModel(
        errorResponse: json.decode(response.body),
        code: response.statusCode,
      );
    } catch (e) {
      return FailureResponseModel(
        errorResponse: e.toString(),
        code: AppConstants.UKNOW_CODE,
      );
    }
  }

  Future<Object> getImageCat(String id) async {
    try {
      final url = Uri.parse('${AppConstants.URL_IMAGES}/$id');
      final response = await http.get(url, headers: {
        'x-api-key': AppConstants.API_KEY,
      });
      print('response: ${response.body}');
      if (response.statusCode == AppConstants.SUCCESS_CODE) {
        return SuccessResponseModel(
          response: json.decode(response.body),
          code: response.statusCode,
        );
      }
      return FailureResponseModel(
        errorResponse: json.decode(response.body),
        code: response.statusCode,
      );
    } catch (e) {
      return FailureResponseModel(
        errorResponse: e.toString(),
        code: AppConstants.UKNOW_CODE,
      );
    }
  }
}
