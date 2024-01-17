//
//  LCContactsAuthorization.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Foundation
import Contacts

/// 联系人授权
class LCContactsAuthorization: NSObject {
   
    /// 获取通讯录实体类型的授权状态
    ///
    /// - Parameter entityType: 要查询的通讯录实体类型
    /// - Returns: 授权状态
    static func authorizationStatus(for entityType: CNEntityType) -> CNAuthorizationStatus {
        return CNContactStore.authorizationStatus(for: entityType)
    }
}
