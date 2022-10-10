import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/screen/widget/header_widget.dart';
import 'package:flutter_internal_project_training/screen/master_city/widget/master_city_search_criteria_widget.dart';
import 'package:flutter_internal_project_training/screen/master_city/widget/master_city_table_gridview_widget.dart';
import 'package:flutter_internal_project_training/screen/sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../common/app_responsive.dart';
import '../../controllers/menu_controller.dart';
import '../../helper/locator.dart';
import '../../helper/navigator_service.dart';


void main() {
  runApp(MasterCity());
}

class MasterCity extends StatelessWidget {
  const MasterCity({Key? key}) : super(key: key);

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
        child: MasterCityScreen(title: 'Master City Screen',),
      ),
    );
  }
}

class MasterCityScreen extends StatefulWidget {
  const MasterCityScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MasterCityScreen> createState() => _MasterCityState();
}

class _MasterCityState extends State<MasterCityScreen> {
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
                                  Text("Home/ Master/ City"),
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
                                          MasterCitySearchCriteria(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          MasterCityTableGridview(),
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
