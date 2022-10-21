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
import 'master_city_popup_edit.dart';

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

  late Map<String, bool> List2 = {
    for(int i = 0; i < widget.model.length; i++)
      widget.model[i].city_code! +";"+ widget.model[i].city_name! : false
  };

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
                            if(value != null){
                              splited = value.split(','),
                              model1.city_code = splited[0],
                              model1.city_name = splited[1],
                              bloc.add(CreateCity(model1))
                            }

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
                    onPressed: () => editCheckItem(),
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
                    onPressed: (){ removeAllCheckItems(); },
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

          SizedBox(height: 12,),

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
                        value: List2[widget.model[index].city_code! +";"+ widget.model[index].city_name!],
                        onChanged: (bool? value) {
                          setState(() {
                            List2[widget.model[index].city_code! +";"+ widget.model[index].city_name!] = value!;
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

  void removeAllCheckItems() {
    var holder_1 = [];
    List2.forEach((key, value) {
      splited = key.split(';');
      if (value == true) {
        holder_1.add(splited[0]);
      }
    });
    holder_1.forEach((element) {
      setState(() {
        bloc.add(DeleteCity(element));
      });
    });
    holder_1.clear();

  }

  void editCheckItem() {
    var holder_1 = [];
    List2.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    if(holder_1.length == 1) {
      splited = holder_1[0].toString().split(';');
      String cityCode = splited[0];
      String cityName = splited[1];
      showDialog<String>(
        context: context,
        builder:(ctx) {
          return OptionDialogEditCity(cityCode : cityCode, cityName: cityName,);
        },
      ).then((value) => {
        if(value != null){
          splited = value.split(','),
          model1.city_code = splited[0],
          model1.city_name = splited[1],
          bloc.add(EditCity(model1))
        }
      });
    }
    else if (holder_1.length < 1){
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            duration: const Duration(seconds: 5),
            content: Text(
              "pilih 1 data",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red));
    }
    else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            duration: const Duration(seconds: 5),
            content: Text(
              "hanya dapat memilih 1 data",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red));
    }
    holder_1.clear();
  }


}