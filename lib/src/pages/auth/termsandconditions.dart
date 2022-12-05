import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/bloc/terms/terms_bloc.dart';
import 'package:sfs_inversor/src/bloc/theme/theme_bloc.dart';
import 'package:sfs_inversor/src/global/environment.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Termsandconditions extends StatelessWidget {
  const Termsandconditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController cont;
    return Scaffold(
      appBar: AppBar(
        title: H3(
          text: S.of(context).termconditions,
          color: EstiloApp.colorwhite,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: body(),
    );
  }

  Widget body2() {
    WebViewController? cont;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title: H3(
                  text: S.of(context).termconditions,
                  color: EstiloApp.colorwhite,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            color: EstiloApp.primaryblue,
                            boxShadow: kElevationToShadow[3],
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: t2(
                                text:
                                    'Desliza para aceptar los terminos y condiciones',
                                color: EstiloApp.colorwhite,
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_down_rounded)
                          ],
                        )),
                  ),
                  Expanded(
                    child: WebView(
                      initialUrl: Enviroment().termsandconditionslink,
                      onPageFinished: (url) {
                        print('Se terminó');
                      },
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: EstiloApp.primaryblue,
                          boxShadow: kElevationToShadow[3],
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: t2(
                              text:
                                  'Desliza para aceptar los terminos y condiciones',
                              color: EstiloApp.colorwhite,
                            ),
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded)
                        ],
                      )),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Widget body() {
    return BlocBuilder<TermsBloc, TermsState>(
      builder: (context, state) {
        if (!state.opened) {
          context.read<TermsBloc>().add(TermsOpenChangeEvent(opened: true));
        }
        return Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    color: EstiloApp.primaryblue,
                    boxShadow: kElevationToShadow[3],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: t2(
                        text: S.of(context).swipeterms,
                        color: EstiloApp.colorwhite,
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded)
                  ],
                )),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: WebView(
                      initialUrl: Enviroment().termsandconditionslink,
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: EstiloApp.primaryblue,
                          boxShadow: kElevationToShadow[3],
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: InkWell(
                        onTap: () => context
                            .read<TermsBloc>()
                            .add(TermsChangeEvent(status: !state.status)),
                        child: Row(
                          children: <Widget>[
                            Checkbox(
                                activeColor: EstiloApp.primarypink,
                                checkColor: EstiloApp.colorwhite,
                                focusColor: EstiloApp.colorwhite,
                                hoverColor: EstiloApp.colorwhite,
                                value: state.status,
                                onChanged: (value) => context
                                    .read<TermsBloc>()
                                    .add(TermsChangeEvent(status: value!))),
                            Expanded(
                              child: t2(
                                text: S.of(context).acepttermsandconditions,
                                color: EstiloApp.colorwhite,
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
