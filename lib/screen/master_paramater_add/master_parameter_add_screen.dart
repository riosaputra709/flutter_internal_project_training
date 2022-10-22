import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/screen/widget/header_widget.dart';
import 'package:flutter_internal_project_training/screen/master_paramater_add/widget/search_criteria_widget.dart';
import 'package:flutter_internal_project_training/screen/master_paramater_add/widget/table_gridview_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../common/app_responsive.dart';
import '../../controllers/menu_controller.dart';
import '../widget/sidebar.dart';

void main() {
  runApp(const MasterParameterAdd());
}

class MasterParameterAdd extends StatelessWidget {
  const MasterParameterAdd({Key? key}) : super(key: key);

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
        child: MasterParameterAddScreen(title: 'Master Parameter Add Screen',),
      ),
    );
  }
}

class MasterParameterAddScreen extends StatefulWidget {
  const MasterParameterAddScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MasterParameterAddScreen> createState() => _MasterParameterAddState();
}

class _MasterParameterAddState extends State<MasterParameterAddScreen> {
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
                                  Text("Home/ Master/ Parameter/ Add"),
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
                                          /// Header Part
                                          //MasterParameterAddHeaderWidget(),
                                          MasterParameterAddSearchCriteria(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          MasterParameterAddGridview(),
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
