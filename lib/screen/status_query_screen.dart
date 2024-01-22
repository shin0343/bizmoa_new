import 'dart:convert';
import 'dart:developer';

import 'package:bizmoa/component/custom_text_field.dart';
import 'package:bizmoa/constant/app_constant.dart';
import 'package:bizmoa/model/business_status.dart';
import 'package:bizmoa/screen/business_status_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StatusQueryScreen extends StatefulWidget {
  @override
  _StatusQueryScreenState createState() => _StatusQueryScreenState();
}

class _StatusQueryScreenState extends State<StatusQueryScreen> {
  List<TextEditingController> _controllers =
      List.generate(10, (index) => TextEditingController());

  List<BusinessStatus> businessStatusList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상태 조회 화면'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 10), // 상단 제목과 첫 번째 입력 필드 사이의 간격을 조정
            Expanded(
              child: ListView.separated(
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  return CustomTextField(
                    controller: _controllers[index],
                    label: '사업자 번호 ${index + 1}',
                  );
                },
                separatorBuilder: (context, index) =>
                    SizedBox(height: 10), // 입력 필드 간 간격 조정
              ),
            ),
            SizedBox(
              width: double.infinity, // 버튼의 너비를 최대로 설정
              height: 70, // 버튼의 높이를 70으로 조정
              child: ElevatedButton(
                onPressed: () {
                  // TODO: 상태 조회 로직 추가
                  getBusinessStatusInfo();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange, // 세련되고 눈에 띄는 색상으로 변경
                  padding: EdgeInsets.symmetric(vertical: 20), // 버튼의 내부 여백 조정
                ),
                child: Text(
                  '상태 조회하기',
                  style: TextStyle(
                      fontSize: 20, color: Colors.white), // 텍스트 스타일 조정
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  getBusinessStatusInfo() async {
    final uri = Uri.parse(getUri());
    final headers = {'Content-Type': 'application/json'};

    // 입력된 사업자 번호들을 배열로 변환하고, 빈 문자열을 제거
    List<String> businessNumbers = _controllers
        .map((controller) => controller.text)
        .where((number) => number.isNotEmpty) // 빈 문자열이 아닌 요소만 필터링
        .toList();

    // 요청 본문을 JSON 형식으로 구성
    final body = json.encode({"b_no": businessNumbers});

    try {
      http.Response response =
          await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        log("getBusinessStatusInfo()----1 response.body: ${response.body}");

        Map<String, dynamic> responseBody = json.decode(response.body);
        List<dynamic> responseData = responseBody['data'];
        log("getBusinessStatusInfo()----2 response.body[data]: $responseData");
        businessStatusList =
            responseData.map((data) => BusinessStatus.fromJson(data)).toList();
        log("getBusinessStatusInfo()----3 businessStatusList: $businessStatusList");

        // 새 결과 스크린으로 화면 전환
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BusinessStatusScreen(
              businessStatusList: businessStatusList,
            ),
          ),
        );
      } else {
        // 만약 응답이 OK가 아니면, 에러를 던집니다.
        log("Failed to load post()");
        throw Exception('Failed to load post');
      }
    } catch (e) {
      // 네트워크 요청 중 발생한 예외 처리
      log("Error in getBusinessStatusInfo: $e");
    }
  }
}
