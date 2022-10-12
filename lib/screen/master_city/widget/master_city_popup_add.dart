import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_project_training/model/request_city.dart';

import '../../../bloc/sample_bloc.dart';
import '../../../controllers/menu_controller.dart';
import '../../../helper/locator.dart';
import '../../../helper/navigator_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(OptionDialogAddCity());
}

class OptionDialogAddCity extends StatelessWidget {
  const OptionDialogAddCity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MenuController()),
        ],
        child: BlocProvider<SampleBloc>(
          create: (context) => SampleBloc(),
          child: OptionDialogAddCityScreen(title: "Pop Up Master City Add",)
        ),
      ),
    );
  }
}
class OptionDialogAddCityScreen extends StatefulWidget{
  const OptionDialogAddCityScreen({Key?key,required this.title}) : super(key : key);

  final String title;

  State<OptionDialogAddCityScreen> createState() => _optionDialogState();
}

class _optionDialogState extends State<OptionDialogAddCityScreen>{
  RequestCityModel model = new RequestCityModel();
  static GlobalKey<FormState> key = GlobalKey<FormState>();
  late SampleBloc bloc;

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
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "City",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){
                            locator<NavigatorService>().goBack();
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.blue,
                  height: 12,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 12, right: 12, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City Code"),
                      SizedBox(height: 6),
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
                          model.city_code = value;
                        },
                        validator: (value) {
                          if(value?.isNotEmpty != true){
                            return "this field is mandatory";
                          }
                          else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Text("City Name"),
                      SizedBox(height: 6),
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
                          model.city_name = value;
                        },
                        validator: (value) {
                          if(value?.isNotEmpty != true){
                            return "this field is mandatory";
                          }
                          else {
                            return null;
                          }
                        },
                      ),

                      Container(
                          padding: EdgeInsets.only(top: 25),
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
                                      padding: const EdgeInsets.all(1.0),
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: const Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              BlocBuilder<SampleBloc, SampleState>(
                                builder: (context, state) {
                                  if(state is SampleLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  else {
                                    return TextButton(
                                      onPressed: (){
                                        bloc.add(CreateCity(model));
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: const Text(
                                              "Save",
                                              style: TextStyle(
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(1.0),
                                            child: const Icon(
                                              Icons.save,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ],
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}