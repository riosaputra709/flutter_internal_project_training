import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/sample_bloc.dart';
import '../../../model/city_model.dart';

class MasterCitySearchCriteria extends StatefulWidget {
  @override
  _MasterCitySearchCriteriaState createState() => _MasterCitySearchCriteriaState();
}

class _MasterCitySearchCriteriaState extends State<MasterCitySearchCriteria>  {
  CityModel model = new CityModel();
  static GlobalKey<FormState> key = GlobalKey<FormState>();
  late SampleBloc bloc;

  String city_name = '';
  String city_code = '';
  int page_number = 0;
  int max_page = 10;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bloc = BlocProvider.of<SampleBloc>(context);
    return BlocListener<SampleBloc, SampleState>(
        listener: (context, state) {
          if(state is GetCitiesSuccess1) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  duration: const Duration(seconds: 5),
                  content: Text(
                    "berhasil mencari data",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.green));
          }
          if (state is SampleErrorState) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  duration: const Duration(seconds: 5),
                  content: Text(
                    state.error,
                    style:  const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Colors.red));
          }
        },
      child: Container(
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
                                city_code = value;
                              },
                              /*validator: (value) {
                              if(value?.isNotEmpty != true){
                                return "this field is mandatory";
                              }
                              else {
                                return null;
                              }
                            },*/
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
                                city_name = value;
                              },
                              /*validator: (value) {
                              if(value?.isNotEmpty != true){
                                return "this field is mandatory";
                              }
                              else {
                                return null;
                              }
                            },*/
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
                              BlocBuilder<SampleBloc, SampleState>(
                                builder: (context, state) {
                                  if(state is SampleLoading){
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  else {
                                    return TextButton(
                                      onPressed: (){
                                        bloc.add(SearchCity(city_code, city_name, page_number, max_page ));
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(6.0),
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
                                      padding: const EdgeInsets.all(6.0),
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
      ),
    );
  }
}