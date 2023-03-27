import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterend/presentation/landingpage/get_started.dart';
import 'package:flutterend/presentation/landingpage/landing_desktop.dart';
import 'package:flutterend/presentation/landingpage/landing_mobile.dart';
import 'package:flutterend/presentation/landingpage/landing_tablet.dart';
import 'package:flutterend/presentation/landingpage/socialmedia.dart';
import 'package:flutterend/presentation/responsive/responsive_config.dart';
import 'package:flutterend/presentation/responsive/ui_manager.dart';
import 'package:flutterend/widgets/clock.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';
import 'SizeConfig.dart';
import 'drawer_mobile.dart';
import 'landing_header.dart';

// class LandHere extends StatefulWidget {
//   // This widget is the root of your application.
//   @override
//   _LandHereState createState() => _LandHereState();
// }

// class _LandHereState extends State<LandHere> {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     return LayoutBuilder(builder: (context, constraints) {
//       return OrientationBuilder(builder: (context, orientation) {
//         SizeConfig().init(constraints, orientation);
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'ShopYou',
//           theme: ThemeData(
//             primarySwatch: Colors.purple,
//           ),
//           home: StayHome(),
//         );
//       });
//     });
//   }
// }

String? link;

class StayHome extends StatefulWidget {
  const StayHome({Key? key}) : super(key: key);

  @override
  State<StayHome> createState() => _StayHomeState();
}

