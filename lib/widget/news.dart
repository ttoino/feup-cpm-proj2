import 'package:flutter/material.dart';

class NewsFullWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  NewsFullWidget({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Add elevation and shape as per your preference
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover, // Adjust the fit as per your requirement
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0), // Add some space between title and description
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
