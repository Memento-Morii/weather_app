class HttpConfig {
  static const String mainDomainName = "api.estota.app";
  static String apiBaseUrl = "https://api.weatherapi.com/v1/";
  static const int defaultConnectionTimeOut = 10 * 1000; //30 sec
  static const int longConnectionTimeOut = 60 * 1000; //60 sec

  static const int defaultReceiveTimeOut = 10 * 1000; //30 sec
  static const int longReceiveTimeOut = 60 * 1000; //60 sec
}
