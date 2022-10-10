import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/screen/widget/header_widget.dart';
import 'package:flutter_internal_project_training/screen/master_parameter/widget/search_criteria_widget.dart';
import 'package:flutter_internal_project_training/screen/master_parameter/widget/table_gridview_widget.dart';
import 'package:flutter_internal_project_training/screen/sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../common/app_responsive.dart';
import '../../controllers/menu_controller.dart';
import '../../helper/locator.dart';
import '../../helper/navigator_service.dart';


void main() {
  runApp(MasterParameter());
}

class MasterParameter extends StatelessWidget {
  const MasterParameter({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),*/
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuController()),
        ],
        child: MasterParameterScreen(title: 'Master Parameter Screen',),
      ),
    );
  }
}

class MasterParameterScreen extends StatefulWidget {
  const MasterParameterScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MasterParameterScreen> createState() => _MasterParameterState();
}

class _MasterParameterState extends State<MasterParameterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: HeaderWidget(),
        ),*/
        drawer: SideBar(),
        key: Provider.of<MenuController>(context, listen: false).scaffoldKey,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              child: HeaderWidget(),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (AppResponsive.isDesktop(context))
                    Expanded(
                      child: SideBar(),
                    ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      //margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xffe5e5f3),
                        //borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(14)),
                            padding: EdgeInsets.all(6),
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Home/ Master/ Parameter"),
                              ],
                            )
                          ),
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
                    ),
                  ),


                ],
              ),
            )
          ],
        )
    );
  }
}
