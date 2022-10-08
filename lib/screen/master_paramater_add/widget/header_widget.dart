import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MasterParameterAddHeaderWidget extends StatefulWidget {
  @override
  _MasterParameterAddHeaderWidgetState createState() => _MasterParameterAddHeaderWidgetState();
}

class _MasterParameterAddHeaderWidgetState extends State<MasterParameterAddHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            "Home/ Master/ Parameter/ Add",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

}
