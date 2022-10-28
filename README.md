# GRIG-SDK 연동가이드 (iOS)

### Quick Start
GRIG-SDK를 사용하기 위한 최소한의 연동 단계를 안내합니다.

### installation

**SwiftPackageManager**
```swift
import PackageDescription

let package = Package(
  name: "MyApp",
  dependencies: [
    .Package(url: "https://github.com/JiHoonAHN/GRIG-SDK.git", from: "0.1.10"),
 ]
)
```

**CocoaPods**
```ruby
pod 'GRIGSDK', '~> 0.1.10'
```

System Requirement
1. 빌드환경: Xcode
2. Xcode version : 13.0 이상
3. iOS version : 12.0 이상
```

#### SDK import 경로
SDK 사용 준비가 완료되면 아래와 같이 SDK 에 대한 import 경로를 사용합니다.

```swift
import GRIGSDK
```

**Github Login**
GRIG-SDK를 사용하기 위해서는 Github 로그인이 필요합니다.

```swift
GRIG.get_instance.githubUserInfo(login: "", from: "", to: "") { result in
    switch result {
    case .success(let user):
      // Success
    case .failure(let error):
      // Fail
    }
}
```

**Github Total Contribution**
Github 전체 Contribution을 불러옵니다.

```swift
GRIG.get_instance.githubUserTotalContribution(login: "") { result in
    switch result {
    case .success(let contribution):
        // Suceess
    case .failure(let error):
        // Error
    }
}
```


**GRIG Generation List**
GRIG 서비스를 이용하고 있는 모든 사용자를 조회합니다.

```swift
GRIG.get_instance.grigGenerationList { result in
    switch result {
    case .success(let list):
        //success
    case .failure(let error):
        //fail
    }
}
```

**GRIG Rank List**
요구하는 criteria에 맞는 정보를 List로 불러옵니다.
```swift
GRIG.get_instance.grigRankList(criteria: Criteria, count: 0, page: 0, generation: 0) { result in
    switch result {
    case .success(let success):
        //success
    case .failure(let failure):
        //failure
    }
}
```
