import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_internal_project_training/model/city_model_request.dart';
import '../../../bloc/sample_bloc.dart';
import '../../../controllers/menu_controller.dart';
import '../../../helper/locator.dart';
import '../../../helper/navigator_service.dart';
import 'package:provider/provider.dart';

class OptionDialogEditCity extends StatelessWidget {
  final String cityCode;
  final String cityName;
  const OptionDialogEditCity({Key? key, required this.cityCode, required this.cityName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Menu1Controller()),
        ],
        child: BlocProvider<SampleBloc>(
            create: (context) => SampleBloc(),
            child: OptionDialogEditCityScreen(title: "Pop Up Master City Edit", cc: cityCode, cn: cityName,)
        ),
      ),
    );
  }
}
class OptionDialogEditCityScreen extends StatefulWidget{
  final String cc;
  final String cn;
  const OptionDialogEditCityScreen({Key?key,required this.title, required this.cc, required this.cn}) : super(key : key);

  final String title;

  State<OptionDialogEditCityScreen> createState() => _optionDialogState();
}

class _optionDialogState extends State<OptionDialogEditCityScreen>{
  CityModelRequest model = new CityModelRequest();
  static GlobalKey<FormState> key = GlobalKey<FormState>();
  late SampleBloc bloc;

  @override
  Widget build(BuildContext context) {
    model.city_code = widget.cc;

    bloc = BlocProvider.of<SampleBloc>(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Form(
                key: key,
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
                            readOnly: true,
                            enabled: false,
                            style: const TextStyle(color: Colors.black, fontSize: 15),
                            initialValue: widget.cc,
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
                            initialValue: widget.cn,
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
                                      locator<NavigatorService>().goBack();
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
                                  TextButton(
                                    onPressed: (){
                                      if(key.currentState?.validate() == true) {
                                        locator<NavigatorService>().goBack(value: model.city_code.toString()+","+model.city_name.toString());
                                      }
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
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}