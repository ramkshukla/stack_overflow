import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stack_overflow/module/home/controller/home_controller.dart';
import 'package:stack_overflow/module/home/controller/home_event.dart';
import 'package:stack_overflow/module/home/controller/home_state.dart';
import 'package:stack_overflow/module/home/view/home.dart';
import 'package:stack_overflow/module/home/view/transaction.dart';

List<Widget> widget = [
  HomeScreen(),
  TransactonUI(),
  Text("Activity"),
  Text("Profile")
];

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: HomeUI(),
    );
  }
}

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 115,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&q=70&fm=webp",
              ),
            ),
            title: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Today Is\n",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextSpan(
                    text: "Fri, 23 July",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )
                ],
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(Icons.notifications)),
            ],
          ),
          body: IndexedStack(
            index: state.selectedIndex,
            children: widget,
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            currentIndex: state.selectedIndex,
            onTap: (int index) {
              context.read<HomeBloc>().add(SelecteIndex(index: index));
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.track_changes),
                label: "Transaction",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.local_activity),
                label: "Activity",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              )
            ],
          ),
        );
      },
    );
  }
}
