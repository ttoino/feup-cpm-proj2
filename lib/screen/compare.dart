import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/model/company.dart';
import 'package:meerkat/screen/compareCharts.dart';
import 'package:meerkat/provider/company.dart';

class CompareScreen extends ConsumerStatefulWidget {
  const CompareScreen({Key? key}) : super(key: key);

  @override
  _CompareScreenState createState() => _CompareScreenState();
}

class _CompareScreenState extends ConsumerState<CompareScreen> {
  List<bool> isSelected = List.filled(10, false);
  int selectedCount = 0;
  List<Company> selectedCompanies = [];

  @override
  Widget build(BuildContext context) {
    final companies = ref.watch(companiesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Compare Companies"),
      ),
      body: Stack(
        children: [
          GridView.builder(
            itemCount: companies.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              final company = companies[index];
              return InkWell(
                onTap: () {
                  setState(() {
                    if (isSelected[index]) {
                      isSelected[index] = false;
                      selectedCount--;
                      selectedCompanies.remove(company);
                    } else {
                      if (selectedCount < 2) {
                        isSelected[index] = true;
                        selectedCount++;
                        selectedCompanies.add(company);
                      } else {
                        // Show SnackBar indicating maximum selection reached
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Can't compare more than two companies"),
                          ),
                        );
                      }
                    }
                  });
                },
                child: Container(
                  width: double.infinity, // Adjust as needed
                  height: 200, // Adjust as needed
                  child: Card(
                    color: isSelected[index] ? Theme.of(context).colorScheme.onTertiary : Colors.transparent,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: FractionallySizedBox(
                              widthFactor: 0.7, // Scale down the width to 70%
                              heightFactor: 0.7, // Scale down the height to 70%
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      company.logoUrl,
                                    ),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          company.name,
                          style: TextStyle(fontSize: 16),
                          maxLines: 1, // Limit the text to 1 line
                          overflow: TextOverflow.ellipsis, // Use ellipsis to indicate overflow
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
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16, right: 16),
                // Adjust margin as needed
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to CompareChartsScreen with selected indices
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CompareChartsScreen(selectedCompanies),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    // Adjust padding as needed
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .onTertiary, // Use onPrimary color from the theme
                  ),
                  child: const Text("Compare",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
