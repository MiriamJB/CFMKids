import 'package:cfmkids/screens/settings_page.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class MainPage extends MaterialPageRoute<void> {
  final BuildContext mainContext;
  MainPage(this.mainContext)
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Main Page'),
              actions: <Widget>[
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert),
                  onSelected: (value) => handleClick(value, mainContext),
                  itemBuilder: (BuildContext context) {
                    return {'Logout', 'Settings', 'Print'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                  offset: const Offset(0, 40),
                ),
              ],
            ),
            body: const HomeScreen(),
          );
        });
}

void handleClick(String value, BuildContext mainContext) {
  switch (value) {
    case 'Logout':
      Navigator.of(mainContext)
          .push(MaterialPageRoute(builder: (_) => const LoginPage()));
      break;
    case 'Settings':
      Navigator.push(mainContext, MainPage(mainContext));
      break;
    case 'Print':
      break;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _selectedGridIndex = 0;

  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void onGridTapped(int index) {
    setState(() {
      _selectedGridIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(icon: Icon(Icons.share), label: 'Share'),
            NavigationDestination(
                icon: Icon(Icons.notifications), label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          //backgroundColor: Colors.transparent,
        ),
        //this body section contains all the pages that the navbar will toggle between
        body: <Widget>[
          //homepage
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              children: List.generate(6, (index) {
                return InkWell(
                  onTap: () {
                    onGridTapped(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: index == _selectedGridIndex
                          ? Colors.lightBlue
                          : Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Center(
                      child: Text(months[index]),
                    ),
                  ),
                );
              }),
            ),
          ),
          Container(
              //search
              ),
          Container(
              //share
              ),
          Container(
              //notifications
              ),
          const SettingsPage(),
        ][_selectedIndex]);
  }
}
