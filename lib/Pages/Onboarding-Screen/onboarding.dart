import 'package:companycam/Pages/create-new-company.dart';
import 'package:companycam/Widgets/elevated-button.dart';
import 'package:companycam/Widgets/sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final _controller = PageController();
  bool _islastPage = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: 700,
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 10),
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) => setState(() {
                    _islastPage = index == 2;
                  }),
                  children: [
                    pageViewContent(
                        "images/image1.png",
                        "Company Cam",
                        "All your job photos in one place",
                        "Your crew has access to every photo and video taken \nplus you get unlimited storage, so fire away.",
                        Colors.white),
                    pageViewContent(
                        "images/image2.png",
                        "Company Cam",
                        "Stupid simple organization.",
                        "Photos are organized by date and job site, so you"
                            "\n always know when and where they were taken.",
                        Colors.white),
                    pageViewContent(
                        "images/image3.png",
                        "Company Cam",
                        "Keep everyone on the same page.",
                        "No more driving around. Communicate with your \n crew and share job progress directly from the app.",
                        Colors.white),
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const SlideEffect(
                            spacing: 12.0,
                            // radius: 4.0,
                            dotWidth: 10.0,
                            dotHeight: 10.0,
                            paintStyle: PaintingStyle.stroke,
                            strokeWidth: 1,
                            dotColor: Colors.grey,
                            activeDotColor: Colors.orange),
                        onDotClicked: (index) => _controller.animateToPage(
                          index,
                          duration: const Duration(
                            microseconds: 500,
                          ),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              addVerticalSpace(20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(370, 40),
                    textStyle: TextStyle(fontSize: 14),
                    primary: Colors.blue,
                    onPrimary: Colors.black),
                onPressed: () {
                  Get.to(() => const CreateNewCompany(),
                      transition: Transition.circularReveal,
                      duration: const Duration(seconds: 2));
                },
                child: const Text(
                  "Create a New Company",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(370, 40),
                  textStyle: const TextStyle(fontSize: 14),
                  primary: Colors.black,
                  side: BorderSide(width: 1, color: Colors.black),
                  //onPrimary: Colors.blue
                ),
                onPressed: () {},
                child: const Text(
                  "Sign in to an Existing Account",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              // ElevatedButtonStyle.elevatedButton("Create a New Company",
              //     onPressed: () {}),
              // ElevatedButtonStyle.elevatedButton("Sign in to an Existing Account",
              //     onPressed: () {}),
              addVerticalSpace(5),
            ],
          ),
        ],
      ),
    );
  }

  Widget pageViewContent(
      String image, String title, String description, String subtitle, Color colors) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        addVerticalSpace(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/camera.png",
              fit: BoxFit.fill,
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        //addVerticalSpace(20),
        Container(
          color: colors,
          height: 400,
          width: double.infinity,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
