import 'package:flutter/material.dart';

import '../../helper/locator.dart';
import '../../helper/navigator_service.dart';
import '../common/app_colors.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: Colors.white,
        child: Scrollbar(
          thumbVisibility: true,
          controller: _firstController,
          child: ListView(
            controller: _firstController,
            children: [
                Column(
                  children: [
                    DrawerListTile(
                      title: "Parameter",
                      icon: "",
                      press: () {
                        locator<NavigatorService>().navigateToWithArgmnt("master_parameter", 1);
                      },
                    ),
                    DrawerListTile(
                      title: "City",
                      icon: "",
                      press: () {
                        locator<NavigatorService>().navigateToWithArgmnt("master_city", 1);
                      },
                    ),
                  ],
              )
            ],
          ),
        )
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, icon;
  final VoidCallback press;

  const DrawerListTile({Key? key, required this.title, required this.icon, required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        Icons.arrow_circle_right
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColor.black, fontSize: 13),
      ),
    );
  }
}
