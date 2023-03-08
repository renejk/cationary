import 'package:cationary/models/cat_model.dart';
import 'package:cationary/models/response_model.dart';
import 'package:cationary/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CatService {
  Future<Object> getCats() async {
    try {
      final url = Uri.parse(URL_BREEDS);
      final response = await http.get(url, headers: {
        'x-api-key': API_KEY,
      });
      if (response.statusCode == SUCCESS_CODE) {
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
        code: UKNOW_CODE,
      );
    }
  }
}
