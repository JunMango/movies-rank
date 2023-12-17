# 경희대학교
## 강의: 풀스텍 서비스 프로그래밍

이 프로젝트는 경희대학교 2023_2학기 풀스텍 서비스 프로그래밍 강의에서 만든 영화 어플리케이션입니다.
### 기술 스택
  - 언어: Dart
  - 프레임워크: Flutter
  - 코드 라인 수: 749
### 
### **기능 소개**

1. **주간, 일간 박스 오피스 조회:**
    - 애플리케이션을 통해 주간 및 일간 박스 오피스의 순위, 제목, 예고편 등을 확인할 수 있습니다.
2. **상세 정보 확인:**
    - 각 영화에 대한 상세 정보를 조회할 수 있습니다. (영화 제목, 개봉일, 관람객 수, 누적 관람객 수, 줄거리, 포스터 이미지, 예고편 등)
      
### **Movies Rank**

### Client

- GitHub Repository: [Movies-Rank](https://github.com/JunMango/Movies-Rank.git)

**프로젝트 개요:**
Movies Rank는 Flutter를 사용하여 개발된 모바일 애플리케이션입니다. 주간과 일간 박스 오피스 정보를 제공하며, 각 영화에 대한 상세 정보를 확인할 수 있습니다.

### Server

- GitHub Repository: [Movies-Rank-Server](https://github.com/JunMango/Movies-Rank-Server.git)

**프로젝트 개요:**
Movies Rank Server는 Node.js를 사용하여 개발된 서버 애플리케이션입니다. 클라이언트 애플리케이션에 필요한 주간과 일간 박스 오피스 정보를 제공합니다.

---

### **Movies Rank - 사용 설명서**

### Client

1. **프로젝트 클론:**
    
    ```bash
    bashCopy code
    git clone https://github.com/JunMango/Movies-Rank.git
    
    ```
    
2. **의존성 설치:**
    
    ```bash
    bashCopy code
    cd Movies-Rank
    flutter pub get
    
    ```
    
3. **애플리케이션 실행:**
    
    ```bash
    bashCopy code
    flutter run
    
    ```
    
4. **애플리케이션 빌드:**
    
    ```bash
    bashCopy code
    flutter build apk
    
    ```
    

### Server

1. **프로젝트 클론:**
    
    ```bash
    bashCopy code
    git clone https://github.com/JunMango/Movies-Rank-Server.git
    
    ```
    
2. **의존성 설치:**
    
    ```bash
    bashCopy code
    cd Movies-Rank-Server
    npm install
    
    ```
    
3. **서버 실행:**
    
    ```bash
    bashCopy code
    node app.js
    
    ```
    
4. **서버 접속:**[http://localhost:8080](http://localhost:8080/)

### **프로젝트 요약**

### 1. 구조 및 코드 위치

프로젝트는 Flutter로 개발되었으며, 다음과 같은 구조로 이루어져 있습니다.

```lua
luaCopy code
lib
|-- api
|   |-- api.dart  // 서버 base_url 설정 파일
|-- models
|   |-- movies.dart  // api.dart에서 받아온 json 데이터를 movie 객체로 변환하는 파일
|-- screens
|   |-- details_screens.dart  // 상세 페이지 화면
|   |-- home_screen.dart  // 홈 페이지 화면
|   |-- splash.dart  // 앱 로딩 페이지, 4초 후 home_screens으로 이동
|-- widgets
|   |-- back_button.dart  // detail_screens.dart에서 뒤로 돌아가는 위젯
|   |-- daily_trending_slider.dart  // "일간 박스 오피스" carousel
|   |-- movies_slider.dart  // "주간, 일간 박스 오피스" 랭킹별로 진열하기 위한 슬라이더
|   |-- trending_slider.dart  // "주간 박스 오피스" carousel
|-- color.dart  // default 색상 (back_button.dart, main.dart에서 사용)
|-- main.dart  // 앱의 root 파일

```

### 2. 디자인 패턴

프로젝트는 다음과 같은 디자인 패턴을 채택하고 있습니다.

- **Api 모듈**
- **객체 모듈**
- **화면 구성**
- **위젯 구성**
- **초기 설정 파일 (ex. color)**
- **Root(main.dart)**

### 3. 클라이언트가 관리하는 정보

**`models/movies.dart`** 파일에서 영화 정보를 담는 객체를 생성하고, 해당 객체는 다음의 데이터를 가집니다.

```dart
dartCopy code
String title; // 제목
String openDt; // 영화 오픈일
String audiCnt; // 일별 관람객수
String audiAcc; // 누적 관람객수
String plot; // 영화 상세 설명
String posters; // 포스터 이미지 Url
String vodUrl; // 예고편 동영상 Url
String rank; // 랭킹

```

### 4. API 및 JSON 정보

- **API**
    - Base URL: [http://localhost:8080](http://localhost:8080/)
    - 일별 박스 오피스: /daily/boxoffice
    - 주간 박스 오피스: /week/boxoffice
- **JSON Data 예시**

```json
jsonCopy code
[
  {
    "title": "서울의 봄",
    "openDt": "2023-11-22",
    "audiCnt": "203043",
    "audiAcc": "5271149",
    "plot": "1979년 12월 12일, 수도 서울 군사반란 발생...",
    "posters": "http://file.koreafilm.or.kr/thm/02/99/18/24/tn_DPK021396.jpg",
    "vodUrl": "https://www.kmdb.or.kr/trailer/trailerPlayPop?pFileNm=MK060323_P02.mp4",
    "rank": "1"
  },
  // Additional items...
]

```

### 5. 추가 기능 및 개발 계획

- **상세 페이지에서 예고편 제공**: 서버에서 정제한 데이터 중 "vodUrl"을 활용하여 각 영화의 예고편을 제공할 예정입니다.
- **네이버 평점**: 네이버의 리뷰 데이터를 수집하여 사용자에게 제공할 예정입니다.
- **서버 데이터베이스 연결**: 데이터베이스를 활용하여 OpenAPI 호출을 최적화하여 서비스의 안정성과 지속성을 개선할 예정입니다.

### 6. 개발의 지속성 및 서비스의 공개 여부

- 프로젝트는 지속적인 개발을 통해 기능을 확장하고 서비스를 향상시킬 예정입니다.
- 서비스는 공개하지 않지만 배포를 통해 앱의 배포 과정을 경험하고 포트폴리오에 추가할 예정입니다.
