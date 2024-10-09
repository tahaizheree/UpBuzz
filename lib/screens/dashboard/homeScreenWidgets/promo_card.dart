import 'package:flutter/material.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/res/res.dart';

class PromoCard extends StatelessWidget{
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                      color: const Color.fromARGB(255, 84, 203, 90),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: getHeight() * 0.003,
                            horizontal: getWidth() * 0.01),
                        leading: Image.asset(Assets.gift),
                        title: const Text(
                          'Try UpAlerts 3 days for free.\nTap to activate premium',
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        trailing:
                            const Icon(Icons.arrow_forward, color: Colors.white),
                        onTap: () {
                          // Add onTap functionality
                        },
                      ),
                    );
  
  }
}