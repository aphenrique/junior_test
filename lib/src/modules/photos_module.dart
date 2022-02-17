import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/modules/walpapers/data/repositories/photo_repository_impl.dart';
import 'package:fteam_test/src/modules/walpapers/domain/usecases/fetch_photos_usecase.dart';
import 'package:fteam_test/src/modules/walpapers/external/api_photo_datasource.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/photos_bloc.dart';
import 'package:fteam_test/src/modules/walpapers/view/pages/list_photos_page.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/per_page_store.dart';

class PhotosModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ApiPhotoDatasource(i())),
        Bind.singleton((i) => PhotoRepositoryImpl(i())),
        Bind.singleton((i) => FetchPhotosUsecaseImpl(i())),
        Bind.lazySingleton((i) => PhotosBloc(i())),

        // stores
        Bind.singleton((i) => PerPageStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const ListPhotosPage()),
      ];
}
