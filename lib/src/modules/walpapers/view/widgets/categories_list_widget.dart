import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/events/photos_event.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/photos_bloc.dart';
import 'package:fteam_test/src/modules/walpapers/view/blocs/stores/page_params_store.dart';

class CategoriesListWidget extends StatelessWidget {
  final String term;

  CategoriesListWidget({
    Key? key,
    required this.term,
  }) : super(key: key);

  final photosBloc = Modular.get<PhotosBloc>();
  final pageParams = Modular.get<PageParamsStore>();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        pageParams.resetApiPage();
        pageParams.resetQuery();

        pageParams.setQuery(term);

        photosBloc.add(
          FetchPhotosEvent(
            query: pageParams.query,
            apiPage: pageParams.apiPage,
            perPage: pageParams.perPage,
          ),
        );
      },
      child: Text(
        term,
        style: const TextStyle(color: AppColors.searchFieldColor),
      ),
    );
  }
}
