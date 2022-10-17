import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_project_training/helper/locator.dart';
import 'package:flutter_internal_project_training/helper/navigator_service.dart';
import 'package:flutter_internal_project_training/model/base_list_response.dart';
import 'package:flutter_internal_project_training/model/city_model_request.dart';
import 'package:flutter_internal_project_training/model/city_model_response.dart';
import '../../../bloc/sample_bloc.dart';
import '../../../common/app_colors.dart';
import 'master_city_popup_add.dart';

class MasterCityTableGridview extends StatefulWidget {
  final List<CityModelResponse> model;
  final BaseListResponse baseListResponseModel;

  const MasterCityTableGridview({super.key, required this.model, required this.baseListResponseModel});
  @override
  _MasterCityGridviewState createState() => _MasterCityGridviewState();
}

class _MasterCityGridviewState extends State<MasterCityTableGridview>  {
  CityModelRequest model1 = CityModelRequest();
  late SampleBloc bloc;
  var splited;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

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

    // TODO: implement build
    bloc = BlocProvider.of<SampleBloc>(context);
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
                  BlocBuilder<SampleBloc, SampleState>(
                    builder: (context, state) {
                      if(state is SampleLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else {
                        return TextButton(
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder:(ctx) {
                              return OptionDialogAddCity();
                            },
                          ).then((value) => {
                            splited = value?.split(','),
                            model1.city_code = splited[0],
                            model1.city_name = splited[1],
                            bloc.add(CreateCity(model1))
                          }),
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
                        );
                      }
                    },
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

          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.08,
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
              Container(
                  width: MediaQuery.of(context).size.width * 0.10,
                  child: Text("City Code")
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Text("City Name")
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: Text("Created By")
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: Text("Created Date")
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: Text("Changed By")
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.11,
                  child: Text("Changed Date")
              ),
            ],
          ),

          Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),

          widget.model.length > 0 || widget.model.isNotEmpty ?
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: widget.model.length,
            itemBuilder: (context, index) => Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.08,
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
                    Container(
                        width: MediaQuery.of(context).size.width * 0.10,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Text(widget.model[index].city_code.toString()),
                        )
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Text(widget.model[index].city_name.toString()),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 6.0),
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.11,
                          child: Text(widget.model[index].created_by.toString())
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.11,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Text(widget.model[index].created_date.toString()),
                        )
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.11,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Text(widget.model[index].changed_by.toString()),
                        )
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.11,
                        child: Text(widget.model[index].changed_date.toString())
                    ),
                  ],
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
              ],
            ),
          )
              : Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10, bottom: 30),
                width: MediaQuery.of(context).size.width*0.70,
                child: Text(
                    "No Data Found"
                ),
              ),
            ],
          ),


          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.model.length < 1 ?
                Text("0 Results Data") :
                Text(widget.baseListResponseModel.total_data_in_page.toString()+" Show Of "+
                widget.baseListResponseModel.total_data.toString() + " Result Data"),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "<",
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(right: 6.0, left: 6.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(widget.baseListResponseModel.page_no.toString()),
                      ),
                    ),

                    OutlinedButton(
                      onPressed: () {},
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