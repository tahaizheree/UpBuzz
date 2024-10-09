import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:upalerts/res/res.dart';

class CustomCarouselSlider extends StatelessWidget{
  const CustomCarouselSlider({super.key,required this.imgList});
  final List<String> imgList;
  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                      ),
                      items: imgList
                          .map((item) => Container(
                                padding: const EdgeInsets.symmetric(horizontal: 2),
                                child: Center(
                                    child: Image.network(item,
                                        fit: BoxFit.cover, width: getWidth(),
                                        height: getHeight() * 0.075)),
                              ))
                          .toList(),
                    );
  }
}