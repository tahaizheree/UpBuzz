import 'package:flutter/material.dart';
import 'package:upalerts/appAssets/assets.dart';

class Buildtoolcard extends StatelessWidget{
  const Buildtoolcard({super.key,required this.title,required this.description});
  final String title;
  final String description;


  @override
  Widget build(BuildContext context) {
   return Card(
      color: Colors.grey[100],
      child: Container(
        width: 170,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                padding: const EdgeInsets.all(8),
                child: const ImageIcon(AssetImage(Assets.teach), color: Colors.white)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}