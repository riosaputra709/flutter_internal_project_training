import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';
import '../../../helper/locator.dart';
import '../../../helper/navigator_service.dart';

class TabelGridview extends StatefulWidget {
  @override
  _TabelGridviewWidgetState createState() => _TabelGridviewWidgetState();
}

class _TabelGridviewWidgetState extends State<TabelGridview> {
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

  @override
  Widget build(BuildContext context) {
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
                    onPressed: (){
                      locator<NavigatorService>().navigateToWithArgmnt("master_parameter_add", 1);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: const Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
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
                          padding: const EdgeInsets.all(6.0),
                          child: const Text(
                            "Edit",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
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
                          padding: const EdgeInsets.all(6.0),
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
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
              TextButton(
                onPressed: (){
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: const Text(
                        "Download",
                        style: TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
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
                  tableHeader("Parameter Code"),
                  tableHeader("Parameter Name"),
                  tableHeader("Parameter Detail"),
                  if (!AppResponsive.isMobile(context)) tableHeader("Created By"),
                  if (!AppResponsive.isMobile(context)) tableHeader("Created Date"),
                  if (!AppResponsive.isMobile(context)) tableHeader("Changed By"),
                  if (!AppResponsive.isMobile(context)) tableHeader("Changed Date"),
                ],
              ),

              /// Table Data
              tableRow(
                context,
                parameterCode: "USER_TYPE",
                parameterName: "User Type",
                parameterDetail: "Admin, User",
                createdBy: "Rio S",
                createdDt: "09/09/2022",
                changedBy: "Rio S",
                changedDt: "09/09/2022",
              ),
              tableRow(
                context,
                parameterCode: "VALUE_TYPE",
                parameterName: "Value Type",
                parameterDetail: "String, Integer, Float",
                createdBy: "Rio S",
                createdDt: "19/09/2022",
                changedBy: "Rio S",
                changedDt: "09/09/2022",
              ),
              tableRow(
                context,
                parameterCode: "FINANCIAL_TYPE",
                parameterName: "Financial type of training",
                parameterDetail: "Free, Pay",
                createdBy: "Rio S",
                createdDt: "10/09/2022",
                changedBy: "Rio S",
                changedDt: "09/09/2022",
              ),
              tableRow(
                context,
                parameterCode: "DIFFICULT_LEVEL",
                parameterName: "Difficult level of training",
                parameterDetail: "Beginner, Intermediate, Advance",
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
                    if(MediaQuery.of(context).size.width > 506)...{
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

  TableRow tableRow(context, {parameterCode, parameterName, parameterDetail,
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
            child: Text(parameterCode),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(parameterName),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(parameterDetail),
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
