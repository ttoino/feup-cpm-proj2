import 'package:flutter/material.dart';
import 'package:meerkat/screen/compareCharts.dart';

class CompareScreen extends StatefulWidget {
  const CompareScreen({Key? key}) : super(key: key);

  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends State<CompareScreen> {
  List<bool> isSelected = List.filled(8, false);
  int selectedCount = 0;
  List<int> selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Compare Companies"),
      ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    if (isSelected[index]) {
                      isSelected[index] = false;
                      selectedCount--;
                    } else {
                      if (selectedCount < 2) {
                        isSelected[index] = true;
                        selectedCount++;
                      } else {
                        // Show SnackBar indicating maximum selection reached
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Can't compare more than two companies"),
                          ),
                        );
                      }
                    }
                  });
                },
                child: Container(
                  width: double.infinity, // Adjust as needed
                  height: 200, // Adjust as needed
                  color: isSelected[index] ? Colors.purple : Colors.transparent,
                  child: Card(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  "https://asset.brandfetch.io/id6O2oGzv-/idNEgS9h8q.jpeg",
                                ),
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
                ),
              );
            },
          ),
          // Button to compare selected companies
          if (selectedCount == 2)
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to CompareChartsScreen with selected indices
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompareChartsScreen(selectedIndices),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20), // Adjust padding as needed
                  backgroundColor: Theme.of(context).colorScheme.onTertiary, // Use onPrimary color from the theme

                ),
                child: Text(
                    "Compare",
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
        ],
      ),
    );
  }
}