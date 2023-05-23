import 'package:bottom_nav_bar_with_cubit/cubit/navigationbar_cubit.dart';
import 'package:bottom_nav_bar_with_cubit/cubit/navigationbar_state.dart';
import 'package:bottom_nav_bar_with_cubit/pages/basket_page.dart';
import 'package:bottom_nav_bar_with_cubit/pages/home_page.dart';
import 'package:bottom_nav_bar_with_cubit/pages/order_page.dart';
import 'package:bottom_nav_bar_with_cubit/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Theme"
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              inputFormatters: [
                MaskTextInputFormatter(
                  mask:"+998(##)###-##-##",
                  filter:{"#":RegExp(r'[0-9]')},
                  type:MaskAutoCompletionType.lazy,
                )
              ],
            )
          ],
        ),
      ),
      // body: BlocBuilder<NavigationBarCubit,NavigationBarState>(
      //   builder: (context,state) {
      //     return  IndexedStack(
      //       index: state.menu.index,//1
      //       children: const [
      //         HomePage(),
      //         BasketPage(),
      //         OrderPage(),
      //         ProfilePage(),
      //       ],
      //     );
      //   }
      // ),
      bottomNavigationBar: BlocBuilder<NavigationBarCubit, NavigationBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.menu.index,
              onTap: (index) =>changeTap(index),

              items: const [
                BottomNavigationBarItem(
                  backgroundColor: Colors.red,
                  label: "home",

                  icon: Icon(
                    Icons.home_outlined,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "basket",

                  icon: Icon(
                    Icons.card_travel,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "order",
                  icon: Icon(
                    Icons.satellite_alt,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "profile",

                  icon: Icon(
                    Icons.person,
                  ),
                ),
              ],
            );
          }
      ),
    );
  }

  void changeTap(int index) {
    if (index == context
        .read<NavigationBarCubit>()
        .state
        .menu
        .index) return;

    context
        .read<NavigationBarCubit>().onTapChanged(BottomMenu.values[index]);
  }
}
