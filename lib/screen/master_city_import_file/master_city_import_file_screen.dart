import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/screen/master_city_import_file/widget/master_city_import_file_dropzone.dart';
import 'package:flutter_internal_project_training/screen/widget/header_widget.dart';
import 'package:flutter_internal_project_training/screen/widget/sidebar.dart';
import 'package:provider/provider.dart';

import '../../common/app_responsive.dart';
import '../../controllers/menu_controller.dart';
import '../../model/file_data_upload.dart';



void main() {
  runApp(MasterCityImportFile());
}

class MasterCityImportFile extends StatelessWidget {
  const MasterCityImportFile({Key? key}) : super(key: key);

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
        child: MasterCityImportFileScreen(title: 'Master City Screen',),
      ),
    );
  }
}

class MasterCityImportFileScreen extends StatefulWidget {
  const MasterCityImportFileScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MasterCityImportFileScreen> createState() => _MasterCityImportFileState();
}

class _MasterCityImportFileState extends State<MasterCityImportFileScreen> {
  File_Data_Model? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  Text("Home/ Master/ City/ Import File"),
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
                                          Container(
                                            height: 500,
                                            child: DropZoneWidget(
                                              onDroppedFile: (file) => setState(()=> this.file = file) ,
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
