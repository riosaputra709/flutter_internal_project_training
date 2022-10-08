import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/screen/master_paramater_add/master_parameter_add_screen.dart';
import 'package:flutter_internal_project_training/screen/master_parameter/master_parameter_screen.dart';
import 'package:flutter_internal_project_training/screen/sidebar.dart';

import 'helper/locator.dart';
import 'helper/navigator_service.dart';
import 'helper/route_generator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const HomeScreen(),
        navigatorKey: locator<NavigatorService>().navigatorKey,
        onGenerateRoute: (settings) => Routegenerator.generateRoute(settings) ,
    );

  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Widget> _screens = [
    // Content for Home tab
    Container(
      color: Colors.yellow.shade100,
      alignment: Alignment.topLeft,
      child: Dashboard(),
    ),
    // Content for Feed tab
    Container(
      color: Colors.purple.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Home',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Favorites tab
    Container(
      color: Colors.red.shade100,
      alignment: Alignment.center,
      child: const Text(
        'Home',
        style: TextStyle(fontSize: 40),
      ),
    ),
    // Content for Settings tab
    Container(
      color: Colors.pink.shade300,
      alignment: Alignment.center,
      child: const Text(
        'Settings',
        style: TextStyle(fontSize: 40),
      ),
    )
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text("Responsive site"),
      ),*/
      bottomNavigationBar:  MediaQuery.of(context).size.width < 640?
      BottomNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.indigoAccent,
          // called when one tab is selected
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          // bottom tab items
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Parameter'),
            BottomNavigationBarItem(
                icon: Icon(Icons.location_city), label: 'City'),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_circle_right), label: 'Semester'),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), label: 'Tearcher'),
          ]):null,
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              selectedIndex: _selectedIndex,
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Parameter')),
                NavigationRailDestination(
                    icon: Icon(Icons.location_city), label: Text('City')),
                NavigationRailDestination(
                    icon: Icon(Icons.arrow_circle_right), label: Text('Semester')),
                NavigationRailDestination(
                    icon: Icon(Icons.supervised_user_circle), label: Text('Teacher')),
              ],

              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: const TextStyle(
                color: Colors.teal,
              ),

              unselectedLabelTextStyle: const TextStyle(),
              // Called when one tab is selected
              leading: Column(
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ],
              ),

            ),
          Expanded(child: _screens[_selectedIndex])
        ],
      ),

    );
  }
}