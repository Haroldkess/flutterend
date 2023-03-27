import 'package:flutter/material.dart';
import 'package:flutterend/model/control.dart';
import 'package:flutterend/model/user_model.dart';
import 'package:flutterend/presentation/landingpage/form.dart';
import 'package:flutterend/widgets/clock.dart';
import 'package:provider/provider.dart';
import 'package:flutter_paystack_client/flutter_paystack_client.dart';
import 'package:shimmer/shimmer.dart';
import '../../services/database.dart';
import '../../toast.dart';
import '../constant.dart';
import '../responsive/ui_manager.dart';
import 'SizeConfig.dart';

class GetStarted {
  static Future<void> Info(BuildContext buildContext,TextEditingController name,TextEditingController email,TextEditingController phone) async {
    return await showDialog(
        context: buildContext,
        barrierDismissible: true,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
    
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 20.0, top: 45.0 + 2.0, right: 20.0, bottom: 20.0),
                    margin: EdgeInsets.only(top: 45.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              //   height: 500,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2 * 2, vertical: 2 * 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          "Register",
                                          textScaleFactor: 1.3,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    TextFieldWidget(
                                        title: "name",
                                        maxLine: 2,
                                        controller: name),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFieldWidget(
                                        title: "email",
                                        maxLine: 2,
                                        controller: email),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextFieldWidget(
                                        title: "phone",
                                        maxLine: 2,
                                        controller: phone),
                                    const SizedBox(
                                      height: 22,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 20.0,
                                            // background color
                                            primary: Color(0xff5956E9),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            textStyle: TextStyle(
                                              fontSize: 1 *
                                                  SizeConfig.textMultiplier!,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Book Space',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 1.5 *
                                                    SizeConfig.textMultiplier!,
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {
                                            if (name.text.isEmpty ||
                                                email.text.isEmpty ||
                                                phone.text.isEmpty ||
                                                !email.text.contains("@")) {
                                              showToast(
                                                  context,
                                                  "please complete form ",
                                                  errorRed);
                                              return;
                                            } else {
                                              UserModel user = UserModel(
                                                  email: email.text,
                                                  name: name.text,
                                                  phone: phone.text);
                                              makePayment(context, user);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      // width: MediaQuery.of(context)
                                      //         .size
                                      //         .width *
                                      //     0.8,
                                      child: Shimmer.fromColors(
                                          baseColor: Colors.red,
                                          highlightColor: Colors.green,
                                          child: const Text(
                                            "Limited Space. Book now at 50% OFF",
                                            textScaleFactor: 1.2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.w900),
                                          )),
                                    ),
                                    //   Clock()
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0.1,
                    left: 20,
                    right: 20,
                    child: FlutterLogo(
                      size: 50,
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }

  static Future<void> updateControlInfo(BuildContext context) async {
    UiProvider ui = Provider.of(context, listen: false);

    Control controlToUpdate = await DatabaseService.getControl(context);
    //print(controlToUpdate.pubKey);

    try {
      await PaystackClient.initialize(controlToUpdate.pubKey!)
          .whenComplete(() => print("paystack initialized"));
    } catch (e) {
      print(e);
    }

    ui.updateControl(controlToUpdate);
  }

  static Future<void> makePayment(BuildContext context, UserModel user) async {
    UiProvider provider = Provider.of<UiProvider>(context, listen: false);
    provider.load(true);

    int added = 100;
    int resolvedPrice = provider.controls.amount!.toInt() * added;

    try {
      final charge = Charge()
        ..email = user.email
        ..amount = resolvedPrice
        ..reference = 'ref_${DateTime.now().millisecondsSinceEpoch}';
      // ignore: use_build_context_synchronously
      final res = await PaystackClient.checkout(context, charge: charge);

      if (res.status) {
        // ignore: use_build_context_synchronously
        provider.hasPaid(true);
        bool sendOrder = await DatabaseService.addUser(context, user);
        if (sendOrder) {
          provider.load(false);

          // ignore: use_build_context_synchronously
          Navigator.pop(context);
          showToast(context, 'Charge was successful. Ref: ${res.reference}',
              successBlue);
          showToast(
              context,
              'Join our community using the link sent to your mail . ',
              successBlue);
        } else {
          showToast(
              context, 'waiting for network do not Exit page  ', errorRed);
          // ignore: use_build_context_synchronously
          //   bool sendOrder = await DatabaseService.makeOrder(context);
          if (sendOrder) {
            provider.load(false);
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
            showToast(context, 'Charge was successful. Ref: ${res.reference}',
                successBlue);
            showToast(
                context, 'Registeration Completed succseffully ', successBlue);
          }
        }
      } else {
        provider.load(false);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
        showToast(context, 'Failed: ${res.message}', errorRed);
      }
    } catch (error) {
      provider.load(false);
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      print('Payment Error ==> $error');
    }
    // ignore: use_build_context_synchronously
    // Navigator.pop(context);
    provider.load(false);
  }

  static Future<void> AboutUs(BuildContext buildContext) async {
    return await showDialog(
        context: buildContext,
        barrierDismissible: true,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 10.0, top: 45.0 + 2.0, right: 10.0, bottom: 20.0),
                    margin: const EdgeInsets.only(top: 45.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 10),
                              blurRadius: 10),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              //   height: 500,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                shape: BoxShape.rectangle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 2 * 2, vertical: 2 * 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    const Text(
                                      "Welcome to Flutterend",
                                      textScaleFactor: 1.3,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const Text(
                                      "Become a full-stack flutter developer before 2024. Get trained from scratch the concepts of Dart programming, Flutter, and nosql databases. At the end of the training you will be able to build android apps, ios apps, web applications, desktop applications. You will be added to a community group were you will be able to communicate with your mates, all classes will be live streamed and video resources will be made available after each class. It will be a full interactive expereience so feel free to ask all your questions. lets help you land that dream job.",
                                      textScaleFactor: 1,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            elevation: 20.0,
                                            // background color
                                            primary: const Color(0xff5956E9),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 15),
                                            textStyle: TextStyle(
                                              fontSize: 1 *
                                                  SizeConfig.textMultiplier!,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Understood',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 1.5 *
                                                    SizeConfig.textMultiplier!,
                                              ),
                                            ),
                                          ),
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0.1,
                    left: 20,
                    right: 20,
                    child: FlutterLogo(
                      size: 50,
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}
