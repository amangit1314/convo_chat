import 'package:convo_chat/screens/home/home_screen.dart';
import 'package:convo_chat/screens/home/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboard1Screen extends StatelessWidget {
  const Onboard1Screen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff22211f),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/download.png',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xff22211f),
            ),
            child: Column(
              children: <Widget>[
                Center(
                  child: Stack(
                    children: [
                      Image.asset('assets/images/convo_logo.png'),
                      Column(
                        children: const [
                          SizedBox(
                            height: 130,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 53.0),
                            child: Text(
                              'Convo',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontFamily: 'Poppins'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  heightFactor: 2.4,
                ),
                const Text(
                  'Freely chat with anyone!',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Text(
                    'A secured and beautiful app to chat with friends, family and contacts.',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  child: Container(
                    height: 51,
                    width: MediaQuery.of(context).size.width * .8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffffffff),
                      // boxShadow: const [
                      //   BoxShadow(color: Color(0x8C83BDFF), blurRadius: 4)
                      // ],
                    ),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                  onTap: () {
                    Get.to(
                      const Home(
                        child: MyDrawer(),
                      ),
                    );
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
