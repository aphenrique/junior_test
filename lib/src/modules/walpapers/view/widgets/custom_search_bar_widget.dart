import 'package:flutter/material.dart';
import 'package:fteam_test/src/core/colors/app_colors.dart';

class CustomSerchBarWidget extends StatelessWidget implements PreferredSize {
  const CustomSerchBarWidget({Key? key}) : super(key: key);

  @override
  Widget get child => Container();

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      height: 80,
      child: TextField(
        cursorColor: AppColors.searchFieldColor,
        style: const TextStyle(
          color: AppColors.searchFieldColor,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.searchFieldColor,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: AppColors.searchFieldColor),
          fillColor: AppColors.backgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
