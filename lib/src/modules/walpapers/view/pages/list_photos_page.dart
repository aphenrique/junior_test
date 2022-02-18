import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/events/photos_event.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/photos_bloc.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/states/photos_state.dart';
import 'package:fteam_test/src/modules/walpapers/view/components/per_page_slide_component.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/stores/page_params_store.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/custom_photo_grid_view_widget.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/custom_search_bar_widget.dart';

class ListPhotosPage extends StatefulWidget {
  const ListPhotosPage({Key? key}) : super(key: key);

  @override
  State<ListPhotosPage> createState() => _ListPhotosPageState();
}

class _ListPhotosPageState extends State<ListPhotosPage> {
  final photosBloc = Modular.get<PhotosBloc>();
  final pageParams = Modular.get<PageParamsStore>();

  @override
  void initState() {
    super.initState();
    photosBloc.add(
      FetchPhotosEvent(
        apiPage: pageParams.apiPage,
        perPage: pageParams.perPage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Wallpaper',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
            letterSpacing: 2.0,
          ),
        ),
        actions: const [
          PerPageSlideComponent(),
        ],
        bottom: CustomSerchBarWidget(),
      ),
      body: Column(
        children: [
          Row(),
          const Placeholder(
            color: Colors.red,
            fallbackHeight: 40,
          ),
          Expanded(
            child: BlocBuilder<PhotosBloc, PhotosState>(
              bloc: photosBloc,
              builder: (context, state) {
                if (state is FetchPhotosError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          photosBloc.add(
                            FetchPhotosEvent(
                              query: pageParams.query,
                              apiPage: pageParams.apiPage,
                              perPage: pageParams.perPage,
                            ),
                          );
                        },
                        child: const Text('Tentar novamente'),
                      ),
                    ],
                  );
                }

                if (state is FetchPhotosSucess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {
                          pageParams.incrementApiPage();

                          photosBloc.add(
                            FetchPhotosEvent(
                              query: pageParams.query,
                              apiPage: pageParams.apiPage,
                              perPage: pageParams.perPage,
                            ),
                          );
                          return true;
                        }

                        return false;
                      },
                      child: CustomPhotoGridViewWidget(photos: state.photos),
                    ),
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
