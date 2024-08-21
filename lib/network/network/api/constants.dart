class ApiConstants {
  ApiConstants._();
  static String baseUrl = 'https://muta-app.fastgenapp.com/';
  // static String staggingBaseUrl = 'https://baedy.onrender.com/api';

  static String login = 'login';
  static String createAccount = 'create-user';


  // receiveTimeout
  static const Duration receiveTimeout = Duration(milliseconds: 30000);
  // connectTimeout
  static const Duration connectionTimeout = Duration(milliseconds: 30000);
}
