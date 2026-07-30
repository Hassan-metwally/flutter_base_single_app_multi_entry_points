part of core;

class ApiConstants {
  const ApiConstants._();

  // static const String apiBaseUrl = "https://backend.azahmni.moltaqadev.com";
  static const String apiBaseUrl = "https://backend.azhmny.com/";

  static String clientApi(String url) => "/client-api/v1/$url";
  static String providerApi(String url) => "/store-api/v1/$url";
  static String sharedApi(String url) => "/shared-api/v1/$url";

  static String flavorApi(String url) {
    if (CurrentAppRole.isClient) {
      return clientApi(url);
    } else if (CurrentAppRole.isProvider) {
      return providerApi(url);
    }
    throw Exception('Invalid app environment or provider role');
  }

  static String apiKey =
      "eyJpdiI6IjF3cUZNaEs1NVh3RUZNdlVJTDk3Y2c9PSIsInZhbHVlIjoiQzlndGhNSUVZeTRVUmwvZnR3WGZuaDNaTUxObVZ6RXBNbmFITkRKWUtsTDFXUUIrQkkxMzkvWG9KTDc1K2Z0NiIsIm1hYyI6IjNkNWVlYWI5NjBmMGYxZWU5YzIzYWQzZjk1YjRjMDA3NWFhMDVkMmU3NmExM2ExYzBmM2ExYzNhNmEwOTU4N2IiLCJ0YWciOiIifQ==";

  static const bool isDebug = kDebugMode;
  static const bool canLog = true;
}
