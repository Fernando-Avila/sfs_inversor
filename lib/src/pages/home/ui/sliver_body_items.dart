import 'package:flutter/material.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/models/investment_model.dart';
import 'package:sfs_inversor/src/services/Functions.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/layouts/buttons.dart';
import 'package:sfs_inversor/src/widgets/layouts/extras.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

class SliverBodyItemsInversor extends StatelessWidget {
  const SliverBodyItemsInversor({
    Key? key,
    required this.listItem,
  }) : super(key: key);

  final List<Investment> listItem;

  @override
  Widget build(BuildContext context) {
    double hg = 40.0;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final investment = listItem[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (index == 0) ...[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    height: 25,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: InfoInvet(hg: hg, text: S.of(context).id)),
                        Expanded(
                            child:
                                InfoInvet(hg: hg, text: S.of(context).amount)),
                        Expanded(
                            child: InfoInvet(hg: hg, text: S.of(context).tir)),
                        Expanded(child: InfoInvet(hg: hg, text: '')),
                      ],
                    ),
                  )
                ],
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: EstiloApp.colorwhite,
                      boxShadow: kElevationToShadow[1]),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                              child: InfoInvet(
                                  hg: hg, text: investment.code.toString())),
                          Expanded(
                              child: InfoInvet(
                                  hg: hg,
                                  text: S.of(context).pageHomeSampleTotalAmount(
                                      investment.required.toDouble()))),
                          Expanded(
                              child: InfoInvet(
                                  hg: hg,
                                  text: S
                                      .of(context)
                                      .percentvalue(investment.tir))),
                          Expanded(
                            child: BtnPink(
                                metod: () {
                                  Navigator.push(
                                      context,
                                      Routes().Push(Routes().firstinvest,
                                          AnimatedPage.scale, 200));
                                },
                                height: hg - 5,
                                widget: b3(
                                  text: S.of(context).invest.toUpperCase(),
                                  color: EstiloApp.colorwhite,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ],
                      ),
                      szv(5),
                      Column(
                        children: [
                          LinearProgressIndicator(
                            minHeight: 4,
                            value: percent(
                                investment.required, investment.invested),
                            color: EstiloApp.primarypink,
                            backgroundColor: EstiloApp.colorwhite,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                EstiloApp.primarypink),
                          ),
                          b1(
                              text: S.of(context).remain(diference(
                                  investment.required, investment.invested))),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
          /*   return ListTile(
            title: Text(
              Investment.invested.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              Investment.invested.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            trailing: BtnPink(
                width: 0.3,
                height: 46,
                widget: t2(
                  text: S.of(context).invest.toUpperCase(),
                  color: EstiloApp.colorwhite,
                  fontWeight: FontWeight.w700,
                )),
            selectedColor: EstiloApp.primarypurple,
            onTap: () => print(index),
          );*/
          /* return Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(18)),
            margin: EdgeInsets.all(5),
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
                                Investment.invested.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                Investment.invested.toString(),
                                maxLines: 4,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                Investment.id.toString(),
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
               
              ],
            ),
          );
       */
        },
        childCount: listItem.length,
      ),
    );
  }
}

class InfoInvet extends StatelessWidget {
  const InfoInvet({
    Key? key,
    required this.hg,
    required this.text,
  }) : super(key: key);

  final double hg;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: kElevationToShadow[1],
        color: EstiloApp.colorwhite,
      ),
      height: hg,
      margin: EdgeInsets.symmetric(
        horizontal: 1,
      ),
      child: t3(text: text),
    );
  }
}
