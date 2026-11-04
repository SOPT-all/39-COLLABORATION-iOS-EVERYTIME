# 39-COLLABORATION-iOS-EVERYTIME
> PLAY SOPT 39기 합동세미나 모바일 앱 4조 iOS | 에브리타임 🎓


<br>

## 👩🏻‍💻 iOS Developers

| **이서영** | **전시언** |
| :---: | :---: |
| [<img width="200" height="200" src="https://github.com/user-attachments/assets/40d4ec25-802f-4d1c-b80f-12a170b0bf31" />](https://github.com/amie-lee) | [<img width="200" height="200" src="https://github.com/user-attachments/assets/4bfaff26-39f9-4f1b-a535-1a1981ff9d84" />](https://github.com/siiooin) |

<br>

## 🛠 Development Environment

| 항목 | 환경 |
|---|---|
| Language | Swift |
| UI Framework | SwiftUI |
| IDE | Xcode 27.1 |
| Deployment Target | iOS 17 |
| Architecture | MVVM |

<br>

## 🏗 Architecture

**MVVM (Model - View - ViewModel)**

SwiftUI의 선언형 UI와 Observation을 활용하여 화면과 상태 관리 로직을 분리합니다.

- **Model**: 강의, 시간표, 강의평 등 데이터 모델 정의
- **View**: SwiftUI 기반 UI 구성 및 사용자 이벤트 전달
- **ViewModel**: 화면 상태 관리 및 비즈니스 로직 수행
- **Repository**: API 통신과 데이터 접근 로직 분리

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
          │  Repository  │
          └──────┬───────┘
                 │
          ┌──────▼───────┐
          │  API Client  │
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
[ProjectName]/
├── App/
│   └── ProjectApp.swift
│
├── Global/
│   ├── Components/
│   │   ├── ToastView.swift
│   │   └── CommonButton.swift
│   └── Extensions/
│
├── Models/
│   ├── Course.swift
│   ├── CourseSchedule.swift
│   └── CourseReview.swift
│
├── Network/
│   ├── APIClient.swift
│   ├── DTO/
│   └── Repository/
│       └── CourseRepository.swift
│
├── Features/
│   ├── Timetable/
│   │   ├── TimetableView.swift
│   │   ├── TimetableViewModel.swift
│   │   ├── TimetableGridView.swift
│   │   ├── CourseBlockView.swift
│   │   └── TimetableLayout.swift
│   │
│   ├── CourseSearch/
│   │   ├── CourseSearchView.swift
│   │   ├── CourseSearchViewModel.swift
│   │   ├── CourseRowView.swift
│   │   └── CourseGroupView.swift
│   │
│   └── CourseReview/
│       ├── CourseReviewView.swift
│       ├── CourseReviewViewModel.swift
│       └── ReviewRowView.swift
│
└── Resources/
    ├── Assets.xcassets
    └── MockData/
```

<br>

## 🔗 References

- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [StyleShare Swift Style Guide](https://github.com/StyleShare/swift-style-guide/)
- [Apple SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Apple Observation Documentation](https://developer.apple.com/documentation/observation)
