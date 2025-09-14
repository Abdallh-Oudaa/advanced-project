class ApiConstants {
  static const String apiBaseUrl = "https://vcare.integration25.com/api/";

  static const String login = "auth/login";
  static const String signUp = "auth/register";
}

/// Response messages
class ResponseMessage {
  static const String noContent = "No Content";
  static const String badRequest = "Bad request, try again later.";
  static const String forbidden = "Forbidden request.";
  static const String unauthorized = "Unauthorized request.";
  static const String notFound = "Resource not found.";
  static const String internalServerError = "Internal server error.";

  static const String connectTimeout = "Connection timeout.";
  static const String cancel = "Request cancelled.";
  static const String receiveTimeout = "Receive timeout.";
  static const String sendTimeout = "Send timeout.";
  static const String cacheError = "Cache error occurred.";
  static const String noInternetConnection = "No internet connection.";
  static const String unknown = "An unexpected error occurred.";
}
