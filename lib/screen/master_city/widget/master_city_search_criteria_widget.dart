import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_project_training/model/city_model_request.dart';
import '../../../bloc/sample_bloc.dart';
import '../../../model/base_list_response.dart';

class MasterCitySearchCriteria extends StatefulWidget {
  final BaseListResponse baseListResponseModel;
  final CityModelRequest cityReq;

  const MasterCitySearchCriteria({super.key, required this.baseListResponseModel, required this.cityReq});

  @override
  _MasterCitySearchCriteriaState createState() => _MasterCitySearchCriteriaState();
}

class _MasterCitySearchCriteriaState extends State<MasterCitySearchCriteria>  {
  static GlobalKey<FormState> key = GlobalKey<FormState>();
  late SampleBloc bloc;

  @override
  Widget build(BuildContext context) {
    widget.cityReq.page_size = widget.baseListResponseModel.page_size;
    widget.cityReq.page_no = widget.baseListResponseModel.page_no;
    bloc = BlocProvider.of<SampleBloc>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.all(20),
      child:  Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "City Code",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
                              hintText: "Input Text",
                              hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: const Color(
                                    0xffcbcbe1)),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: Colors.blue, width: 1.8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: Colors.red, width: 1.8),
                              ),
                            ),
                            onChanged: (value) {
                              widget.cityReq.city_code = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "City Name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            style: const TextStyle(color: Colors.black, fontSize: 15),
                            decoration: InputDecoration(
                              errorStyle: const TextStyle(fontSize: 12, color: Colors.red),
                              hintText: "Input Text",
                              hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: const Color(
                                    0xffcbcbe1)),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: Colors.blue, width: 1.8),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                                borderSide: const BorderSide(color: Colors.red, width: 1.8),
                              ),
                            ),
                            onChanged: (value) {
                              widget.cityReq.city_name = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: (){
                                bloc.add(SearchCity(widget.cityReq));
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: const Text(
                                      "Search",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: const Icon(
                                      Icons.search,
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
                                    padding: const EdgeInsets.all(1.0),
                                    child: const Text(
                                      "Clear",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: const Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}