import 'package:flutter/material.dart';
import 'package:flutter_internal_project_training/helper/locator.dart';
import 'package:flutter_internal_project_training/helper/navigator_service.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';
import 'master_city_popup_add.dart';

class MasterCityTableGridview extends StatefulWidget {
  @override
  _MasterCityGridviewState createState() => _MasterCityGridviewState();
}

class _MasterCityGridviewState extends State<MasterCityTableGridview>  {
  /*checked*/
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return AppColor.borderSide;
  }
  /*checked*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: AppColor.white, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row (
                children: [
                  TextButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder:(ctx) {
                        return const OptionDialogAddCity();
                      },
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: const Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  TextButton(
                    onPressed: (){
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  TextButton(
                    onPressed: (){
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if(MediaQuery.of(context).size.width > 559) //jika tampilan desktop akan muncul
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: (){
                        locator<NavigatorService>().navigateTo("master_city_import_file");
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: const Text(
                              "Import File",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: const Icon(
                              Icons.upload_file,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    TextButton(
                      onPressed: (){
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: const Text(
                              "Download",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: const Icon(
                              Icons.download,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          if(MediaQuery.of(context).size.width <= 559)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: (){
                    locator<NavigatorService>().navigateTo("master_city_import_file");
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: const Text(
                          "Import File",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: const Icon(
                          Icons.upload_file,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                TextButton(
                  onPressed: (){
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: const Text(
                          "Download",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: const Icon(
                          Icons.download,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              /// Table Header
              TableRow(
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.5,
                      )),
                ),
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  tableHeader("City Code"),
                  tableHeader("City Name"),
                  if (!AppResponsive.isMobile(context)) tableHeader("Created By"),
                  if (!AppResponsive.isMobile(context)) tableHeader("Created Date"),
                  if (!AppResponsive.isMobile(context)) tableHeader("Changed By"),
                  if (!AppResponsive.isMobile(context)) tableHeader("Changed Date"),
                ],
              ),

              /// Table Data
              tableRow(
                context,
                cityCode: "32.73",
                cityName: "Kota Bandung",
                createdBy: "Rio S",
                createdDt: "09/09/2022",
                changedBy: "Rio S",
                changedDt: "09/09/2022",
              ),
              tableRow(
                context,
                cityCode: "32.17",
                cityName: "Kabupaten Bandung",
                createdBy: "Rio S",
                createdDt: "09/09/2022",
                changedBy: "Rio S",
                changedDt: "09/09/2022",
              ),
              tableRow(
                context,
                cityCode: "35.78",
                cityName: "Kota Surabaya",
                createdBy: "Rio S",
                createdDt: "09/09/2022",
                changedBy: "Rio S",
                changedDt: "09/09/2022",
              ),

            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Showing 4 out of 4 Results"),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "<",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "2",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                    if(MediaQuery.of(context).size.width > 520)...{
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "3",
                          style: TextStyle(color: Colors.deepPurple),
                        ),
                      ),
                    },
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        ">",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TableRow tableRow(context, {cityCode, cityName,
    createdBy, createdDt, changedBy, changedDt}) {
    return TableRow(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(cityCode),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(cityName),
          ),
          if (!AppResponsive.isMobile(context)) Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(createdBy),
          ),
          if (!AppResponsive.isMobile(context)) Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(createdDt),
          ),
          if (!AppResponsive.isMobile(context)) Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(changedBy),
          ),
          if (!AppResponsive.isMobile(context)) Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(changedDt),
          ),
        ]);
  }

  Widget tableHeader(text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.black),
      ),
    );
  }
}