# 39-COLLABORATION-iOS-EVERYTIME
> PLAY SOPT 39기 합동세미나 모바일 앱 4조 iOS | 에브리타임 🎓

<br>
<img width="1920" height="1080" alt="everytime_slide_01" src="https://github.com/user-attachments/assets/215e53e2-c371-44dc-84e4-b27df031795a" />
<br>

## Redesign Points

<img width="100%" alt="개발파트_공유-1" src="https://github.com/user-attachments/assets/2b213412-86b4-4105-a1a2-3767f44c8561" />
<img width="100%" alt="개발파트_공유-2" src="https://github.com/user-attachments/assets/b7b1d418-b746-44c9-bcfb-fa5b248d8345" />
<img width="100%" alt="개발파트_공유-3" src="https://github.com/user-attachments/assets/daf5b81b-ce32-4375-832f-48ce5e515810"/>

<br>

#### ✔︎ Point 1 · 수강 대상 강의만 골라 보기
'미수강 강의만 보기'와 '수강 대상 강의만 보기' 체크박스를 추가했어요.
이미 수강한 강의는 빼고, 내 전공에 맞는 강의만 바로 확인할 수 있어요.

#### ✔︎ Point 2 · 같은 강의의 분반 묶음 토글
같은 과목의 여러 분반이 따로 나열되던 목록을 한 그룹으로 묶고, 펼치기/접기 토글을 추가했어요.
분반끼리 비교하기 쉽고, 목록 탐색 효율이 좋아졌어요.

#### ✔︎ Point 3 · 리뷰 키워드 칩버튼 필터
리뷰 본문 상단에 교수님 / 과제 / 시험 / 팀 프로젝트 키워드 칩버튼을 추가했어요.
강의평을 하나씩 읽지 않아도 원하는 리뷰만 골라서 볼 수 있어요.

<br>

## 시연 영상

| **강의 탐색** | **강의평** | **시간 선택** |
| :--: | :--: | :--: |
| <img width="250" src="https://github.com/user-attachments/assets/5bbf6664-8d9e-4866-9287-1d8fd6d426cf" /> | <img width="250" src="https://github.com/user-attachments/assets/b06fcb71-ab22-4b34-a5be-ce4de53593aa" /> | <img width="250" src="https://github.com/user-attachments/assets/58a5a145-6ed3-4c7f-854c-de17244c4f75" /> |

<br>

## 👩🏻‍💻 iOS Developers

