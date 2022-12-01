import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import '../../../helper/drag_behaviour.dart';

class MasterStudentTableGridview extends StatefulWidget {

  const MasterStudentTableGridview({super.key});
  @override
  _MasterStudentGridviewState createState() => _MasterStudentGridviewState();
}

class _MasterStudentGridviewState extends State<MasterStudentTableGridview>  {
  String? fileExtension;

  bool isChecked = false;
  List<String> list = <String>['Download','xlsx', 'csv', 'xls'];

  late Map<String, bool> List2 = {
  };

  @override
  Widget build(BuildContext context) {

    String dropdownValue = list.first;

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

    final hController = ScrollController();

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
                    /*onPressed: () => showDialog<String>(
                      context: context,
                      builder:(ctx) {
                      },
                    ).then((value) => {
                      if(value != null){
                      }

                    }),*/
                    onPressed: (){},
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
                    onPressed: () => {},
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
                    onPressed: (){  },
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
                    DropdownButton<String>(
                      value: dropdownValue,
                      elevation: 16,
                      underline: Container(
                        color: Colors.blue,
                        height: 2,
                      ),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                          if(dropdownValue != 'Download') {
                          }
                        });
                      },
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
            ],
          ),

          SizedBox(height: 12,),

          if(MediaQuery.of(context).size.width <= 559)
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
                DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  underline: Container(
                    color: Colors.blue,
                    height: 2,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                      if(dropdownValue != 'Download') {
                      }
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),

          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),

          ScrollConfiguration(
            behavior: DragBehavior(),
            child: Scrollbar(
              controller: hController,
              child: SingleChildScrollView(
                controller: hController,
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        // top: 12,
                        // bottom: 12,
                        // right: 12,
                        left: 20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //!
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: SizedBox(
                              height: 17,
                              width: 57,
                              child: Checkbox(
                                value: isChecked,
                                side: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                splashRadius: 1,
                                onChanged: (val) {
                                  setState(() {
                                    isChecked = val ?? false;
                                  });
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Student No",
                              overflow: TextOverflow.ellipsis,
                              /*style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),*/
                            ),
                          ),
                          Container(
                            width: 180,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Student Name",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 130,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Major",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 90,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Gender",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 110,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Birth Place",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Birth Date",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 300,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Address",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 120,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Created By",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 120,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Created Date",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 120,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Changed By",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            width: 120,
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                            child: Text(
                              "Changed Date",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //const StudentItem(),
                  ],
                ),
              ),
            ),
          ),

          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),

          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                0 < 1 ?
                Text("0 Results Data") :
                Text("2 Show Of 10 Result Data"),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                      },
                      child: Text(
                        "<",
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text("1"),
                      ),
                    ),

                    OutlinedButton(
                      onPressed: () {
                      },
                      child: Text(
                        ">",
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

}