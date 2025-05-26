import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitobix/cubits/tab/tab_cubit.dart';
import 'package:kitobix/presentation/tab_box/home/home_screen.dart';
import 'package:kitobix/presentation/tab_box/library/library_screen.dart';
import 'package:kitobix/presentation/tab_box/search/search_screen.dart';
import 'package:kitobix/utils/colors/app_colors.dart';
import 'package:kitobix/utils/icons/app_icons.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  static List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const HomeScreen(),
      const SearchScreen(),
      const LibraryScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: context.watch<TabCubit>().state,
        children: screens,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontFamily: "Urbanist",
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
            height: 12 / 10,
          ),
          unselectedLabelStyle: const TextStyle(
            fontFamily: "Urbanist",
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.c_500,
            height: 12 / 10,
          ),
          items: <BottomNavigationBarItem>[
            _getItem(icon: AppIcons.home, label: 'Asosiy'),
            _getItem(icon: AppIcons.search, label: 'Izlash'),
            _getItem(icon: AppIcons.document, label: 'Kutubxona'),
          ],
          currentIndex: context.watch<TabCubit>().state,
          onTap: context.read<TabCubit>().changeTabIndex,
        ),
      ),
    );
  }

  BottomNavigationBarItem _getItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        AppIcons.getSvg(
          name: icon,
        ),
        colorFilter: const ColorFilter.mode(
          AppColors.primary,
          BlendMode.srcIn,
        ),
      ),
      icon: SvgPicture.asset(
        icon,
        colorFilter: const ColorFilter.mode(
          AppColors.c_500,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}
