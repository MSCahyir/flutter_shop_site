import 'package:ferisoft/constant/app_cons.dart';
import 'package:ferisoft/service/login_service.dart';
import 'package:ferisoft/view/page/home.dart';
import 'package:ferisoft/view/widget/costom_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginService _loginService = LoginService();
  final _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passWordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: context.height(),
          width: context.width(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LOGO",
                style: boldTextStyle(size: 30, color: appColor),
              ),
              40.height,
              Text(
                "Giriş Yap",
                style: boldTextStyle(size: 30),
              ),
              40.height,
              Container(
                width: (MediaQuery.of(context).size.width),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              30.width,
                              Text("E-mail", style: boldTextStyle(size: 15)),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              const Icon(
                                Icons.mail,
                                color: appColor,
                              ),
                              8.width,
                              AppTextField(
                                controller: emailController,
                                focus: emailFocusNode,
                                nextFocus: passWordFocusNode,
                                textFieldType: TextFieldType.EMAIL,
                                decoration: inputDecoration(),
                              ).expand(),
                            ],
                          ),
                        ],
                      ),
                      8.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              30.width,
                              Text("Password", style: boldTextStyle(size: 15)),
                            ],
                          ),
                          5.height,
                          Row(
                            children: [
                              const Icon(
                                Icons.lock,
                                color: appColor,
                              ),
                              8.width,
                              AppTextField(
                                controller: passwordController,
                                focus: passWordFocusNode,
                                maxLines: 1,
                                textFieldType: TextFieldType.PASSWORD,
                                decoration: inputDecoration(),
                              ).expand(),
                            ],
                          ),
                        ],
                      ),
                      18.height,
                      InkWell(
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 161, 13, 13),
                                Color.fromARGB(255, 210, 25, 176),
                                Color.fromARGB(255, 44, 28, 181),
                                Color.fromARGB(255, 28, 181, 61),
                                Color.fromARGB(255, 183, 172, 7),
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(80.0)),
                          ),
                          child: Container(
                            height: 45,
                            constraints: const BoxConstraints(
                                minHeight:
                                    36.0), // min sizes for Material buttons
                            alignment: Alignment.center,
                            child: Text(
                              'Üye Ol',
                              style: boldTextStyle(color: white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _loginService
                                .login(emailController.text,
                                    passwordController.text)
                                .then((value) => value
                                    ? Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const Home()))
                                    : null);
                          }
                        },
                      ).cornerRadiusWithClipRRect(30)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
