import 'package:flutter/material.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compare Companies "),
      ),
      body: GridView.builder(
        itemCount: 8,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                // Handle onTap event here
                print("Container tapped: $index");
              },
              child: Container(
                width: double.infinity, // Adjust as needed
                height: 200, // Adjust as needed
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  "https://asset.brandfetch.io/id6O2oGzv-/idNEgS9h8q.jpeg"),
                              fit: BoxFit.contain, // Adjust as needed
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Google",
                        style: TextStyle(fontSize: 16), // Adjust as needed
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
