import 'package:flutter/material.dart';

import '../../helper/locator.dart';
import '../../helper/navigator_service.dart';
import '../common/app_colors.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: AppColor.bgSideMenu,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "MATRIX HR",
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              icon: "assets/menu_home.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Recruitment",
              icon: "assets/menu_recruitment.png",
              press: () {
                locator<NavigatorService>().navigateToWithArgmnt("master_parameter", 1);
              },
            ),
            DrawerListTile(
              title: "Onboarding",
              icon: "assets/menu_onboarding.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Reports",
              icon: "assets/menu_report.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Calendar",
              icon: "assets/menu_calendar.png",
              press: () {},
            ),
            DrawerListTile(
              title: "Settings",
              icon: "assets/menu_settings.png",
              press: () {},
            ),
            Spacer(),
            Image.asset("assets/sidebar_image.png")
          ],
        ),
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
      leading: Image.asset(
        icon,
        color: AppColor.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}
