import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/bloc/loan/loan_bloc.dart';
import 'package:sfs_inversor/src/controller/Loan/loan_controller.dart';
import 'package:sfs_inversor/src/services/Functions.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/exportwidgets.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Firstinvest extends StatefulWidget {
  const Firstinvest({Key? key}) : super(key: key);

  @override
  _FirstinvestState createState() => _FirstinvestState();
}

class _FirstinvestState extends State<Firstinvest>
    with SingleTickerProviderStateMixin {
  final con = LoanController();
  String tx = lorem(paragraphs: 1, words: 20);
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
    lowerBound: 0.8,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    con.valueinvested.text = con.min.toString();
    super.dispose();
  }

  String values = '';

  final drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    con.context = context;
    return ZoomDrawerZ(
      drawerController: drawerController,
      child: BlocConsumer<LoanBloc, LoanState>(
        listener: (context, state) {
          if (state.loan == null) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          con.Loan = state.loan;
          con.max = diference(con.Loan!.required, con.Loan.invested);
          return Scaffold(
              appBar: AppBar(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    /*LeadingDrawer(
                    drawer: drawerController,
                  ),*/
                    const LeadingBack(),
                  ],
                ),
                title: H3(
                    color: EstiloApp.colorwhite,
                    text: S.of(context).investment),
                actions: [const ActionNotification()],
              ),
              body: body());
        },
      ),
    );
  }

  Widget body() {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: MediaQuery.of(context).size.width * 0.1),
          child: BtnDegraded(
              width: 0.9,
              widget: H3(
                text: S.of(context).confirmInvestment,
                color: EstiloApp.colorwhite,
              )),
        ),
        Container(
          decoration: EstiloApp.decorationBoxwhite,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 5,
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(4),
                child: Column(
                  children: <Widget>[
                    t2(
                      text: S.of(context).percentvalue(
                          percent(con.Loan.required, con.Loan.invested)),
                      fontWeight: FontWeight.bold,
                      color: EstiloApp.primaryblue,
                    ),
                    LinearProgressIndicator(
                      minHeight: 8,
                      value:
                          percent(con.Loan.required, con.Loan.invested) * 0.01,
                      color: EstiloApp.primarypink,
                      backgroundColor: EstiloApp.primarypink[700],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(EstiloApp.primarypink),
                    ),
                    szv(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            t2(
                                fontWeight: FontWeight.bold,
                                color: EstiloApp.primaryblue,
                                text: S
                                    .of(context)
                                    .currency(con.Loan.invested.toDouble())),
                            Row(
                              children: [
                                t3(
                                  text: S.of(context).percentvalue(percent(
                                      con.Loan.required, con.Loan.invested)),
                                  fontWeight: FontWeight.w400,
                                  color: EstiloApp.primarypink,
                                ),
                                szh(2),
                                t3(
                                    fontWeight: FontWeight.w400,
                                    color: EstiloApp.primaryblue,
                                    text: S.of(context).collected),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            t2(
                                fontWeight: FontWeight.bold,
                                color: EstiloApp.primaryblue,
                                text: S
                                    .of(context)
                                    .currency(con.Loan.required.toDouble())),
                            t3(
                                fontWeight: FontWeight.w400,
                                color: EstiloApp.primaryblue,
                                text: S.of(context).purpose),
                          ],
                        ),
                      ],
                    ),
                    szv(10),
                    Column(
                      children: [
                        t1(
                            fontWeight: FontWeight.bold,
                            color: EstiloApp.primaryblue,
                            text: S.of(context).currency(con.max)),
                        t2(
                            fontWeight: FontWeight.w400,
                            color: EstiloApp.primarypink,
                            text: 'Faltante'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                decoration: EstiloApp.decorationBoxwhite,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Stack(
                  children: [
                    LineChartBackground(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      max: con.max,
                      value: con.value,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 160,
                          child: Stack(
                            children: [
                              SleekCircularSlider(
                                appearance: CircularSliderAppearance(
                                    size: 150,
                                    customWidths:
                                        EstiloApp.customWidthCirculaSlider,
                                    animDurationMultiplier: 1.0,
                                    customColors:
                                        EstiloApp.customColorCirculaSlider),
                                onChangeStart: (value) =>
                                    _animationController.repeat(),
                                onChangeEnd: (value) {
                                  _animationController.stop();
                                  setState(() {
                                    _animationController.value = 1;
                                  });
                                },
                                innerWidget: (percentage) {
                                  return Center(
                                      child: TextfieldClear(
                                          prefixicon: const Padding(
                                            padding: EdgeInsets.only(top: 5),
                                            child: H3(text: '\$'),
                                          ),
                                          inputType: TextInputType.number,
                                          validator: (value) {
                                            return doublevalidator(value!,
                                                context, con.max, con.min);
                                          },
                                          onchange: (value) {
                                            con.onchange(value);
                                            setState(() {});
                                          },
                                          controlador: con.valueinvested));
                                },
                                min: con.min,
                                max: con.max,
                                initialValue: con.value,
                                onChange: (double newValue) {
                                  con.onchangecircular(newValue);
                                  setState(() {});
                                },
                              ),
                              Positioned(
                                bottom: 0,
                                left: 5,
                                child: Column(
                                  children: [
                                    t1(
                                        fontWeight: FontWeight.bold,
                                        color: EstiloApp.primaryblue,
                                        text: con.Loan.months.toString()),
                                    b2(
                                        fontWeight: FontWeight.w400,
                                        color: EstiloApp.primaryblue,
                                        text: S.of(context).monthSamplePlural(
                                            con.Loan.months)),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 5,
                                child: Column(
                                  children: [
                                    t1(
                                        fontWeight: FontWeight.bold,
                                        color: EstiloApp.primaryblue,
                                        text: S
                                            .of(context)
                                            .percentvalue(con.Loan.tir)),
                                    b2(
                                        fontWeight: FontWeight.w400,
                                        color: EstiloApp.primaryblue,
                                        text: S.of(context).tir),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return AnimatedOpacity(
                                duration: const Duration(seconds: 1),
                                opacity: _animationController.value,
                                child: Container(
                                  //width: 70,
                                  margin: const EdgeInsets.all(20),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                              255, 255, 255, 255)
                                          .withOpacity(0.5),
                                      border: Border.all(
                                          width: 0.05,
                                          color: EstiloApp.colorwhite),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color.fromARGB(
                                                  255, 146, 145, 145)
                                              .withOpacity(0.3),
                                          //color: EstiloApp.colorblack,
                                          blurRadius: 6,
                                          offset: const Offset(3, 2),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: IntrinsicHeight(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        t1(
                                            fontWeight: FontWeight.w400,
                                            color: EstiloApp.primaryblue,
                                            text: S.of(context).investment),
                                        Expanded(
                                          child: TextfieldClear(
                                              prefixicon: const H3(text: '\$'),
                                              inputType: TextInputType.number,
                                              validator: (value) {
                                                return doublevalidator(value!,
                                                    context, con.max, con.min);
                                              },
                                              onchange: (value) {
                                                con.onchange(value);
                                                setState(() {});
                                              },
                                              controlador: con.valueinvested),
                                        ),
                                        dvh(),
                                        t1(
                                            fontWeight: FontWeight.w400,
                                            color: EstiloApp.primaryblue,
                                            text: S.of(context).youllget),
                                        H3(
                                            fontWeight: FontWeight.bold,
                                            color: EstiloApp.primaryblue,
                                            text: S
                                                .of(context)
                                                .currency(con.earning)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              szv(10),
              b3(
                text: tx,
                color: EstiloApp.primaryblue,
              ),
              szv(5),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: MediaQuery.of(context).size.width * 0.3),
                child: BtnDegraded(
                    widget: t3(
                  text: S.of(context).next,
                  color: EstiloApp.colorwhite,
                )),
              )
            ],
          ),
        )
        //  AmortizationTable(amortization: calculo())
      ],
    );
  }
}
