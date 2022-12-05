import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfs_inversor/generated/l10n.dart';
import 'package:sfs_inversor/src/bloc/terms/terms_bloc.dart';
import 'package:sfs_inversor/src/global/routes.dart';
import 'package:sfs_inversor/src/services/Functions.dart';
import 'package:sfs_inversor/src/controller/UserController.dart';
import 'package:sfs_inversor/src/styles/custom_styles.dart';
import 'package:sfs_inversor/src/widgets/layouts/Textfield.dart';
import 'package:sfs_inversor/src/widgets/layouts/buttons.dart';
import 'package:sfs_inversor/src/widgets/layouts/extras.dart';
import 'package:sfs_inversor/src/widgets/widgettext.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  UserController _con = new UserController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/img/iconlogo.png',
              width: 80,
            ),
            D3(
                text: 'SFS',
                color: EstiloApp.colorwhite,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ],
        ),
      ),
      body: body(),
      /* body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/img/iconlogo.png',
                    width: 80,
                  ),
                  D3(
                      text: 'SFS',
                      color: EstiloApp.colorwhite,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ],
              ),
            ),
          ),
        
        ],
      ),*/
    );
  }

  body() {
    var bloc = context.read<TermsBloc>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: ListView(
        children: [
          Center(child: t1(text: S.of(context).register)),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.all(15),
            decoration: EstiloApp.decorationBoxwhite,
            child: Form(
                key: _con.registerFormKey,
                child: Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    Textfield(
                      controlador: _con.name,
                      placeholder: S.of(context).names,
                      // hintext: 'FirstName',
                    ),
                    Textfield(
                      controlador: _con.lastname,
                      placeholder: S.of(context).lastnames,
                      //hintext: '',
                    ),
                    Textfield(
                      controlador: _con.email,
                      placeholder: S.of(context).mail,
                      hintext: 'email@gmail.com',
                      validator: (value) => emailvalidator(value!, context),
                    ),
                    Textfield(
                      controlador: _con.pass,
                      placeholder: S.of(context).password,
                      obscuretext: _con.visiblepass,
                      hintext: '***********',
                      validator: (value) => passconfirm(value!, context,
                          _con.pass.text, _con.passverify.text),
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              _con.visiblepass = !_con.visiblepass;
                            });
                          },
                          icon: Icon(
                            _con.visiblepass
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).iconTheme.color,
                          )),
                    ),
                    Textfield(
                      controlador: _con.passverify,
                      placeholder: S.of(context).confirmpassword,
                      obscuretext: _con.visiblepass,
                      hintext: '***********',
                      validator: (value) => passconfirm(value!, context,
                          _con.pass.text, _con.passverify.text),
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              _con.visiblepass = !_con.visiblepass;
                            });
                          },
                          icon: Icon(
                            _con.visiblepass
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Theme.of(context).iconTheme.color,
                          )),
                    ),
                    Textfield(
                      controlador: _con.phone,
                      placeholder: S.of(context).phone,
                      inputType: TextInputType.phone,
                    ),
                  ],
                )),
          ),
          BlocBuilder<TermsBloc, TermsState>(
            builder: (_, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                          activeColor: EstiloApp.primarypink,
                          value: state.status,
                          onChanged: (value) {
                            !value!
                                ? bloc.add(TermsChangeEvent(status: value))
                                : Navigator.push(
                                    context,
                                    Routes().Push(Routes().terms,
                                        AnimatedPage.slideright, 500));
                          }),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                Routes().Push(Routes().terms,
                                    AnimatedPage.slideright, 500));
                          },
                          child: t3(
                            text: S.of(context).acepttermsandconditions,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedCrossFade(
                          firstChild: BtnDisable(
                            metod: null,
                            widget: t1(
                              text: S.of(context).signup.toUpperCase(),
                              color: EstiloApp.colorwhite,
                            ),
                          ),
                          secondChild: BtnDegraded(
                            metod: () => _con.RegisterUser(),
                            widget: t1(
                              text: S.of(context).signup.toUpperCase(),
                              color: EstiloApp.colorwhite,
                            ),
                          ),
                          crossFadeState: state.status
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(seconds: 1)),
                      t1(text: S.of(context).or.toLowerCase()),
                      BtnWhiteMarginblue(
                        metod: () async {
                          bloc.add(TermClearEvent());
                          Navigator.pop(context);
                        },
                        widget: t2(
                          text: S.of(context).cancel.toUpperCase(),
                          color: EstiloApp.primaryblue,
                        ),
                      ),
                    ],
                  ),
                  szv(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      t2(text: S.of(context).alreadyregistered),
                      TextButton(
                          onPressed: () {
                            bloc.add(TermClearEvent());
                            Navigator.pop(context);
                          },
                          child: t1(
                            text: S.of(context).login,
                            color: EstiloApp.primarypink,
                          ))
                    ],
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
