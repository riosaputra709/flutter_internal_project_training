import 'package:flutter/material.dart';

import '../../../common/app_colors.dart';
import '../../../common/app_responsive.dart';


class MasterParameterAddGridview extends StatefulWidget {
  @override
  _MasterParameterAddGridviewWidgetState createState() => _MasterParameterAddGridviewWidgetState();
}

class _MasterParameterAddGridviewWidgetState extends State<MasterParameterAddGridview> {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: TextButton(
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
                  tableHeader("Parameter Detail Code"),
                  tableHeader("Parameter Detail Name"),
                  tableHeader("Description"),
                ],
              ),

              /// Table Data
              tableRow(
                context,
                parameterDetailCode: "LEVEL_BEGINNER",
                parameterDetailName: "Beginner",
                parameterDescription: "Beginner Level",
              ),
              tableRow(
                context,
                parameterDetailCode: "LEVEL_INTERMEDIATE",
                parameterDetailName: "Intermediate",
                parameterDescription: "Intermediate Level",
              ),
              tableRow(
                context,
                parameterDetailCode: "LEVEL_ADVANCE",
                parameterDetailName: "Advance",
                parameterDescription: "Advance Level",
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TextButton(
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
                            "Save",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: const Icon(
                            Icons.save,
                            color: Colors.white,
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

  TableRow tableRow(context, {parameterDetailCode, parameterDetailName, parameterDescription}) {
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
            child: Text(parameterDetailCode),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(parameterDetailName),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(parameterDescription),
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
