import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/screen/master_paramater_add/master_parameter_add_screen.dart';
import 'package:flutter_internal_project_training/screen/master_parameter/master_parameter_screen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/menu_controller.dart';
import 'helper/locator.dart';
import 'helper/navigator_service.dart';
import 'helper/route_generator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

/// Let's start to make responsive website
/// First make app responsive class

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),*/
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Menu1Controller()),
        ],
        child: MasterParameter(),
      ),
      navigatorKey: locator<NavigatorService>().navigatorKey,
      onGenerateRoute: (settings) => Routegenerator.generateRoute(settings) ,
    );
  }
}