class _StayHomeState extends State<StayHome> {
  final List<Color> _colors = [Colors.white, Colors.blue];
  String? link;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    GetStarted.updateControlInfo(context);
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    UiProvider provider = Provider.of<UiProvider>(context, listen: false);
    UiProvider providerStream = context.watch<UiProvider>();
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _colors,
                stops: [0.4, 0.7]),
          ),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            drawer: DrawerMobile(),
            body: Stack(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left:
                                    Responsive.isDesktop(context) ? 250 : 100),
                            child: Responsive.isDesktop(context) ||
                                    Responsive.isTablet(context)
                                ? const Image(
                                    image:
                                        AssetImage('assets/EllipseMorado.png'))
                                : const SizedBox.shrink(),
                          ),
                          ShaderMask(
                              shaderCallback: (rect) {
                                return const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: FractionalOffset.center,
                                  colors: [Colors.black, Colors.transparent],
                                ).createShader(rect);
                              },
                              blendMode: BlendMode.dstIn,
                              child: Responsive.isDesktop(context) ||
                                      Responsive.isTablet(context)
                                  ? const Image(
                                      image:
                                          AssetImage('assets/EllipseRosa.png'),
                                      fit: BoxFit.contain)
                                  : const SizedBox.shrink()),
                        ],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        physics: Responsive.isDesktop(context)
                            ? NeverScrollableScrollPhysics()
                            : AlwaysScrollableScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              LandingHeader(
                                myKey: scaffoldKey,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.48,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          vertical: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            physics: Responsive.isDesktop(
                                                    context)
                                                ? const NeverScrollableScrollPhysics()
                                                : AlwaysScrollableScrollPhysics(),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Responsive.isDesktop(context)
                                                    ? Row(
                                                        children: const [
                                                          Expanded(
                                                            // width: MediaQuery.of(
                                                            //             context)
                                                            //         .size
                                                            //         .width *
                                                            //     0.3,
                                                            child: Text(
                                                              "Become a fullstack flutter developer before 2024",
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff5956E9),
                                                                  fontFamily:
                                                                      'Raleway',
                                                                  fontSize:
                                                                      40.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 5),
                                                            child: Image(
                                                                height: 100,
                                                                // width: 50,
                                                                image: AssetImage(
                                                                    'assets/no_favorites.png')),
                                                          ),
                                                        ],
                                                      )
                                                    : const SizedBox.shrink(),
                                                Responsive.isDesktop(context)
                                                    ? const SizedBox(
                                                        height: 20.0,
                                                      )
                                                    : const SizedBox.shrink(),
                                                // const Text(
                                                //   "Become a fullstack developer and earn.  \nWork with a team and build projects together",
                                                //   style: TextStyle(
                                                //     fontFamily: 'Raleway',
                                                //     color: kPrimaryColor,
                                                //     fontSize: 16.0,
                                                //   ),
                                                // ),
                                                // const SizedBox(
                                                //   height: 50.0,
                                                // ),
                                                Text(
                                                  "Learn, Build & Get Your First Flutter Job!",
                                                  style: TextStyle(
                                                      color: Responsive
                                                                  .isDesktop(
                                                                      context) ||
                                                              Responsive
                                                                  .isTablet(
                                                                      context)
                                                          ? kPrimaryColor
                                                          : Color(0xff5956E9),
                                                      fontFamily: 'Raleway',
                                                      fontSize: 20.0,
                                                      fontWeight: Responsive
                                                                  .isDesktop(
                                                                      context) ||
                                                              Responsive
                                                                  .isTablet(
                                                                      context)
                                                          ? FontWeight.w400
                                                          : FontWeight.w600),
                                                ),
                                                const SizedBox(
                                                  height: 20.0,
                                                ),
                                                const Text(
                                                  "Create sustainable and scalable softwares that develop the world.",
                                                  style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontFamily: 'Raleway',
                                                    fontSize: 14.0,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 50.0,
                                                ),
                                                const Responsive(
                                                    mobile: LandingMobile(),
                                                    desktop: LandingDesktop(),
                                                    tablet: LandingTablet())
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    Stack(
                                      children: [
                                        Align(
                                            alignment:
                                                Responsive.isDesktop(context)
                                                    ? Alignment.bottomRight
                                                    : Alignment.topRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: Responsive.isDesktop(
                                                          context)
                                                      ? 2.0
                                                      : 0.5,
                                                  left: Responsive.isDesktop(
                                                          context)
                                                      ? 10.0
                                                      : 3.0),
                                              child: Responsive.isDesktop(
                                                      context)
                                                  ? Image.asset(
                                                      "assets/splash.png")
                                                  : Container(
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height /
                                                              1.2,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              2,
                                                      decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                "assets/splash.png",
                                                              ),
                                                              fit: BoxFit.contain)),
                                                    ),
                                            )),
                                        Positioned(
                                            left: 30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: const [
                                                FlutterLogo(
                                                  size: 10,
                                                ),
                                                FlutterLogo(
                                                  size: 20,
                                                ),
                                                FlutterLogo(
                                                  size: 30,
                                                ),
                                                FlutterLogo(
                                                  size: 40,
                                                ),
                                                FlutterLogo(
                                                  size: 50,
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Positioned(
                      //     bottom: 50.0, right: 30.0, child: SocialMedia())

                      // const Align(
                      //     alignment: Alignment.bottomCenter, child: Clock())
                    ],
                  ),
                ),
                providerStream.paid
                    ? AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        content: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20.0,
                                  top: 45.0 + 2.0,
                                  right: 20.0,
                                  bottom: 20.0),
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        //   height: 500,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 2 * 2,
                                              vertical: 2 * 2),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.green),
                                                child: const Padding(
                                                  padding: EdgeInsets.all(20.0),
                                                  child: Icon(
                                                    Icons.done,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              const Text(
                                                "Welcome to flutterend!!!",
                                                textScaleFactor: 1.3,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const Text(
                                                "Click the button below to join the community.",
                                                textScaleFactor: 1,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      elevation: 20.0,
                                                      // background color
                                                      primary: const Color(
                                                          0xff5956E9),
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 30,
                                                          vertical: 15),
                                                      textStyle: TextStyle(
                                                        fontSize: 1 *
                                                            SizeConfig
                                                                .textMultiplier!,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        'Join Discord',
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 1.5 *
                                                              SizeConfig
                                                                  .textMultiplier!,
                                                        ),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      _launchInWebViewOrVC(
                                                          discordLink);
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        provider.hasPaid(false);
                                                      },
                                                      child: const Text(
                                                        "Close",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                      ))
                                                ],
                                              )
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
                      )
                    : SizedBox.shrink()
              ],
            ),
          ),
        );
      });
    });
  }

  _launchInWebViewOrVC(String urlLink) async {
    link = urlLink;
    if (await canLaunch(link!)) {
      await launch(
        link!,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $link';
    }
  }
}
