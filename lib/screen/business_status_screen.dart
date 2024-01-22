import 'package:bizmoa/model/business_status.dart';
import 'package:flutter/material.dart';

class BusinessStatusScreen extends StatelessWidget {
  final List<BusinessStatus> businessStatusList;

  const BusinessStatusScreen({Key? key, required this.businessStatusList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('사업자 등록 상태 조회'),
      ),
      body: ListView.builder(
        itemCount: businessStatusList.length,
        itemBuilder: (context, index) {
          final item = businessStatusList[index];
          return Card(
            elevation: 4, // 카드에 그림자 효과 추가
            margin: EdgeInsets.all(8), // 카드의 마진 추가
            child: Padding(
              padding: EdgeInsets.all(16), // 카드 내부 패딩 추가
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '사업자 번호: ${item.businessNum}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold), // 텍스트 스타일 수정
                  ),
                  SizedBox(height: 8), // 텍스트 간 간격 추가
                  Text(
                    '납세자 상태: ${item.businessStatus}',
                    style: TextStyle(fontSize: 14), // 텍스트 사이즈 조정
                  ),
                  SizedBox(height: 8),
                  Text(
                    '과세 유형: ${item.taxType}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '폐업일: ${item.endDate.isEmpty ? '해당없음' : item.endDate}',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
