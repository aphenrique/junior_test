import 'package:fteam_test/environment_config.dart';
import 'package:fteam_test/src/core/utils/connection_verifier/connection_verifier.dart';
import 'package:fteam_test/src/modules/walpapers/domain/erros/photo_exception.dart';
import 'package:fteam_test/src/modules/walpapers/external/http_service.dart';
import 'package:uno/uno.dart';

class UnoService implements HttpService {
  final Uno uno = Uno(
      baseURL: 'https://api.pexels.com/v1/',
      headers: {'Authorization': EnvironmentConfig.apiToken});

  @override
  Future<Map<String, dynamic>> get(String url) async {
    if (await ConnectionVerifier.isOnline()) {
      final result = await uno.get(url);

      return result.data;
    } else {
      throw LostInternetConnection('Falhas na conexão');
    }
  }

  @override
  Future<Map<String, dynamic>> download(String url) async {
    if (await ConnectionVerifier.isOnline()) {
      final result = await uno.get(
        url,
        responseType: ResponseType.arraybuffer,
      );

      return result.data;
    } else {
      throw LostInternetConnection('Falhas na conexão');
    }
  }
}
