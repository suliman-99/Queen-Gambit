import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Providers/OfflineGameProvider.dart';
import 'ViewModels/ThemeViewModel.dart';
import 'Views/Pages/LogIn&SignUp/LogInPage.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return OfflineGameProvider();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlagFall',
      home: LogInPage(),
      debugShowCheckedModeBanner: false,
      theme: purpleTheme,
    );
  }
}

















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main(List<String> args) {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.fastfood_outlined),
//           onPressed: () async {
//             await Firebase.initializeApp();
//             var response = await FirebaseFirestore.instance
//                 .collection('Chats')
//                 .doc('3')
//                 .get();
//             // Get.to(
//             //   Scaffold(
//             //     body: Center(
//             //       child: ListView.builder(
//             //         itemCount: response.docs.length,
//             //         itemBuilder: (context, index) => Text(
//             //           response.docs[index].data().toString(),
//             //         ),
//             //       ),
//             //     ),
//             //   ),
//             // );
//           },
//         ),
//       ),
//     );
//   }
// }


