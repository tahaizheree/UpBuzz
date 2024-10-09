import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/res/res.dart';
import 'package:upalerts/routes/routes.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenOneState();
}

class _BoardingScreenOneState extends State<BoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onSliderSuccess(int nextPage) {
    setState(() {
      _currentPage = nextPage;
    });
    _pageController.animateToPage(nextPage,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildIndicator(0),
                  const SizedBox(width: 5),
                  _buildIndicator(1),
                  const SizedBox(width: 5),
                  _buildIndicator(2),
                ],
              ),
              const SizedBox(height: 40),

             
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Page 1
                    _buildPage(
                      title: 'Welcome to UpAlerts',
                      description:
                          'It is a long established fact that a reader will be distracted by the readable content.',
                      image: Assets.boardingScreen1,
                      sliderLabel: 'Next',
                      onSlideComplete: () => _onSliderSuccess(1),
                    ),
                    // Page 2
                    _buildPage(
                      title: 'Get UpWork Job Alerts',
                      description:
                          'It is a long established fact that a reader will be distracted by the readable content.',
                      image: Assets.boardingScreen2,
                      sliderLabel: 'Next',
                      onSlideComplete: () => _onSliderSuccess(2),
                    ),
                    // Page 3
                    _buildPage(
                      title: 'AI Powered Cover Letters',
                      description:
                          'It is a long established fact that a reader will be distracted by the readable content.',
                      image: Assets.boardingScreen3,
                      sliderLabel: 'Go',
                      onSlideComplete: () {
                       router.go(Routes.onRegisterRoute);
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

  Widget _buildIndicator(int index) {
    return Container(
      width: _currentPage == index ? 60 : 20,
      height: 5,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.green : Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String description,
    required String image,
    required String sliderLabel,
    required VoidCallback onSlideComplete,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 30),
        ActionSlider.standard(
          sliderBehavior: SliderBehavior.stretch,
          actionThreshold: 0.8,
          width: getWidth(),
          height: getHeight() * 0.03,
          backgroundColor: Colors.green,
          toggleColor: Colors.white,
          
          icon: Text(sliderLabel, style: const TextStyle(color: Colors.green)),
          iconAlignment: Alignment.center,
          action: (controller) async {
            controller.loading();
            await Future.delayed(const Duration(milliseconds: 500));
            controller.success();
            onSlideComplete();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(6, (index) {
              return Opacity(
                opacity: 0.2 * index,
                child: const ImageIcon(
                  AssetImage(Assets.arrowRight),
                  color: Colors.white,
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 60),
        Center(
          child: Image.asset(image),
        ),
      ],
    );
  }
}