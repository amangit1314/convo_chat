import 'package:convo_chat/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboard1Screen extends StatelessWidget {
  const Onboard1Screen({Key? key}) : super(key: key);
  final String assetName = 'assets/download.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff22211f),
      body: Stack(
        children: [
          Image.asset(
            assetName,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff22211f),
            ),
            child: Column(
              children: <Widget>[
                Center(
                  child: Stack(
                    children: [
                      Image.asset('assets/convo_logo.png'),
                      Column(
                        children: [
                          SizedBox(
                            height: 130,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 64.0),
                            child: Text(
                              'Convo',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  heightFactor: 2.45,
                ),
                Text(
                  'Freely chat with anyone!',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                  child: Text(
                    'A secured and beautiful app to experience chat with friends,family and contacts.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  child: Container(
                    height: 51,
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffffffff),
                      boxShadow: [
                        BoxShadow(color: Color(0x8C83BDFF), blurRadius: 4)
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(Home());
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
