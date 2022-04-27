import 'package:first_project/presentations/screens/rick_andMorty_all_persons.dart';
import 'package:flutter/material.dart';
import 'package:first_project/presentations/screens/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_tasks_page.dart';
import 'auth.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = true;
    // return BlocConsumer<AuthBloc, AuthState>(
    //   listener: (context, state) {
    //     if (state is UnAuthenticated) {
    //       Navigator.of(context).pushAndRemoveUntil(
    //           MaterialPageRoute(builder: (context) => const AuthorizationPage()),
    //               (Route<dynamic> route) => false);
    //     }
    //   },
    //   buildWhen: ((previous, current) {
    //     if (current is UnAuthenticated) {
    //       return false;
    //     }
    //     return true;
    //   }),
    //   builder: (context, state) {
    //     if (state is Authenticated) {
    //       return PageView(
    //         children: const [
    //           HomePage(),
    //           AllTasksPage(),
    //           AllPersonsPage(),
    //         ],
    //       );
    //     } else {
    //       return const AuthorizationPage();
    //     }
    //   },
    // );

    return isLoggedIn ?
    PageView(
      children: const [
        HomePage(),
        AllTasksPage(),
        AllPersonsPage(),
      ],
    )
        : AuthorizationPage();


    // PageController pageController = PageController();
    // return Scaffold(
    //   extendBody: true,
    //   body: PageView(
    //       controller: pageController,
    //       children: const <Widget>[
    //         HomePage(),
    //         AllTasksPage(),
    //         AllPersonsPage(),
    //       ],
    //     ),
    //   bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    //     BottomNavigationBarItem(icon: Icon(Icons.add_task), label: 'All tasks'),
    //     BottomNavigationBarItem(icon: Icon(Icons.import_contacts), label: 'Rick and Morty'),
    //   ],
    //   currentIndex: 0,
    //   type: BottomNavigationBarType.fixed,
    //   backgroundColor: const Color.fromRGBO(47, 46, 46, 0.2235294117647059),
    //   unselectedItemColor: Colors.white,
    //   ),
    // );
  }
}