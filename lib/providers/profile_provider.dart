import 'dart:io';
import 'package:flutter/material.dart';

class Profile {
  String name;
  String experience;
  String whatsapp;
  String country;
  String email;
  String upworkProfile;
  String fiverrProfile;
  File? profileImage;

  Profile({
    required this.name,
    required this.experience,
    required this.whatsapp,
    required this.country,
    required this.email,
    required this.upworkProfile,
    required this.fiverrProfile,
    this.profileImage,
  });
}

class ProfileProvider with ChangeNotifier {
  Profile _profile = Profile(
    name: 'Alexa Lissie',
    experience: 'App Design',
    whatsapp: '+92 3346271753',
    country: 'Pakistan',
    email: 'alexalissie@example.com',
    upworkProfile: 'Upwork Profile',
    fiverrProfile: 'Fiverr Profile',
  );

  Profile get profile => _profile;

  void updateProfile(
    String name,
    String experience,
    String whatsapp,
    String country,
    String email,
    String upworkProfile,
    String fiverrProfile,
    File? image,
  ) {
    _profile = Profile(
      name: name,
      experience: experience,
      whatsapp: whatsapp,
      country: country,
      email: email,
      upworkProfile: upworkProfile,
      fiverrProfile: fiverrProfile,
      profileImage: image ?? _profile.profileImage,
    );
    notifyListeners();
  }
}