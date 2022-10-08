import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/main.dart';
import 'package:flutter_internal_project_training/screen/master_parameter/master_parameter_screen.dart';

import '../screen/master_paramater_add/master_parameter_add_screen.dart';
import 'locator.dart';
import 'navigator_service.dart';

class Routegenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "master_parameter":
        return MaterialPageRoute(builder: (_) => Dashboard());
      case "master_parameter_add":
        return MaterialPageRoute(builder: (_) => MasterParameterAddScreen());
      default:
        return MaterialPageRoute(builder: (_) => Dashboard());
    }
  }
  
  /*static Route<dynamic> _errorRoute() {
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
                  locator<NavigatorService>().navigateTo("home_page");
                },
                child: const Icon(Icons.refresh_outlined),
              )
            ],
          ),
        ),
      );
    });
  }*/
}