import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile_page/edit.dart';
import 'package:profile_page/shared/cubit/cubit.dart';
import 'package:profile_page/shared/cubit/states.dart';

class Home_Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Profile page"),
              centerTitle: true,
              backgroundColor: Colors.deepOrange,
              actions: [
                IconButton(
                  onPressed: () {Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Edit()));},
                  icon: const Icon(Icons.edit),
                )
              ],
            ),
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtEbTLfMii3TQW5ambR0PD6FlRMPcUFzDy_g&usqp=CAU.jpg'),
                              ),
                            ),
                            Text(
                              "User Name",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(10),
                            ),
                            color: Colors.grey[100],
                          ),
                          child: Column(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.explore),
                                color: Colors.deepOrange,
                                iconSize: 30,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.trending_up_outlined),
                                color: Colors.deepOrange,
                                iconSize: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: cubit.ChangeBottomBody(),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 20,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.ChangeBottomNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Info",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.feedback),
                  label: "Feedback",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.history),
                  label: "History",
                ),
              ],
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
