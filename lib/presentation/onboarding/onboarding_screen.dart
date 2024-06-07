import 'package:flextravel/constants.dart';
import 'package:flextravel/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 20).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/pic2.jpg'),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  child: Container(
                    height: 280,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Column(
                        children: [
                          const Text(
                            'Disover your next adventure',
                            style: kNunitoSansBold24,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                          const SizedBox(
                            height: 40,
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStateProperty.all(Colors.red[600])),
                              onPressed: () {
                                Get.offAllNamed(AppRoutes.login);
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 35,
                                    width: 35,
                                    decoration: const BoxDecoration(
                                        color: kLynxWhite,
                                        shape: BoxShape.circle),
                                    child: Icon(
                                      Icons.arrow_circle_right,
                                      color: Colors.red[600],
                                    ),
                                  ),
                                  const Text(
                                    'Explore the world now',
                                    style: kNunitoSansSemiBold16NorgheiSilver,
                                  ),
                                  AnimatedBuilder(
                                    animation: _animation,
                                    builder: (context, child) {
                                      return Transform.translate(
                                        offset: Offset(_animation.value, 0),
                                        child: child,
                                      );
                                    },
                                    child: const Icon(Icons.forward, color: kLynxWhite,),
                                  )
                                ],
                              ))
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
