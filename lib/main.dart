import 'package:bizmoa/screen/status_query_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '사업자번호 조회 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: StatusQueryScreen(), // StatusQueryScreen을 홈 화면으로 설정합니다.
    );
  }
}
