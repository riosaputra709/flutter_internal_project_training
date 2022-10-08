import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/screen/master_paramater_add/widget/header_widget.dart';
import 'package:flutter_internal_project_training/screen/master_paramater_add/widget/search_criteria_widget.dart';
import 'package:flutter_internal_project_training/screen/master_paramater_add/widget/table_gridview_widget.dart';


class MasterParameterAddScreen extends StatefulWidget {
  @override
  _MasterParameterAddState createState() => _MasterParameterAddState();
}

class _MasterParameterAddState extends State<MasterParameterAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       /* appBar: AppBar(
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
                              MasterParameterAddHeaderWidget(),
                              MasterParameterAddSearchCriteria(),
                              SizedBox(
                                height: 20,
                              ),
                              /*if (AppResponsive.isMobile(context)) ...{
                            CalendarWidget(),
                            SizedBox(
                              height: 20,
                            ),
                          },*/
                              MasterParameterAddGridview(),
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
                            CalendarWidget(),
                            SizedBox(
                              height: 20,
                            ),
                            ProfileCardWidget(),
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
