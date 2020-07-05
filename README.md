# AppleMusicJwtManager

### powered by [Swift-JWT](https://github.com/IBM-Swift/Swift-JWT/)
## Installation
dependencies: 
```package.swift
.package(url: "https://github.com/g4zeru/AppleMusicJwtManager.git", from: "0.0.2")
```
targets:
```package.swift
.target(
    name: "YourProject",
    dependencies: ["AppleMusicJwtManager"]),
```
## Usage

```main.swift
struct MySecret: SecretProtocol {
    let keyID: String = "ABCDEFGHIJ"
    let teamID: String = "ABCDEFGHIJ"
    let jwtExpiration: DateInterval = .init(start: Date(), duration: 86400)
    let privateKey: String = """
-----BEGIN PRIVATE KEY-----
ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQR
-----END PRIVATE KEY-----
"""
}
AppleMusicJwtManager.shared.refreshToken(secret: MySecret())
print(AppleMusicJwtManager.shared.currentToken)
print(AppleMusicJwtManager.shared.exp)
```
