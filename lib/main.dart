import 'dart:io';
import 'controller/pay.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chapa_unofficial/chapa_unofficial.dart';
import 'UI/pages/mainpage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  String? apiKey = dotenv.env['value'];
  String? appId = dotenv.env['app_id'];
  String? messagingSenderId = dotenv.env['sender_id'];
  String? projectId = dotenv.env['pro_id'];
  String? storageBucket = dotenv.env['storageBucket'];

  await Firebase.initializeApp(
    options: Platform.isAndroid
        ? FirebaseOptions(
            apiKey: apiKey!,
            appId: appId!,
            messagingSenderId: messagingSenderId!,
            projectId: projectId!,
            storageBucket: storageBucket!,
          )
        : null,
  );

  runApp(ChangeNotifierProvider(
    create: (_) => AssetProvider(),
    child: const MainApp(),
  ));
  Chapa.configure(
      privateKey: "Bearer CHASECK_TEST-RcyLDVPuhuAXhDhZ1nMxEm7FMXzNMf8m");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}
