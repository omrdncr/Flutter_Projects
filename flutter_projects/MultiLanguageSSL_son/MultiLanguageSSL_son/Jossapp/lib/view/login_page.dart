import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jossapp/constants/app_constants.dart';
import 'package:jossapp/model/user_request.dart';
import 'package:jossapp/services/login_api_services.dart';
import 'package:jossapp/util/helpers/trans_helper.dart';
import '../services/all_providers.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  late final dtDemo = BadConstants.dtDemo;
  late final dtNow = DateTime.now();

  bool? isDemoFinish;
  //bool isProcessing = false;
  late Duration diff = dtDemo.difference(dtNow);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenHeight = MediaQuery.of(context).size.height;
    UserRequest user = UserRequest(
      password: '',
      userId: '',
    );

    if (dtDemo.year < dtNow.year) {
      isDemoFinish = true;
    } else if (dtDemo.year == dtNow.year) {
      if (dtDemo.month < dtNow.month) {
        isDemoFinish = true;
      } else if (dtDemo.month == dtNow.month) {
        if (dtDemo.day < dtNow.day) {
          isDemoFinish = true;
        } else if (dtDemo.day == dtNow.day) {
          isDemoFinish = true;
        } else {
          isDemoFinish = false;
        }
      } else {
        isDemoFinish = false;
      }
    } else {
      isDemoFinish = false;
    }

    debugPrint("Kalan Gün :${diff.inDays}");
    debugPrint(diff.isNegative.toString());
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: BadColors.stawizWhite,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.4,
                  child: Column(
                    children: [
                      Expanded(flex: 3, child: Container()),
                      Expanded(
                          flex: 5,
                          child: Container(
                            decoration: const BoxDecoration(
                              //color: Colors.deepPurple,
                              image: DecorationImage(
                                  image: ExactAssetImage("lib/assets/logo.png"),
                                  fit: BoxFit.fitHeight),
                            ),
                          )),
                      Expanded(flex: 2, child: Container())
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: screenHeight * 0.6,
                  child: Column(
                    children: [
                      Form(
                        autovalidateMode: AutovalidateMode.always,
                        key: _formKey,
                        child: Column(children: [
                          SizedBox(
                            height: 120,
                            child: TextFormField(
                              enabled: isDemoFinish! ? false : true,
                              maxLength: 20,
                              decoration: InputDecoration(
                                hintText: "l-txt-username".tr(),
                                labelText: "l-txt-username".tr(),
                                prefixIcon: const Icon(
                                  Icons.person,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      color: BadColors.textInputOutlineBorder),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: BadColors.stawizRed),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: BadColors.stawizGreen),
                                ),
                              ),
                              onSaved: (deger) {
                                //button on clickte validator sartları dogru ise tetiklenir.
                                user = user.copyWith(userId: deger);
                              },
                              validator: (deger) {
                                //bu kısımda istediğimiz şartları kontrol edebiliriz
                                if (deger!.isEmpty) {
                                  return "l-err-required".tr();
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.002),
                          SizedBox(
                            height: 120,
                            child: TextFormField(
                              enabled: isDemoFinish! ? false : true,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              maxLength: 30,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "l-txt-password".tr(),
                                labelText: "l-txt-password".tr(),

                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: BadColors.stawizRed),
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(
                                      color: BadColors.textInputOutlineBorder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                      color: BadColors.stawizGreen),
                                ),
                                // hintTextDirection: TextDirection() ,
                              ),
                              onSaved: (deger) {
                                user = user.copyWith(password: deger);
                              },
                              validator: (deger) {
                                //bu kısımda istediğimiz şartları kontrol edebiliriz
                                if (deger!.isEmpty) {
                                  return "l-err-required".tr();
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ]),
                      ),
                      ///////////////////////////--------------------------------/////////////////////////
                      //////////////////////////////--------------------------------/////////////////////////
                      //////////////////////////////--------------------------------/////////////////////////
                      //////////////////////////////--------------------------------/////////////////////////
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.04),
                        child: ElevatedButton(
                          onPressed: () {
                            if (isDemoFinish! == true) {
                              Fluttertoast.showToast(
                                  toastLength: Toast.LENGTH_LONG,
                                  backgroundColor: BadColors.stawizRed,
                                  textColor: BadColors.stawizWhite,
                                  msg: "l-toast-trailexpired".tr());
                            } else {
                              if (_formKey.currentState!.validate()) {
                                // isProcessing =
                                //     true; //text fieldlar validate ise butonu kaldırıp circleindicator koy

                                _formKey.currentState!.save();
                                //postHttp(user.userId, user.password);

                                //BURADA KALDIM RETURN ALAMIYORUYM GELİNCE DEVAM
                                LoginApiServices(
                                        userId: user.userId,
                                        password: user.password)
                                    .postLoginApi()
                                    .then((value) {
                                  // isProcessing =
                                  //     false; // apiden cevap dönünce circleindicator kaldırıp butonu koy
                                  if (value == 500) {
                                    //isProcessing = false;

                                    AnimatedSnackBar.rectangle(
                                      "l-err-logfailed".tr(),
                                      "l-err-occured".tr(),
                                      type: AnimatedSnackBarType.error,
                                      brightness: Brightness.dark,
                                    ).show(
                                      context,
                                    );
                                  } else {
                                    //debugPrint("Melit: $value");
                                    ref
                                        .read(presetStateNotifierProvider
                                            .notifier)
                                        .aracDoldur(
                                            customcustomername: user.userId);

                                    debugPrint(ref
                                        .watch(presetStateNotifierProvider)
                                        .toString());

                                    Navigator.pushReplacementNamed(
                                        context, '/vechiles',
                                        arguments: value);
                                  }
                                }, onError: (exception) {
                                  if (exception != null) {
                                    AnimatedSnackBar.rectangle(
                                      "l-err-logfailed".tr(),
                                      exception.toString(),
                                      type: AnimatedSnackBarType.error,
                                      brightness: Brightness.dark,
                                    ).show(
                                      context,
                                    );
                                  }
                                });

                                debugPrint(
                                    "UserId: ${user.userId}\nPassword: ${user.password}");
                              } else {
                                AnimatedSnackBar.rectangle(
                                  "l-snack-err".tr(),
                                  "l-snack-fillreq".tr(),
                                  type: AnimatedSnackBarType.error,
                                  brightness: Brightness.dark,
                                ).show(
                                  context,
                                );
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 8, right: 10, top: 8, left: 10),
                            child: Text(
                              "l-btn-login".tr(),
                              style: const TextStyle(
                                  color: BadColors.stawizWhite, fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                      //Demo sürümüne özel 30 günlük giriş izni
                      isDemoFinish! == true
                          ? Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: AutoSizeText(
                                    "l-txt-trailexp".tr(),
                                    style: const TextStyle(
                                        color: BadColors.stawizGrey),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(10),
                              child: Center(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: AutoSizeText(
                                      TransHelper.getDeviceLanguage(
                                          context, "traildays", diff.inDays),
                                      style: const TextStyle(
                                          color: BadColors.stawizDarkGreen)),
                                ),
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
