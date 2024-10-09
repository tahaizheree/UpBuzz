import 'package:flutter/material.dart';
import 'package:upalerts/screens/dashboard/homeScreenWidgets/ai_credit_balance.dart';
import 'package:upalerts/screens/dashboard/homeScreenWidgets/build_tool_card.dart';
import 'package:upalerts/screens/dashboard/homeScreenWidgets/carousel_slider.dart';
import 'package:upalerts/screens/dashboard/homeScreenWidgets/promo_card.dart';

final List<String> imgList = [
  'https://images.pexels.com/photos/434337/pexels-photo-434337.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/6913721/pexels-photo-6913721.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/1028445/pexels-photo-1028445.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/6483579/pexels-photo-6483579.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/6392998/pexels-photo-6392998.jpeg?auto=compress&cs=tinysrgb&w=800',
  'https://images.pexels.com/photos/5554655/pexels-photo-5554655.jpeg?auto=compress&cs=tinysrgb&w=800'
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true; // To track loading state
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadImages();
    });
  }

  Future<void> loadImages() async {
    for (String imgUrl in imgList) {
      await precacheImage(NetworkImage(imgUrl), context);
    }
    // After all images are loaded, update the loading state
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading // Show loader if images are loading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.green,
          ))
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  // Promo Card
                  const PromoCard(),


                  const SizedBox(height: 7),



                  // AI Credit Balance Card
                  const AiCreditBalance(),



                  const SizedBox(height: 7),



                  CustomCarouselSlider(imgList: imgList),




                  const SizedBox(height: 16),
                  // Tools Section
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tools',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Buildtoolcard(
                            title: 'AI Mentor',
                            description: 'Supercharge your AI'),
                        SizedBox(width: 16),
                        Buildtoolcard(
                            title: 'AI Templates',
                            description: 'Supercharge your AI'),
                        // More Cards
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
