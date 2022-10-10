import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/app_colors.dart';
import '../../common/app_responsive.dart';
import '../../controllers/menu_controller.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12, bottom: 4),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                if (!AppResponsive.isDesktop(context))
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: AppColor.black,
                    ),
                    onPressed: Provider.of<MenuController>(context, listen: false)
                        .controlMenu,
                  ),
                Image.asset(
                  'assets/logo_wot_1.png',
                  fit: BoxFit.contain,
                  height: 32,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(Icons.notifications_active),
              
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/user_image.jpg'),
                ),
              ),
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rio Saputra", style: TextStyle(
                    fontSize: 12,
                  )),
                  Text("Admin", style: TextStyle(
                    fontSize: 10
                  ))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

}
