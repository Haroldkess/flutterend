import 'package:flutter/material.dart';
import 'package:flutterend/presentation/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LandingMobile extends StatelessWidget {
  const LandingMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
         Container(
          width: 120.0,
          decoration: BoxDecoration(
            color: kontainerColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: const  [
                CircleAvatar(
                    backgroundColor: Colors.white,
                    child: FlutterLogo(
                      size: 30,
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Flutter",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Dart",
                  style: TextStyle(color: Colors.white54, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric( vertical: 15.0),
          child: Container(
            width: 120.0,
            decoration: BoxDecoration(
              color: kontainerColor1,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      FontAwesomeIcons.database,
                      color: kPrimaryColor,
                      size: 20.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Nosql",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Firebase",
                    style: TextStyle(color: Colors.white54, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 120.0,
          decoration: BoxDecoration(
            color: kontainerColor2,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.tv,
                    color: kPrimaryColor,
                    size: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Build",
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Earn",
                  style: TextStyle(color: Colors.white54, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
