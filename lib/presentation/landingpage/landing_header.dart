import 'package:flutter/material.dart';
import 'package:flutterend/presentation/landingpage/get_started.dart';

import '../constant.dart';
import '../responsive/responsive_config.dart';
import 'SizeConfig.dart';

class LandingHeader extends StatelessWidget {
  final GlobalKey<ScaffoldState> myKey;
  LandingHeader({Key? key, required this.myKey}) : super(key: key);
          TextEditingController name = TextEditingController();
            TextEditingController email = TextEditingController();
            TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal:
                  Responsive.isDesktop(context) || Responsive.isTablet(context)
                      ? 5 * SizeConfig.widthMultiplier!
                      : 10),
          child: Responsive.isDesktop(context) || Responsive.isTablet(context)
              ? Row(
                  children: [
                    Text(
                      appName,
                      style: const TextStyle(
                          fontFamily: 'Raleway',
                          color: Color(0xff5956E9),
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 5 * SizeConfig.widthMultiplier!,
                    ),
                    InkWell(
                      onTap: () {
                        //    Navigator.pop(context);
                        // Navigator.pushAndRemoveUntil(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => MyApp()),
                        //     (route) => false);
                      },
                      child: Text(
                        "Home",
                        style: TextStyle(
                          color: Color(0xff5956E9),
                          fontFamily: 'Raleway',
                          fontSize: 1 * SizeConfig.textMultiplier!,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5 * SizeConfig.widthMultiplier!,
                    ),

                    InkWell(
                      onTap: () {
                        GetStarted.AboutUs(context);
                      },
                      child: Text(
                        "About us",
                        style: TextStyle(
                          color: Color(0xff5956E9),
                          fontFamily: 'Raleway',
                          fontSize: 1 * SizeConfig.textMultiplier!,
                        ),
                      ),
                    ),
                    //   SizedBox(
                    //     width: 5 * SizeConfig.widthMultiplier!,
                    //   ),
                    //   GestureDetector(
                    // //    onTap: () => showToast('Not available for now'),
                    //     child: Text(
                    //       "Blog",
                    //       style: TextStyle(
                    //         color: kPrimaryColor,
                    //           fontFamily: 'Raleway',
                    //         fontSize: 1 * SizeConfig.textMultiplier!,
                    //       ),
                    //     ),
                    //   ),
                    SizedBox(
                      width: 5 * SizeConfig.widthMultiplier!,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Policy",
                        style: TextStyle(
                          color: Color(0xff5956E9),
                          fontFamily: 'Raleway',
                          fontSize: 1 * SizeConfig.textMultiplier!,
                        ),
                      ),
                    ),

                    Spacer(),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 20.0,
                        // background color
                        primary: Color(0xff5956E9),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: TextStyle(
                          fontSize: 1 * SizeConfig.textMultiplier!,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            color: Colors.white,
                            fontSize: 1 * SizeConfig.textMultiplier!,
                          ),
                        ),
                      ),
                      onPressed: () {
                        GetStarted.Info(context, name,email,phone);
                      },
                    ),

                    // Icon(Icons.search, size: 3 * SizeConfig.imageSizeMultiplier!, color: Colors.white,),
                  ],
                )
              : Row(
                  children: [
                    IconButton(
                        onPressed: () => myKey.currentState!.openDrawer(),
                        icon: Icon(
                          Icons.menu,
                        )),
                    Text(
                      appName,
                      style: const TextStyle(
                          fontFamily: 'Raleway',
                          color: Color(0xff5956E9),
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700),
                    ),

                    Spacer(),

                    Responsive.isDesktop(context) ||
                            Responsive.isTablet(context)
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 20.0,
                              // background color
                              primary: Color(0xff5956E9),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                              textStyle: TextStyle(
                                fontSize: 1 * SizeConfig.textMultiplier!,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Get Started',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 1.5 * SizeConfig.textMultiplier!,
                                ),
                              ),
                            ),
                            onPressed: () {
                              GetStarted.Info(context, name,email,phone);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             RegisterationScreen()));
                            },
                          )
                        : SizedBox.shrink(),

                    // Icon(Icons.search, size: 3 * SizeConfig.imageSizeMultiplier!, color: Colors.white,),
                  ],
                ),
        ),
      ),
    );
  }
}
