import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:sfs_inversor/src/bloc/notification/notification_bloc.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/exportwidgets.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

class ActionNotification extends StatelessWidget {
  const ActionNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      buildWhen: (previous, current) {
        print(previous);
        print(current);
        return true;
      },
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                Routes().Push(
                    Routes().notification, AnimatedPage.slidetopright, 200));
          },
          child: Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  size: 40,
                  color: EstiloApp.colorwhite,
                ),
                Positioned(
                    right: 1,
                    top: 0,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: EstiloApp.colorwhite),
                      child: TweenAnimationBuilder<int>(
                          duration: const Duration(seconds: 1),
                          tween: IntTween(begin: 0, end: 25),
                          builder: (context, snapshot, _) {
                            return t3(text: snapshot.toString());
                          }),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}

