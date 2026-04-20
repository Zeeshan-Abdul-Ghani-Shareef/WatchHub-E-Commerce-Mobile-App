import 'package:flutter/material.dart';
import 'package:watch/support_class/colors.dart';
import 'package:watch/support_class/text.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample FAQs data
    final List<Map<String, String>> faqs = [
      {
        "question": "What is WatchHub?",
        "answer": "WatchHub is a platform that allows you to explore and track your favorite watches."
      },
      {
        "question": "How can I reset my password?",
        "answer": "Go to the login page and click 'Forgot Password'. Follow the instructions to reset your password."
      },
      {
        "question": "How do I contact support?",
        "answer": "You can reach our support team via the 'Contact Us' section in the app."
      },
      {
        "question": "Can I add multiple watches to my wishlist?",
        "answer": "Yes, you can add as many watches as you like to your wishlist."
      },
      {
        "question": "Is WatchHub free to use?",
        "answer": "Yes, WatchHub is free for all users. Some premium features may require a subscription."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQs"),
        backgroundColor: kPrimaryColor, // Use your app's primary color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: kReverseGradient, // Use your app's gradient
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: faqs.length,
          itemBuilder: (context, index) {
            final faq = faqs[index];
            return FAQCard(
              question: faq["question"]!,
              answer: faq["answer"]!,
            );
          },
        ),
      ),
    );
  }
}

class FAQCard extends StatefulWidget {
  final String question;
  final String answer;

  const FAQCard({
    Key? key,
    required this.question,
    required this.answer,
  }) : super(key: key);

  @override
  State<FAQCard> createState() => _FAQCardState();
}

class _FAQCardState extends State<FAQCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: kTextTheme.titleLarge, // Use your app's text theme
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.answer,
              style: kTextTheme.titleMedium,
              
            ),
          ),
        ],
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
      ),
    );
  }
}
