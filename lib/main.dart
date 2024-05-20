import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/screen/home.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meerkat',
      onGenerateTitle: (context) => AppLocalizations.of(context)!.title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}

// // ========= For Search ============
//
// class RecommendedCompany {
//   String urlImg;
//   String companyName;
//   String companyShortName;
//
//   RecommendedCompany({
//     required this.urlImg,
//     required this.companyName,
//     required this.companyShortName,
//   });
// }
//
// Widget buildRecommendedCompanyCard({
//   required BuildContext context,
//   required String urlImg,
//   required String companyShortName,
// }) {
//   // aspect ratio of the images
//   double aspectRatio = 4 / 3;
//
//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => ChartScreen(companyShortName),
//         ),
//       );
//     },
//     child: Column(
//       children: [
//         Expanded(
//           child: AspectRatio(
//             aspectRatio: aspectRatio,
//             child: ClipRRect(
//               child: Material(
//                 child: Ink.image(
//                   image: NetworkImage(urlImg),
//                   fit: BoxFit
//                       .contain, // Use BoxFit.contain to fit the image inside the box without stretching or cropping
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Text(companyShortName,
//             style: TextStyle(fontSize: 15), overflow: TextOverflow.ellipsis)
//       ],
//     ),
//   );
// }
