class BusinessStatus {
  String businessNum; // 사업자 등록번호
  // 납세자 상태 - 코드: 명칭
// 01: 계속사업자,
// 02: 휴업자,
// 03: 폐업자
  String businessStatus; // 납세자 상태 (명칭)
  String businessStatusCode; // 납세자 상태 (코드)
  // 과세 유형 - 코드: 명칭
// 01:부가가치세 일반과세자,
// 02:부가가치세 간이과세자,
// 03:부가가치세 과세특례자,
// 04:부가가치세 면세사업자,
// 05:수익사업을 영위하지 않는 비영리법인이거나 고유번호가 부여된 단체,국가기관 등,
// 06:고유번호가 부여된 단체,
// 07:부가가치세 간이과세자(세금계산서 발급사업자),
// * 등록되지 않았거나 삭제된 경우: "국세청에 등록되지 않은 사업자등록번호입니다"
  String taxType; // 과세 유형 (명칭)
  String taxTypeCode; // 과세 유형 (코드)
  String endDate; // 폐업일
  String utcc; // 단위과세전환폐업여부 Yes or No
  String taxTypeChangeDate; // 최근과세유형전환일자 (YYYYMMDD 포맷)
  String invoiceApplyDate; // 세금계산서적용일자 (YYYYMMDD 포맷)
//   직전과세유형메세지 - 코드: 명칭
// 01:부가가치세 일반과세자,
// 02:부가가치세 간이과세자,
// 07:부가가치세 간이과세자(세금계산서 발급사업자),
// 99:해당없음
  String previousTaxType; // 직전 과세 유형 (명칭)
  String previousTaxTypeCode; // 직전 과세 유형 (코드)

  BusinessStatus({
    required this.businessNum,
    required this.businessStatus,
    required this.businessStatusCode,
    required this.taxType,
    required this.taxTypeCode,
    required this.endDate,
    required this.utcc,
    required this.taxTypeChangeDate,
    required this.invoiceApplyDate,
    required this.previousTaxType,
    required this.previousTaxTypeCode,
  });

  factory BusinessStatus.fromJson(Map<String, dynamic> json) {
    return BusinessStatus(
      businessNum: json['b_no'] ?? "",
      businessStatus: json['b_stt'] ?? "",
      businessStatusCode: json['b_stt_cd'] ?? "",
      taxType: json['tax_type'] ?? "",
      taxTypeCode: json['tax_type_cd'] ?? "",
      endDate: json['end_dt'] ?? "",
      utcc: json['utcc_yn'] ?? "",
      taxTypeChangeDate: json['tax_type_change_dt'] ?? "",
      invoiceApplyDate: json['invoice_apply_dt'] ?? "",
      previousTaxType: json['rbf_tax_type'] ?? "",
      previousTaxTypeCode: json['rbf_tax_type_cd'] ?? "",
    );
  }
}
