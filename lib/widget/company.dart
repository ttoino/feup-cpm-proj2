import 'package:flutter/material.dart';
import 'package:meerkat/model/company.dart';
import 'package:meerkat/screen/chart.dart';

class CompanyItem extends StatelessWidget {
  final Company company;

  const CompanyItem(this.company, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Ink.image(
        image: NetworkImage(company.logoUrl),
        fit: BoxFit.contain,
        width: 56,
        height: 56,
      ),
      title: Text(company.name),
      subtitle: Text(company.ticker),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("${company.stockPrice}\$"),
          const Icon(Icons.arrow_right),
        ],
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChartScreen(company.ticker),
        ),
      ),
    );
  }
}
