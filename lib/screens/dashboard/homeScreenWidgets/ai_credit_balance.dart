import 'package:flutter/material.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/res/res.dart';

class AiCreditBalance extends StatelessWidget{
  const AiCreditBalance({super.key});

  @override
  Widget build(BuildContext context) {
   return  Card(
                      color: Colors.green[100],
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'AI Credit Balance: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'AI Credits are used for AI Cover Message Reply and AI',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  InkWell(
                                    onTap: () {
                                      // Add functionality for adding more credits
                                    },
                                    child: const Row(
                                      children: [
                                        Text(
                                          'ADD MORE',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 4),
                                        Icon(Icons.arrow_forward,
                                            color: Colors.green),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              Assets.moneyBag,
                              height: getHeight() * 0.038,
                            ),
                          ],
                        ),
                      ),
                    );
  }
}