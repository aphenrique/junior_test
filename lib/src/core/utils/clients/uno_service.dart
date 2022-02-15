import 'package:fteam_test/environment_config.dart';
import 'package:fteam_test/src/modules/walpapers/external/http_service.dart';
import 'package:uno/uno.dart';

class UnoService implements HttpService {
  final Uno uno = Uno(
      baseURL: 'https://api.pexels.com/v1/',
      headers: {'Authorization': EnvironmentConfig.apiToken});

  @override
  Future<Map<String, dynamic>> get(String url) async {
    final result = await uno.get(url);

    return result.data;
  }
}
