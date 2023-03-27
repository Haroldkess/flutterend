import 'package:flutter/material.dart';

import 'SizeConfig.dart';
import 'get_started.dart';

class DrawerMobile extends StatelessWidget {
   DrawerMobile({super.key});
        TextEditingController name = TextEditingController();
            TextEditingController email = TextEditingController();
            TextEditingController phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Color(0xff5956E9),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: const [
                        BackButton(
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                        //    selectedTileColor: secondaryColor,
                        onTap: () {
                          GetStarted.AboutUs(context);
                        },
                        leading: const Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "About us",
                          style: TextStyle(color: Colors.white),
                        )),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Divider(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 20.0,
                        // background color
                        primary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: TextStyle(
                          fontSize: 1 * SizeConfig.textMultiplier!,
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              color: Color(0xff5956E9),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () {
                        GetStarted.Info(context,name,email,phone);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             RegisterationScreen()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
