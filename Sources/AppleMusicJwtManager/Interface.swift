//
//  interface.swift
//  

import Foundation

public protocol SecretProtocol {
    /*
     e.g.
     https://developer.apple.com/account/resources/authkeys/list
     View key details
     */
    var keyID: String { get }
    /*
     e.g.
     https://developer.apple.com/account/#/membership/
     Membership Information → Team ID
     */
    var teamID: String { get }
    /*
     Determine the expiration date of the token.
     */
    var jwtExpiration: DateInterval { get }
    /*
     e.g.
     -----BEGIN PRIVATE KEY-----
     YOURPRIVATE KEY
     -----END PRIVATE KEY-----
     
     must include begin header and end footer
     */
    var privateKey: String { get }
}

public struct Secret: SecretProtocol {
    public let keyID: String
    public let teamID: String
    public let jwtExpiration: DateInterval
    public let privateKey: String
    public init(keyID: String, teamID: String, expiration: TimeInterval, privateKey: String) {
        self.keyID = keyID
        self.teamID = teamID
        self.jwtExpiration = .init(start: Date(), duration: expiration)
        self.privateKey = privateKey
    }
}
