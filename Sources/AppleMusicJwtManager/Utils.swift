//
//  Utils.swift
//  
//
//  Created by iniad on 2020/07/04.
//

import Foundation

public extension Notification.Name {
    static let refreshedJwtToken: Notification.Name = .init(rawValue: "refreshedJwtToken")
    static let failedRefreshJwtToken: Notification.Name = .init(rawValue: "failedRefreshjwt")
}
