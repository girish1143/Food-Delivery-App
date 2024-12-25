import 'package:flutter/material.dart';
import 'package:pro/pages/signup.dart';
import 'package:pro/widget/content_model.dart';
import 'package:pro/widget/widget_support.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF6A1B9A), // Purple
                  Color(0xFF42A5F5), // Blue
                ],
              ),
            ),
          ),
          // Onboarding Content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // PageView Section
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image
                          Image.asset(
                            contents[i].image,
                            height: 300,
                            width: MediaQuery.of(context).size.width / 1.5,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 40.0),
                          // Title
                          Text(
                            contents[i].title,
                            style: AppWidget.semiBoldTextFeildStyle().copyWith(
                              fontSize: 22,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20.0),
                          // Description
                          Text(
                            contents[i].description,
                            style: AppWidget.LightTextFeildStyle().copyWith(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Dot Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  contents.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 10.0,
                    width: currentIndex == index ? 20 : 10,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: currentIndex == index
                          ? Colors.white
                          : Colors.white38,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              // Next / Get Started Button
              GestureDetector(
                onTap: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Container(
                  height: 60,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6A1B9A), Color(0xFF42A5F5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      currentIndex == contents.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
            ],
          ),
        ],
      ),
    );
  }
}
