import 'package:bottom_nav_bar_with_cubit/cubit/navigationbar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationBarCubit extends Cubit<NavigationBarState> {
  NavigationBarCubit() : super(const NavigationBarState());

  onTapChanged(BottomMenu index) {//1


    ///
    emit(state.copyWith(menu: index));//1
  }
}
