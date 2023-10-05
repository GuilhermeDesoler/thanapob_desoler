import 'package:flutter/material.dart';
import 'package:thanapob_desoler/components/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xfff6f1e6),
        appBar: const AppTopBar(),
        body: _pageBody(),
        floatingActionButton: const HeartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const AppBottomBar(),
      ),
    );
  }

  Widget _pageBody() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Letter(),
        ],
      );
}
