import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/bloc/loan/loan_bloc.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/models/Loan_model.dart';
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

  final List<Loan> listItem;

  @override
  Widget build(BuildContext context) {
    double hg = 40.0;
    return BlocBuilder<LoanBloc, LoanState>(
      builder: (context, state) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final loan = state.loanlist![index];

              return AnimatedCrossFade(
                duration: Duration(milliseconds: 200),
                crossFadeState: CrossFadeState.showFirst,
                firstChild: GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      context.read<LoanBloc>().add(LoanChangeIndexEvent(
                          pageindex: state.pageindex! - 1));
                    } else if (details.primaryVelocity! < 0) {
                      context.read<LoanBloc>().add(LoanChangeIndexEvent(
                          pageindex: state.pageindex! + 1));
                    }
                  },
                  /*onTap: () {
                    context.read<LoanBloc>().add(LoanSelectEvent(loan: loan));
                    context
                        .read<LoanBloc>()
                        .add(LoanChangeIndexEvent(pageindex: 3));
                    Navigator.push(
                        context,
                        Routes()
                            .Push(Routes().firstinvest, AnimatedPage.scale, 200));
                  },*/
                  child: Padding(
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
                                    child: InfoInvet(
                                        hg: hg, text: S.of(context).id)),
                                Expanded(
                                    child: InfoInvet(
                                        hg: hg, text: S.of(context).amount)),
                                Expanded(
                                    child: InfoInvet(
                                        hg: hg, text: S.of(context).tir)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: InfoInvet(
                                          hg: hg, text: loan.code.toString())),
                                  Expanded(
                                      child: InfoInvet(
                                          hg: hg,
                                          text: S.of(context).currency(
                                              loan.required.toDouble()))),
                                  Expanded(
                                      child: InfoInvet(
                                          hg: hg,
                                          text: S
                                              .of(context)
                                              .percentvalue(loan.tir))),
                                  Expanded(
                                    child: BtnPink(
                                        metod: () {
                                          context
                                              .read<LoanBloc>()
                                              .add(LoanSelectEvent(loan: loan));
                                          context.read<LoanBloc>().add(
                                              LoanChangeIndexEvent(
                                                  pageindex: 3));
                                          Navigator.push(
                                              context,
                                              Routes().Push(
                                                  Routes().firstinvest,
                                                  AnimatedPage.scale,
                                                  200));
                                        },
                                        height: hg - 5,
                                        widget: b3(
                                          text: S
                                              .of(context)
                                              .invest
                                              .toUpperCase(),
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
                                    minHeight: 5,
                                    value:
                                        percent(loan.required, loan.invested) *
                                            0.01,
                                    color: EstiloApp.primarypink,
                                    backgroundColor: EstiloApp.primarypink[700],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        EstiloApp.primarypink),
                                  ),
                                  b1(
                                      color: EstiloApp.primaryblue,
                                      text: S.of(context).remain(diference(
                                          loan.required, loan.invested))),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                secondChild: Container(),
              );
            },
            childCount: state.loanlist!.length,
          ),
        );
      },
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
      child: t3(color: EstiloApp.primaryblue, text: text),
    );
  }
}

class StateChangeAnimationController extends AnimationController {
  StateChangeAnimationController({
    required TickerProvider vsync,
    Duration? duration,
  }) : super(vsync: vsync, duration: duration);

  Animation<double> get progressAnimation =>
      Tween<double>(begin: 0, end: 1).animate(this);
}

class StateChangeAnimation extends StatelessWidget {
  final StateChangeAnimationController controller;
  final Widget child;

  StateChangeAnimation({
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.progressAnimation,
      builder: (context, child) {
        return child!;
      },
      child: child,
    );
  }
}
