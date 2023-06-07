import 'package:youdeyiwu_app/model/response/data_response.dart';

/// CustomException
class CustomException implements Exception {
  final int status;
  final String message;
  late final DataResponse details;

  CustomException({
    DataResponse? details,
    this.status = 500,
    this.message = "Internal server error",
  }) : details = details ?? DataResponse(status: status, message: message);

  CustomException.withDataResponse(DataResponse dataResponse)
      : details = dataResponse,
        status = dataResponse.status,
        message = dataResponse.message;

  CustomException.withDefaults({
    int? status,
    String? message,
  })  : details = DataResponse(
            status: status ?? 500, message: message ?? "Internal server error"),
        status = status ?? 500,
        message = message ?? 'Internal server error';

  factory CustomException.unknownError() {
    return CustomException(
      status: 500,
      message: 'Unknown error',
    );
  }

  factory CustomException.internalServerError() {
    return CustomException(
      status: 500,
      message: 'Internal server error',
    );
  }

  factory CustomException.notFound() {
    return CustomException(
      status: 404,
      message: 'Not found',
    );
  }

  @override
  String toString() {
    return 'CustomException: $status - $message';
  }
}
