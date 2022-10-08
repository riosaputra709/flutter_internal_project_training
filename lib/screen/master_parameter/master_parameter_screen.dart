import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/screen/master_parameter/widget/header_widget.dart';
import 'package:flutter_internal_project_training/screen/master_parameter/widget/search_criteria_widget.dart';
import 'package:flutter_internal_project_training/screen/master_parameter/widget/table_gridview_widget.dart';
import 'package:flutter_internal_project_training/screen/sidebar.dart';

import '../../common/app_responsive.dart';
import '../../helper/locator.dart';
import '../../helper/navigator_service.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: const Text("Whiteopen"),

        ),*/
        backgroundColor: Colors.white,
        body:
        Container(
          //margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xffddddef),
            //borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Column(
                            children: [
                              /// Header Part
                              HeaderWidget(),
                              SearchCriteria(),
                              SizedBox(
                                height: 20,
                              ),
                              /*if (AppResponsive.isMobile(context)) ...{
                            CalendarWidget(),
                            SizedBox(
                              height: 20,
                            ),
                          },*/
                              TabelGridview(),
                            ],
                          ),
                        ),
                      ),
                      /*if (!AppResponsive.isMobile(context))
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Sidebar(),
                            ],
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
