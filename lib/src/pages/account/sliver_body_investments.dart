import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/bloc/bloc/investment_bloc.dart';
import 'package:sfs_inversor/src/models/investment_model.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

class SliverBodyInvestments extends StatelessWidget {
  const SliverBodyInvestments({Key? key, required this.listItem})
      : super(key: key);
  final List<Investment> listItem;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvestmentBloc, InvestmentState>(
      builder: (context, state) {
        return SliverList(
            delegate:
                SliverChildBuilderDelegate(childCount: 12, (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ListTile(
              trailing: t3(
                fontWeight: FontWeight.bold,
                color: EstiloApp.colorblack,
                text: S.of(context).currency(index.toDouble()),
              ),
              leading: CircularProgressIndicator(
                value: 1,
                strokeWidth: 2,
                backgroundColor: EstiloApp.colorwhite,
                valueColor:
                    AlwaysStoppedAnimation<Color>(EstiloApp.primarypurple),
              ),
              title: t1(text: 'title'),
              subtitle: t3(text: 'Subtitle'),
            ),
          );
        }));
      },
    );
  }
}
