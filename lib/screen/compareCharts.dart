import 'package:flutter/material.dart';

class CompareChartsScreen extends StatelessWidget {
  final List<int> selectedIndices;

  CompareChartsScreen(this.selectedIndices);

  @override
  Widget build(BuildContext context) {
    // Use selectedIndices to get the information about the selected containers
    return Scaffold(
      appBar: AppBar(
        title: Text("Compare Charts"),
      ),
      body: Center(
        child: Text("Compare Charts Screen"),
      ),
    );
  }
}