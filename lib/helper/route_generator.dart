import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/screen/master_city/master_city_screen.dart';
import 'package:flutter_internal_project_training/screen/master_parameter/master_parameter_screen.dart';
import 'package:flutter_internal_project_training/screen/master_student/master_student_screen.dart';

import '../screen/master_city_import_file/master_city_import_file_screen.dart';
import '../screen/master_paramater_add/master_parameter_add_screen.dart';
import 'locator.dart';
import 'navigator_service.dart';

class Routegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "master_parameter":
        return MaterialPageRoute(builder: (_) => MasterParameter());
      case "master_parameter_add":
        return MaterialPageRoute(builder: (_) => MasterParameterAdd());
      case "master_city":
        return MaterialPageRoute(builder: (_) => MasterCity());
      case "master_city_import_file":
        return MaterialPageRoute(builder: (_) => MasterCityImportFile());
      case "master_student":
        return MaterialPageRoute(builder: (_) => MasterStudent());
      default:
        return _errorRoute();
    }
  }
  
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("error"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("ups ada sesuatu yang salah, silahkan coba lagi"),
              Container(
                margin: const EdgeInsets.all(4),
              ),
              GestureDetector(
                onTap: () {
                  locator<NavigatorService>().navigateTo("master_parameter");
                },
                child: const Icon(Icons.refresh_outlined),
              )
            ],
          ),
        ),
      );
    });
  }
}