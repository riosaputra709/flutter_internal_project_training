import 'package:flutter/material.dart';

class SearchCriteria extends StatelessWidget {
  String? dropdownValue;
  List<String> options = [
    'item 1',
    'item 2',
    'item 3',
    'item 4',
    'item 5',
  ];
  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Parameter Code",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                style: const TextStyle(
                                  color: const Color(0xffededfd),
                                  fontSize: 15,
                                ),
                                value: dropdownValue,
                                isExpanded: true,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                ),
                                items: options.map((e) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      e,
                                    ),
                                    value: e,
                                  );
                                }).toList(),
                                onChanged: (val) {
                                  dropdownValue = val!;
                                },
                                validator: (value) {
                                  if(value?.isNotEmpty != true) {
                                    return "this field is mandatory";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  errorStyle:  const TextStyle(fontSize:  12, color: Colors.red),
                                  hintText: "Select options",
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
                              )
                          ),
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Parameter Name",
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
                        ],
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Parameter Detail",
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (MediaQuery.of(context).size.width >= 783) ...{
                Expanded(
                    child:
                    Container(
                        padding: EdgeInsets.only(top: 20),
                        width: MediaQuery.of(context).size.width * 0.20,
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
                                      "Search",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
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
                                    padding: const EdgeInsets.all(6.0),
                                    child: const Text(
                                      "Clear",
                                      style: TextStyle(
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: const Icon(
                                      Icons.delete_forever,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    )
                ),
              }
            ],
          ),

          if (MediaQuery.of(context).size.width < 783) ...{
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Row (
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
                            "Search",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
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
                          padding: const EdgeInsets.all(6.0),
                          child: const Text(
                            "Clear",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: const Icon(
                            Icons.delete_forever,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            )
          }
        ],
      ),
    );
  }
}
