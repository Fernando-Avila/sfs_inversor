import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/bloc/auth/auth_bloc.dart';
import 'package:sfs_inversor/src/bloc/bloc/investment_bloc.dart';
import 'package:sfs_inversor/src/bloc/loan/loan_bloc.dart';

import 'package:sfs_inversor/src/bloc/notification/notification_bloc.dart';
import 'package:sfs_inversor/src/bloc/terms/terms_bloc.dart';
import 'package:sfs_inversor/src/bloc/theme/theme_bloc.dart';
import 'package:sfs_inversor/src/bloc/user/user_bloc.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/pages/principal/splashScreen.dart';
import 'package:sfs_inversor/src/styles/app_themes.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

Future<void> main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTheme? curtheme = AppTheme.lightTheme;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => TermsBloc(),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => NotificationBloc(),
        ),
        BlocProvider(
          create: (context) => LoanBloc(),
        ),
        BlocProvider(
          create: (context) => InvestmentBloc(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeInitial>(
        builder: (BuildContext context, themestate) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.id,
            routes: Routes().routes(),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: themestate.themeData,
            supportedLocales: S.delegate.supportedLocales,
            title: 'Material App',
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeInitial>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Switch(
                  value: state.themeData ==
                          AppThemes.appThemeData[AppTheme.darkTheme]
                      ? true
                      : false,
                  onChanged: (val) {
                    AppTheme curtheme;
                    val
                        ? curtheme = AppTheme.darkTheme
                        : curtheme = AppTheme.lightTheme;
                    context
                        .read<ThemeBloc>()
                        .add(ThemeChangeEvent(appTheme: curtheme));
                  })
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: ListTile(
                  leading: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        S.load(const Locale('en'));
                      });
                    },
                    child: const Text('ENGLISH'),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        S.load(const Locale('de'));
                      });
                    },
                    child: const Text('GERMAN'),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).pageHomeListTitle,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      H1(text: 'hola Munod'),
                      H1(
                        text: S
                            .of(context)
                            .pageHomeSamplePlaceholder('Johnathan'),
                      ),
                      Text(
                        S.of(context).pageHomeSamplePlaceholder('John'),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        S
                            .of(context)
                            .pageHomeSamplePlaceholdersOrdered('John', 'Doe'),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        S.of(context).pageHomeSamplePlural(2),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        S.of(context).pageHomeSampleTotalAmount(2500.0),
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        S.of(context).pageHomeSampleCurrentDateTime(
                            DateTime.now(), DateTime.now()),
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ))
            ],
          ),
        );
      },
    );
  }

  _setTheme(bool val) {}
}
