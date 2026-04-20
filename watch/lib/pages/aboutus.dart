// pages/aboutus.dart
import 'package:flutter/material.dart';
import 'package:watch/support_class/colors.dart';


class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key, required this.title});

  final String title;

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text("About Us"),
        backgroundColor: kPrimaryColor, // Use your app's primary color
      ),
      body: Container(
        color: kPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Title
              Text(
                'About WatchHub',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: kWhiteColor,
                    ), // Consistent with text theme
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                'WatchHub is your ultimate destination for the finest timepieces. '
                'Discover a curated selection of luxurious watches that blend '
                'sophistication with precision. Elevate your style with WatchHub.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: kWhiteColor.withOpacity(0.9),
                      height: 1.5,
                    ), // Consistent body text theme
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Decorative Image
              const Image(
                image: AssetImage('assets/images/slider/1.jpg'),
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
