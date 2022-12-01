import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_project_training/screen/master_student/widget/master_student_search_criteria_widget.dart';
import 'package:flutter_internal_project_training/screen/master_student/widget/master_student_table_gridview_widget.dart';
import 'package:flutter_internal_project_training/screen/widget/header_widget.dart';
import 'package:flutter_internal_project_training/screen/widget/sidebar.dart';
import 'package:provider/provider.dart';
import '../../bloc/sample_bloc.dart';
import '../../common/app_responsive.dart';
import '../../controllers/menu_controller.dart';
import '../../model/base_list_response.dart';

void main() {
  runApp(MasterStudent());
}

class MasterStudent extends StatelessWidget {
  const MasterStudent({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuController()),
        ],
        child: const MasterStudentScreen(title: 'Master Student Screen',),
      ),
    );
  }
}

class MasterStudentScreen extends StatefulWidget {
  const MasterStudentScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MasterStudentScreen> createState() => _MasterStudentState();
}

class _MasterStudentState extends State<MasterStudentScreen> {
  BaseListResponse baseListResponseModel = new BaseListResponse();

  //StudentModelRequest studentModelRequest = new StudentModelRequest();

  //List<StudentModelResponse> arrayStudent = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideBar(),
        key: Provider
            .of<MenuController>(context, listen: false)
            .scaffoldKey,
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14)),
                              padding: EdgeInsets.all(6),
                              margin: EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  Text("Home/ Master/ Student"),
                                ],
                              )
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          MasterStudentSearchCriteria(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          MasterStudentTableGridview(),
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
        ),
    );
  }
}