| **이서영** | **전시언** |
| :---: | :---: |
| [<img width="400" height="400" src="https://github.com/user-attachments/assets/a5db28f3-86de-4df4-b3b2-a38af39ed1c4" />](https://github.com/amie-lee) | [<img width="400" height="400" src="https://github.com/user-attachments/assets/e58c1e24-38f4-4c4d-a5c3-a7738966d914" />](https://github.com/siiooin) |
| `강의 탐색, 시간 선택 View` | `강의평 View` |

### 상세 구현 내용

<details>
<summary><b>이서영</b></summary>

<br>

**시간표 / 강의 탐색 View**
- 상단에 시간표 구현(`Timetable()`)
  - 내 시간표 API 데이터를 요일 · 시작/종료 시간으로 변환해 강의 블록으로 표시
  - 강의마다 시간표 색상을 지정해 구분
- 시간표 아래에 강의 검색 목록 구현(`TimetableListView()`)
  - 분반이 1개인 강의는 `Card()`로, 분반이 여러 개인 강의는 `Accordion()`으로 묶어서 노출
  - 분반 묶음을 접을 때 해당 강의 위치로 스크롤 이동
  - 목록 마지막 강의가 보일 때 다음 페이지를 불러오는 무한 스크롤 구현

**필터**
- 시간표와 목록 사이에 필터 영역 배치(`TimetableFilterSection()`)
  - 전공/영역 칩(`ChipButton()`) 선택 시 전공필수 · 전공선택 · 공통교양 · 핵심교양 · 일반교양 메뉴 노출, 선택한 카테고리의 강의만 조회
  - 이수한 강의 숨기기 · 수강 제한 강의 숨기기 체크박스(`Checkbox()`) 선택 시 해당 강의를 제외하고 조회
  - 필터 변경 시 1페이지부터 다시 조회
- 시간 칩 선택 시 시간 선택 화면으로 이동(`TimeFilterView()`)
  - 요일 · 시간 그리드(`TimeFilterGridView()`)에서 원하는 시간대 선택
  - 요일 혹은 시간 헤더를 누르면 해당 요일 · 시간 일괄 선택/해제
  - 이미 담아둔 강의의 시간대는 딤 처리하여 표시
  - 선택한 시간대는 시간 칩에 `월, 9~11시`처럼 연속된 시간끼리 묶어서 표시, 칩의 지우기 버튼으로 초기화

**API 연동**
- 강의 목록과 내 시간표 데이터는 API로 반영
  - 선택한 카테고리 · 숨김 옵션 · 페이지를 요청 파라미터로 전달하여 강의 목록 반영(`CourseService`)
  - 시간표 데이터는 `TimetableService`로 받아 도메인 모델로 변환하여 사용
- `@Observable` 기반 `CourseSearchViewModel` · `TimetableViewModel`로 목록, 필터 선택, 로딩/에러 상태 관리

</details>

<details>
<summary><b>전시언</b></summary>

<br>

**강의평 View**
- 강의평 목록을 `List` 기반 `CourseReviewView`로 구현
  - 리뷰 한 줄(`ReviewRowView`)에 별점 · 작성자 · 본문 · 추천/신고 버튼 배치
- 상단 헤더에 강의명(`TopBar`), 평균 평점과 별점(`Score`) 표시
- 강의평 리스트 상단에 키워드 칩(`ChipButton`)을 가로 스크롤로 배치
  - 칩 선택 시 해당 키워드 관련 강의평만 노출
  - 이미 선택된 칩을 다시 선택하면 전체 강의평 노출
- 하단 "평가하기" 버튼과 `NavigationTab`을 `safeAreaInset`으로 배치해 마지막 리뷰까지 가려지지 않게 처리

**API 연동**
- `ReviewService`로 강의평, 평점, 키워드 데이터를 API에서 받아 반영
  - 선택한 키워드 ID로 필터링한 강의평 API를 호출해 키워드별 강의평 반영
  - 응답 DTO를 도메인 모델로 변환(`toDomain()`)해 View에서 사용
- `@Observable` 기반 `ReviewCheckViewModel`로 강의평 · 키워드 · 선택 상태 · 로딩/에러 상태 관리
- 최신순(`latest`) 정렬로 조회

</details>

<br>

## 🛠 Development Environment

| 항목 | 환경 |
|---|---|
| Language | Swift |
| UI Framework | SwiftUI |
| IDE | Xcode 27.1 |
| Deployment Target | iOS 17.6 |
| Architecture | MVVM |

<br>

## 🏗 Architecture

**MVVM (Model - View - ViewModel)**

SwiftUI의 선언형 UI와 Observation을 활용하여 화면과 상태 관리 로직을 분리합니다.

- **Model**: 강의, 시간표, 강의평 등 데이터 모델 정의
- **View**: SwiftUI 기반 UI 구성 및 사용자 이벤트 전달
- **ViewModel**: 화면 상태 관리 및 비즈니스 로직 수행
- **DTO**: API 요청 및 응답 데이터 형식 정의
- **Service**: URLSession을 이용한 API 요청과 응답 처리

```text
          ┌──────────────┐
          │     View     │
          │   SwiftUI    │
          └──────┬───────┘
                 │
          ┌──────▼───────┐
          │  ViewModel   │
          │ @Observable  │
          └──────┬───────┘
                 │
          ┌──────▼───────┐
          │   Service    │
          │  URLSession  │
          └──────────────┘
```

<br>

## ⚙️ Library & Stack

### iOS Development

![Swift](https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-007AFF?style=for-the-badge&logo=swift&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-147EFB?style=for-the-badge&logo=xcode&logoColor=white)

| 기술 | 사용 목적 |
|---|---|
| SwiftUI | 선언형 UI 구현 |
| Observation | ViewModel 상태 관찰 및 UI 갱신 |
| Swift Concurrency | async/await 기반 비동기 처리 |
| URLSession | REST API 통신 |
| Codable | JSON 데이터 인코딩 및 디코딩 |

### Collaboration

![Git](https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![Notion](https://img.shields.io/badge/Notion-000000?style=for-the-badge&logo=notion&logoColor=white)
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)

<br>

## 📏 Git Convention

<details>
<summary><b>🌿 Branch</b></summary>

<br>

브랜치는 이슈 번호를 포함하여 생성합니다.

`타입/#이슈번호-구현할기능`

```text
feat/#2-course-search
design/#3-timetable-view
fix/#4-course-layout
```

</details>

<details>
<summary><b>🏷️ Commit Tag</b></summary>

<br>

| 태그 | 설명 |
|---|---|
| `feat` | 새로운 기능 구현 |
| `design` | UI 구현 및 디자인 변경 |
| `docs` | README, 템플릿 등 문서 수정 |
| `fix` | 버그 및 오류 수정 |
| `refactor` | 기능 변경 없는 코드 리팩토링 |
| `hotfix` | 치명적인 버그의 긴급 수정 |
| `chore` | 프로젝트 설정 등 기타 유지보수 작업 |

</details>

<details>
<summary><b>💬 Commit Message</b></summary>

<br>

`타입: 커밋 내용`

**규칙**

1. 태그는 반드시 소문자로 작성합니다.
2. 커밋 내용은 한글로 작성합니다.
3. 제목은 50자 이내로 간결하게 작성합니다.
4. 상세 설명이 필요한 경우 본문에 작성합니다.

**예시**

```text
chore: 프로젝트 초기 세팅
design: 시간표 그리드 UI 구현
feat: 강의 검색 기능 구현
feat: 강의 목록 API 연결
fix: 시간표 강의 블록 위치 오류 수정
refactor: 시간표 좌표 계산 로직 분리
```

</details>

<details>
<summary><b>📌 Issue & Pull Request</b></summary>

<br>

### Issue

**제목**

`[타입] 작업 내용`

```text
[Design] 시간표 UI 구현
[Feat] 강의 검색 기능 구현
[Fix] 시간표 레이아웃 오류 수정
```

**Labels**

- 팀원 이름
- `Feature`: 기능 구현
- `Design`: UI 구현
- `API`: API 연결
- `Fix`: 오류 수정

### Pull Request

**제목**

`[타입/#이슈번호] 작업 내용`

```text
[Feat/#2] 강의 검색 API 연결
[Design/#3] 시간표 UI 구현
[Fix/#4] 강의 블록 정렬 오류 수정
```

- Reviewer는 본인을 제외한 팀원으로 지정합니다.
- 관련 이슈를 연결합니다.
- 구현 내용과 변경 사항을 명시합니다.
- UI 변경 시 스크린샷 또는 GIF를 첨부합니다.
- 셀프 코드 리뷰 후 PR을 생성합니다.

</details>

<br>

## 📝 Code Convention

SwiftUI 프로젝트의 일관된 코드 스타일과 유지보수성을 위해 다음 규칙을 적용합니다.

<details>
<summary><b>📐 Swift Code Style</b></summary>

<br>

| 항목 | 규칙 |
|---|---|
| Indentation | Tab |
| Type Naming | UpperCamelCase |
| Variable / Function | lowerCamelCase |
| Access Control | 필요한 최소 범위로 제한 |
| Class | 상속이 불필요한 경우 `final` |
| SwiftUI Modifier | 한 줄에 하나씩 작성 |
| State Management | `@State`, `@Observable` |
| Code Organization | MARK를 이용한 역할별 구분 |
| Preview | 주요 View에 Mock Preview 작성 |
| Documentation | 필요한 경우 `///` 문서화 주석 사용 |

</details>

<details>
<summary><b>🍎 SwiftUI Principles</b></summary>

<br>

- View는 UI 표현 및 사용자 이벤트 전달을 담당합니다.
- ViewModel은 화면 상태와 비즈니스 로직을 관리합니다.
- API 통신 로직은 별도 계층으로 분리합니다.
- 재사용되는 UI는 공통 컴포넌트로 분리합니다.
- 불필요한 강제 언래핑과 중복 코드를 지양합니다.

</details>

<br>

## 📂 Foldering

```text
EVERYTIME/
├── EVERYTIME.xcodeproj/
└── EVERYTIME/
    ├── App/
    │   └── EverytimeApp.swift
    ├── Features/
    │   ├── CourseReview/
    │   │   ├── Model/
    │   │   ├── View/
    │   │   └── ViewModel/
    │   └── Timetable/
    │       ├── Model/
    │       ├── View/
    │       └── ViewModel/
    ├── Global/
    │   ├── Components/
    │   └── Extensions/
    ├── Network/
    │   ├── DTO/
    │   ├── Service/
    │   └── NetworkError.swift
    ├── Resources/
    │   ├── Assets.xcassets/
    │   └── Fonts/
    ├── Config.xcconfig
    └── Info.plist
```


<br>

## 🔗 References

- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [StyleShare Swift Style Guide](https://github.com/StyleShare/swift-style-guide/)
- [Apple SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Apple Observation Documentation](https://developer.apple.com/documentation/observation)
