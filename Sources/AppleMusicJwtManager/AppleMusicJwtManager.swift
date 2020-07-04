//
//  AppleMusicJwtManager.swift
//

import SwiftJWT
import Foundation

public class AppleMusicJwtManager {
    struct Payload: Claims {
        let iss: String
        let exp: Int
        let iat: Int
    }
    public var currentToken: String? = nil
    public var exp: Date? = nil
    static let shared: AppleMusicJwtManager = AppleMusicJwtManager()
    private func reset() {
        currentToken = nil
        exp = nil
    }
    @discardableResult
    public func refreshToken(secret: SecretProtocol) throws -> String {
        let header = Header(kid: secret.keyID)
        var jwt = JWT(header: header, claims: Payload(iss: secret.teamID, exp: Int(secret.jwtExpiration.end.timeIntervalSince1970), iat: Int(secret.jwtExpiration.start.timeIntervalSince1970)))
        let key = secret.privateKey.data(using: .utf8)!
        do {
            reset()
            let token = try jwt.sign(using: .es256(privateKey: key))
            currentToken = token
            exp = secret.jwtExpiration.end
            NotificationCenter.default.post(.init(name: .refreshedJwtToken, object: self))
            return token
        } catch {
            NotificationCenter.default.post(.init(name: .failedRefreshJwtToken, object: self))
            throw error
        }
    }
}
 
