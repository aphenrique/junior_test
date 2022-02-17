abstract class HttpService {
  Future<Map<String, dynamic>> get(String url);
  Future<Map<String, dynamic>> download(String url);
}
