import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upalerts/appAssets/assets.dart';
import 'package:upalerts/providers/portfolio_provider.dart';
import 'package:upalerts/providers/profile_provider.dart';
import 'package:upalerts/res/res.dart';
import 'package:upalerts/screens/dashboard/portfolioScreenWidgets/add_new_portfolio.dart';
import 'package:upalerts/screens/dashboard/profile_screen.dart';


class CustomAppBarHomeScreen extends StatefulWidget implements PreferredSizeWidget {
     const CustomAppBarHomeScreen({super.key, required this.activeScreen});
   
  final String activeScreen;

  @override
  State<CustomAppBarHomeScreen> createState() => _CustomAppBarHomeScreenState();
   @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _CustomAppBarHomeScreenState extends State<CustomAppBarHomeScreen> {
 File? _newImage ;

  @override
  Widget build(BuildContext context) {
    
    final profileProvider = Provider.of<ProfileProvider>(context,listen:true);
    return AppBar(
      leadingWidth: getWidth() * 0.05,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      toolbarHeight: 60.0,
      leading: widget.activeScreen == "home"
          ?  Padding(
              padding: const EdgeInsets.only(left: 16),
              child: CircleAvatar(
                backgroundImage: _newImage != null
                              ? FileImage(_newImage!)
                              : (profileProvider.profile.profileImage != null
                                  ? FileImage(profileProvider.profile.profileImage!)
                                  : const AssetImage(Assets.avatar)) as ImageProvider,
              ),
            )
          : null,
      title: widget.activeScreen == "home"
          ?  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Hey 👋',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                Text(
                  profileProvider.profile.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          : Text(
              widget.activeScreen,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
      actions: [
        widget.activeScreen == "home"
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: const ImageIcon(
                    AssetImage(Assets.chat),
                    color: Colors.black,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
              )
            : const SizedBox(),
        widget.activeScreen != "Portfolio"
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  icon: const ImageIcon(
                    AssetImage(Assets.settings),
                    color: Colors.black,
                  ),
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                ),
              )
            : const SizedBox(),
        widget.activeScreen != "Portfolio"
            ? Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: const ImageIcon(
                    AssetImage(Assets.userProfile),
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen(),));
                  },
                  padding: EdgeInsets.zero,
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: IconButton(
                  icon: const ImageIcon(
                    AssetImage(Assets.portfolioAdd),
                    color: Colors.black,
                  ),
                  onPressed: () async {
                    try {
                      // Open add portfolio screen and await result
                      final newPortfolio = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddPortfolioScreen(),
                        ),
                      );

                      // If a new portfolio is returned, add it to the provider
                      if (newPortfolio != null) {
                        Provider.of<PortfolioProvider>(context, listen: false)
                            .addPortfolio(newPortfolio);
                      }
                    } catch (e) {
                      // Print the error for debugging
                      print("Error adding portfolio: $e");
                      // Optionally show a dialog to the user
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Could not add the portfolio. Please try again.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  padding: EdgeInsets.zero,
                ),
              ),
      ],
    );
  }

 
}