import 'package:firstday/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class boaRD extends StatefulWidget {
  @override
  State<boaRD> createState() => _boaRDState();
}

class _boaRDState extends State<boaRD> {
  final controller = PageController();
  bool isLastPage = false;
  late double _onBoardValue = 0.25;
  @override
  void initState() {
    _onBoardValue = 0.25;
    super.initState();
  }

  _progressBoard(int position) {
    _onBoardValue = 0.25 * position;
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  Widget buildPage({
    required Color color,
    required String title,
    required String description,
    required String image,
  }) =>
      Container(
        color: color,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              height: MediaQuery.of(context).size.height * 0.56,
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            )
          ]),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 3;
                _progressBoard(index + 1);
              });
            },
            children: [
              buildPage(
                  color: Colors.white,
                  title: 'Connect with People',
                  description:
                      'Immerse yourself in other cultures and new ways of life. Don\t limit yourself to just travel,but instead live the experience just like a local',
                  image: 'assets/hero-1.png'),
              buildPage(
                  color: Colors.white,
                  title: 'Discover and enjoy',
                  description:
                      'Discover new places, routes, monuments, movie panaromas and charmming hideaways through the app',
                  image: 'assets/hero-2.png'),
              buildPage(
                  color: Colors.white,
                  title: 'Share your experience',
                  description:
                      'The app allows you to share your routes, upload photos and leave comments. Interact with other users and be a part of the travelling community',
                  image: 'assets/hero-3.png'),
              buildPage(
                  color: Colors.white,
                  title: 'Shave your favourites',
                  description:
                      'Save the routes and places you like the most and make planning your trip both easy and fun',
                  image: 'assets/hero-1.png'),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? Container(
                height: 130, //
                width: 380, //
                child: Stack(children: [
                  Center(
                    child: Container(
                      height: 83, //
                      width: 83,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xFF41b883)),
                        value: _onBoardValue,
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Color(0xFF41b883),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            )),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => loginScreen());
                          },
                          child: Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                        spacing: 12,
                        dotColor: Color(0xFF41b883),
                        activeDotColor: Colors.teal.shade100,
                      ),
                    ),
                  )
                ]),
              )
            : Container(
                height: 130, //
                width: 380, //
                child: Stack(children: [
                  Center(
                    child: Container(
                      height: 83, //
                      width: 83,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Color(0xFF41b883)),
                        value: _onBoardValue,
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        controller.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Color(0xFF41b883),
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            )),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 4,
                      effect: WormEffect(
                        spacing: 12,
                        dotColor: Color(0xFF41b883),
                        activeDotColor: Colors.teal.shade100,
                      ),
                    ),
                  )
                ]),
              ),
      ),
    );
  }
}
