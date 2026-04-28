//
//  Secrets.example.swift
//  WeatherFishing
//
//  ⚠️  사용법
//  1. 이 파일을 같은 폴더에 'Secrets.swift' 라는 이름으로 복사하세요.
//  2. 아래 빈 문자열 자리에 본인의 API 키를 입력하세요.
//  3. Secrets.swift 는 .gitignore 에 등록되어 있어 커밋되지 않습니다.
//  4. 새 팀원이 합류하면 이 파일을 보고 본인 키로 Secrets.swift 를 생성합니다.
//
//  ❌ 절대 이 example 파일에 진짜 키를 넣지 마세요.
//

import Foundation

enum Secrets {
    
    /// 공공데이터포털 (data.go.kr) 일반 인증키
    /// 사용처: 단기예보, 중기예보, 기상특보 API
    ///
    /// ⚠️  Encoding 키가 아닌 **Decoding 키** 를 입력해야 합니다.
    ///     URLComponents 가 자동 인코딩을 하므로,
    ///     Encoding 키를 넣으면 이중 인코딩 되어 인증 오류 발생.
    static let kmaServiceKey = ""
    
    /// 국립해양조사원 바다누리 (khoa.go.kr) OpenAPI 키
    /// 사용처: 실시간 수온, 파고, 조위 예보
    static let khoaServiceKey = ""
}
