import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/models/notifictions_model.dart' as nt;

class SliverBodyItems extends StatelessWidget {
  const SliverBodyItems({
    Key? key,
    required this.listItem,
  }) : super(key: key);

  final List<nt.Notification> listItem;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final notification = listItem[index];
          return Dismissible(
            key: Key(notification.title),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notification.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  notification.subtitle,
                                  maxLines: 4,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  notification.id.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (index == listItem.length - 1) ...[
                    const SizedBox(height: 32),
                    Container(
                      height: 0.5,
                      color: Colors.white.withOpacity(0.3),
                    )
                  ]
                ],
              ),
            ),
          );
        },
        childCount: listItem.length,
      ),
    );
  }
}
