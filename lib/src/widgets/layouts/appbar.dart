import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:sfs_inversor/src/widgets/exportwidgets.dart';

class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LeadingDrawer extends StatelessWidget {
  const LeadingDrawer({Key? key, required this.drawer}) : super(key: key);
  final ZoomDrawerController drawer;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => drawercontrol(drawer), icon: Icon(Icons.menu));
  }
}

class LeadingBack extends StatelessWidget {
  const LeadingBack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(Icons.arrow_back_ios));
  }
}
