import 'package:flutter/material.dart';
import 'package:kitobix/presentation/app_routes.dart';
import 'package:kitobix/presentation/tab_box/home/widgets/book_item_view.dart';
import 'package:kitobix/presentation/tab_box/home/widgets/see_all_item.dart';
import 'package:kitobix/presentation/widgets/buttons/custom_icon_button.dart';
import 'package:kitobix/utils/icons/app_icons.dart';
import 'package:kitobix/utils/size/size_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          width: 165,
          child: Image.asset(AppIcons.audioBooks),
        ),
        actions: [
          CustomIconButton(
            onTap: () {
              Navigator.pushNamed(context, RouteNames.addBookScreen);
            },
            icon: AppIcons.plus,
          ),
          20.pw,
        ],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        spacing: 16,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SeeAllItem(onTap: () {}, title: "Yangi qo'shilganlar"),
                    GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.65),
                      children: List.generate(
                        10,
                        (index) {
                          return BookItemView(
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
