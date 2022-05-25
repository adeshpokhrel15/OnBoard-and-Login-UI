import 'package:firstday/screens/animatedIndicator.dart';
import 'package:firstday/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onboarding extends StatefulWidget {
  // const onboarding(
  //     {Key? key,
  //     required this.page,
  //     required List list,
  //     required PageController controller,
  //     required this.showAnimatedContainerCallBack})
  //     : _list = list,
  //       _controller = controller,
  //       super(key: key);

  // final int page;
  // final List _list;
  // final PageController _controller;
  // final Function showAnimatedContainerCallBack;

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  final controller = PageController();
  bool isLastPage = false;
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            image,
            height: 450,
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
              setState(() => isLastPage = index == 3);
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
            ? TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: Colors.white,
                    backgroundColor: Colors.orange,
                    minimumSize: const Size.fromHeight(80)),
                onPressed: () {
                  Get.to(() => loginScreen());
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
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
                        valueColor: AlwaysStoppedAnimation(Colors.orange),
                        value: 0.25,
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: Colors.red,
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
                ]),

                /////yaha bata
                // height: 80,
                // color: Colors.pinkAccent,
                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                // TextButton(
                //   child:
                //       Text('Skip', style: TextStyle(color: Colors.white)),
                //   onPressed: () => controller.jumpToPage(3),
                // ),
                //     Center(
                //       child: SmoothPageIndicator(
                //         controller: controller,
                //         count: 4,
                //         effect: WormEffect(
                //           spacing: 12,
                //           dotColor: Colors.orange,
                //           activeDotColor: Colors.teal.shade100,
                //         ),
                //         onDotClicked: (index) => controller.animateToPage(index,
                //             duration: const Duration(milliseconds: 300),
                //             curve: Curves.ease),
                //       ),
                //     ),
                //     TextButton(
                //       child:
                //           Text('Next', style: TextStyle(color: Colors.white)),
                //       onPressed: () => controller.nextPage(
                //         duration: Duration(milliseconds: 300),
                //         curve: Curves.easeIn,
                //       ),
                //     ),
                //   ],
                // ),
              ),
      ),
    );
  }
}
