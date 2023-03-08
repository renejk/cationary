class SuccessResponseModel {
  final Object response;
  final int code;

  SuccessResponseModel({required this.response, required this.code});
}

class FailureResponseModel {
  final Object errorResponse;
  final int code;

  FailureResponseModel({required this.errorResponse, required this.code});
}
