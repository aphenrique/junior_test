import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';
import 'package:fteam_test/src/modules/walpapers/view/stores/per_page_store.dart';

class PerPageSlideComponent extends StatefulWidget {
  const PerPageSlideComponent({Key? key}) : super(key: key);

  @override
  _PerPageSlideComponentState createState() => _PerPageSlideComponentState();
}

class _PerPageSlideComponentState extends State<PerPageSlideComponent> {
  final perPage = Modular.get<PerPageStore>();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      elevation: 4,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      icon: const Icon(Icons.grid_view_rounded),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: ValueListenableBuilder<int>(
              valueListenable: perPage,
              builder: (context, value, child) => Column(
                children: [
                  Text(
                    '$value fotos por página',
                    style: const TextStyle(
                        color: AppColors.customColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    min: 4,
                    max: 20,
                    divisions: 8,
                    value: value.toDouble(),
                    onChanged: (double value) {
                      perPage.setPerPage(value.toInt());
                    },
                  ),
                ],
              ),
            ),
          )
        ];
      },
    );
  }
}
