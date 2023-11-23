import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_page/layout/squareFeed.dart';
import 'package:profile_page/shared/cubit/states.dart';
import '../../layout/squareHis.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void ChangeBottomNavBar(int index) {
    currentIndex = index;
    emit(AppBottomNavBarChangeState());
  }

  Widget ChangeBottomBody() {
    if (currentIndex == 0) {
      return const Column(
        children: [
          Text("Inforamtion"),
        ],
      );
    } else if (currentIndex == 1) {
      return ListView.separated(
          itemBuilder: (context, index) => SquareFeed(),
          separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Container(
                  width: double.infinity,
                  color: Colors.deepOrange[500],
                  height: 1,
                ),
              ),
          itemCount: 10);
    } else {
      return ListView.separated(
        itemBuilder: (context, index) => SquareHis(),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Container(
            width: double.infinity,
            color: Colors.deepOrange[500],
            height: 1,
          ),
        ),
        itemCount: 10,
      );
    }
  }
}
