import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_project_training/screen/master_city/widget/master_city_search_criteria_widget.dart';
import 'package:flutter_internal_project_training/screen/master_city/widget/master_city_table_gridview_widget.dart';
import 'package:flutter_internal_project_training/screen/widget/header_widget.dart';
import 'package:flutter_internal_project_training/screen/sidebar.dart';
import 'package:provider/provider.dart';
import '../../bloc/sample_bloc.dart';
import '../../common/app_responsive.dart';
import '../../controllers/menu_controller.dart';
import '../../model/base_list_response.dart';
import '../../model/city_model_request.dart';
import '../../model/city_model_response.dart';

void main() {
  runApp(MasterCity());
}

class MasterCity extends StatelessWidget {
  const MasterCity({Key? key}) : super(key: key);

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
        child: BlocProvider<SampleBloc>(
          create: (context) => SampleBloc(),
          child: const MasterCityScreen(title: 'Master City Screen',),
        ),
      ),
    );
  }
}

class MasterCityScreen extends StatefulWidget {
  const MasterCityScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MasterCityScreen> createState() => _MasterCityState();
}

class _MasterCityState extends State<MasterCityScreen> {
  BaseListResponse baseListResponseModel = new BaseListResponse();
  CityModelRequest cityModelRequest = new CityModelRequest();
  late SampleBloc bloc;

  List<CityModelResponse> arrayCity = [];

  @override
  void initState() {
    cityModelRequest.page_size = '';
    cityModelRequest.page_no = '';
    cityModelRequest.city_code = '';
    cityModelRequest.city_name = '';
    bloc = BlocProvider.of<SampleBloc>(context);
    bloc.add(SearchCity(cityModelRequest));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SampleBloc, SampleState>(
        listener: (context, state) {
          if(state is GetCitiesSuccess) {
            arrayCity.clear();
            arrayCity.addAll(state.cities.list_data!);
            baseListResponseModel.page_no = state.cities.page_no;
            baseListResponseModel.page_size = state.cities.page_size;
            baseListResponseModel.total_data_in_page = state.cities.total_data_in_page;
            baseListResponseModel.total_data = state.cities.total_data;
            baseListResponseModel.total_page = state.cities.total_page;
          }
          if(state is CreateCitySuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  duration: const Duration(seconds: 5),
                  content: Text(
                    "berhasil create ${state.city_code}",
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
        child: Scaffold(
          /*appBar: AppBar(
          title: HeaderWidget(),
        ),*/
            drawer: SideBar(),
            key: Provider
                .of<MenuController>(context, listen: false)
                .scaffoldKey,
            backgroundColor: Colors.white,
            body:
            BlocBuilder<SampleBloc, SampleState>(
                builder: (context, state){
                  if(state is SampleLoading){
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else{
                    return Column(
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Home/ Master/ City"),
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
                                                      MasterCitySearchCriteria(baseListResponseModel: baseListResponseModel,),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      MasterCityTableGridview(model: arrayCity,baseListResponseModel: baseListResponseModel),
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
                    );
                  }
                }
            )


        )
    );
  }
}
