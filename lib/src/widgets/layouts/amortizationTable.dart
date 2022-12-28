import 'package:flutter/material.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/exportwidgets.dart';

class AmortizationTable extends StatelessWidget {
  const AmortizationTable({Key? key, required this.amortization})
      : super(key: key);
  final List<List> amortization;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: EstiloApp.decorationBoxwhite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              t3(text: 'N°'),
              t3(text: 'Capital'),
              t3(text: 'Interes'),
              t3(text: 'Recibes'),
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: amortization.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: t3(text: ' ${index + 1}'),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.21,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(148, 172, 167, 169),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [
                                  index * 0.10,
                                  0.4,
                                ],
                                colors: <Color>[
                                  Colors.green,
                                  Colors.transparent
                                ],
                              )),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.centerRight,
                          child: t3(
                              text:
                                  '\$ ${(amortization[index][0]).toStringAsFixed(2)}'),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.21,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(148, 172, 167, 169),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [
                                  (10 - index) * 0.1,
                                  0.4,
                                ],
                                colors: <Color>[Colors.red, Colors.transparent],
                              )),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          alignment: Alignment.centerRight,
                          child: t3(
                              text:
                                  '\$ ${(amortization[index][1]).toStringAsFixed(2)}'),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.21,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          color: Color.fromARGB(41, 0, 23, 92),
                          alignment: Alignment.centerRight,
                          child: t3(
                              text:
                                  '\$ ${(amortization[index][2]).toStringAsFixed(2)}'),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ],
      ),
    );
    ;
  }
}
