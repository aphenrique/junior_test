import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/events/photos_event.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/fetch_photos_bloc.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/states/fetch_photos_state.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/custom_photo_grid_view_widget.dart';
import 'package:fteam_test/src/modules/walpapers/view/widgets/custom_search_bar_widget.dart';

class ListPhotosPage extends StatefulWidget {
  const ListPhotosPage({Key? key}) : super(key: key);

  @override
  State<ListPhotosPage> createState() => _ListPhotosPageState();
}

class _ListPhotosPageState extends State<ListPhotosPage> {
  final fetchPhotosBloc = Modular.get<FetchPhotosBloc>();

  int apiPage = 1;
  int perPage = 10;

  @override
  void initState() {
    super.initState();
    fetchPhotosBloc.add(FetchPhotosEvent(apiPage: apiPage, perPage: perPage));
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
        bottom: const CustomSerchBarWidget(),
      ),
      body: Column(
        children: [
          const Placeholder(
            color: Colors.red,
            fallbackHeight: 40,
          ),
          Expanded(
            child: BlocBuilder<FetchPhotosBloc, FetchPhotosState>(
              bloc: fetchPhotosBloc,
              builder: (context, state) {
                if (state is FetchPhotosError) {
                  return Center(
                    child: Text(state.message),
                  );
                }

                if (state is FetchPhotosSucess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        if (notification.metrics.pixels ==
                            notification.metrics.maxScrollExtent) {
                          fetchPhotosBloc.add(FetchPhotosEvent(
                              apiPage: apiPage++, perPage: perPage));
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
