library app_constants;

import 'package:flutter/foundation.dart';

const apiKeyEncoded =
    "WqgAztzD5WzgfVAcInBtyAUb%2FuEpCzWsXb7y4%2FyAdpRFO%2FtKNvsaX8qvIyOVKJvZYDrHpzxiYu5JXLSjK7p%2BDQ%3D%3D";
const apiKeyDecoded =
    "WqgAztzD5WzgfVAcInBtyAUb/uEpCzWsXb7y4/yAdpRFO/tKNvsaX8qvIyOVKJvZYDrHpzxiYu5JXLSjK7p+DQ==";

// openApi key
String getUri() {
  return "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=$apiKeyEncoded";
}

// admob keys
const kAppopenAndroidAdmob = 'ca-app-pub-5312401256326795/3538783545';
const kAppopenIosAdmob = 'ca-app-pub-5312401256326795/3538783545';

const kTestAppopenAndroidAdmob = 'ca-app-pub-3940256099942544/3419835294';
const kTestAppopenIosAdmob = 'ca-app-pub-3940256099942544/5662855259';

const Map<String, String> UNIT_APPOPEN_ID = kReleaseMode
    ? {
        'ios': kAppopenIosAdmob,
        'android': kAppopenAndroidAdmob,
      }
    : {
        'ios': kTestAppopenIosAdmob,
        'android': kTestAppopenAndroidAdmob,
      };

const int kAdLoadDurationSecond = 4;
