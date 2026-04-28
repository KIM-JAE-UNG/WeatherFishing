# 🌊 WeatherFishing

> 기상 정보 + 낚시 적합도를 함께 제공하는 iOS 앱
> 2026 캡스톤 디자인 프로젝트

---

## 📌 프로젝트 개요

기상청 및 국립해양조사원의 실시간 공공 데이터를 기반으로,
일상적인 날씨 정보뿐 아니라 **낚시 출조 적합도**를 어종별로 산출해주는 iOS 앱.

기존 날씨 앱이 단순히 데이터를 보여주는 데 그친다면,
WeatherFishing 은 환경 데이터(수온·파고·바람·조석)를 어종별 생태 특성과 결합한
**룰 기반 적합도 엔진**을 통해 의사결정을 돕는다.

## ✨ 주요 기능

### 일반 모드
- 단기예보 (3일)
- 중기예보 (~10일)
- 기상특보 / 경보 실시간 표시 및 알림

### 낚시 모드
- 실시간 수온 · 파고 · 바람 · 조위 조회
- 어종별 출조 적합도 (★ 1~5)
- 출조 가능 여부 (해상특보 연동)
- 물때 / 들물 · 날물 표시
- 즐겨찾는 낚시 지점 관리

## 🛠 기술 스택

| 구분 | 사용 기술 |
|------|-----------|
| Language | Swift 5.9+ |
| UI | SwiftUI |
| Concurrency | async / await |
| Architecture | MVVM + Service Layer |
| Min iOS | 16.0 |
| 외부 의존성 | 없음 (URLSession only) |

## 🌐 사용 API

| 출처 | 용도 |
|------|------|
| [공공데이터포털](https://www.data.go.kr) | 단기예보, 중기예보, 기상특보 |
| [바다누리 OpenAPI](https://www.khoa.go.kr/oceangrid/khoa/takepart/openapi/openApiKey.do) | 실시간 수온, 파고, 조석 예보 |

## 🚀 시작하기

### 1. 사전 준비
- Xcode 15.0 이상
- iOS 16.0+ 시뮬레이터 또는 실기기
- API 키 2종 발급 (아래 참조)

### 2. API 키 발급

**공공데이터포털**
1. https://www.data.go.kr 회원가입
2. 다음 3개 서비스 활용신청 (자동승인)
   - `기상청_단기예보 ((구) 동네예보) 조회서비스`
   - `기상청_중기예보 조회서비스`
   - `기상청_기상특보 조회서비스`
3. 마이페이지 → 데이터활용 → **일반 인증키 (Decoding)** 복사

**바다누리 OpenAPI**
1. https://www.khoa.go.kr/oceangrid/khoa/takepart/openapi/openApiKey.do 가입
2. 약관 동의 후 API 키 발급

### 3. 프로젝트 설정

```bash
git clone https://github.com/KIM-JAE-UNG/WeatherFishing.git
cd WeatherFishing
```

`Core/Config/Secrets.example.swift` 를 같은 위치에 `Secrets.swift` 로 복사하고,
발급받은 키를 입력한다:

```swift
enum Secrets {
    static let kmaServiceKey  = "발급받은_공공데이터포털_Decoding_키"
    static let khoaServiceKey = "발급받은_바다누리_키"
}
```

> ⚠️ `Secrets.swift` 는 `.gitignore` 에 등록되어 커밋되지 않는다.

### 4. 빌드 & 실행
Xcode 에서 `WeatherFishing.xcodeproj` 열고 ⌘R

## 📁 프로젝트 구조

```
WeatherFishing/
├── App/                    진입점
├── Core/
│   ├── Network/            API 클라이언트
│   ├── Config/             환경 설정 (Secrets)
│   └── Utils/              격자좌표 변환 등
├── Features/
│   ├── Weather/            일반 모드
│   ├── Fishing/            낚시 모드 + 적합도 엔진
│   └── Common/
└── Resources/              어종 룰, 낚시 지점 데이터
```

## 🐟 적합도 엔진

`FishingScoreEngine` 은 다음 요소를 종합해 어종별 1~5점 점수를 산출한다.

- 수온 적합 범위 매칭
- 파고 안정성
- 풍속 임계치
- 조석 위상 (들물 / 날물, 사리 / 조금)
- 일출 / 일몰 (피딩 타임)

룰은 `Resources/fish_species.json` 에 정의되어 있어,
어종 추가 시 코드 수정 없이 JSON 만 갱신하면 된다.

## 📅 개발 로드맵

- [x] 프로젝트 구조 설계
- [ ] API 클라이언트 + 격자 변환기
- [ ] 단기예보 / 중기예보 화면
- [ ] 기상특보 표시
- [ ] 바다누리 연동 (수온 · 파고 · 조석)
- [ ] 낚시 적합도 엔진
- [ ] 위치 기반 자동 선택 (CoreLocation)
- [ ] 푸시 알림 (특보 발효 시)

## 📜 라이선스 / 출처

학습용 캡스톤 프로젝트입니다.
모든 기상 / 해양 데이터의 저작권은 다음 기관에 있습니다.

- 기상청 (Korea Meteorological Administration)
- 국립해양조사원 (Korea Hydrographic and Oceanographic Agency)
