//
//  LCContactsAuthorizer.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Cocoa
import Contacts

/// 联系人授权器
class LCContactsAuthorizer: NSObject {
    
    /// 将 `CNAuthorizationStatus` 转换为 `LCAuthorizationStatus`
    ///
    /// - Parameter status: CNAuthorizationStatus，通讯录权限的授权状态
    /// - Returns: LCAuthorizationStatus，对应的自定义权限授权状态
    private func authorizationStatus(from status: CNAuthorizationStatus) -> LCAuthorizationStatus {
        /// 根据通讯录权限状态进行判断并转换
        switch status {
        case .denied, .restricted:
            return .denied
        case .authorized:
            return .authorized
        case .notDetermined:
            return .notDetermined
        @unknown default:
            return .notDetermined
        }
    }
}

//MARK: - LCAuthorizer
extension LCContactsAuthorizer: LCAuthorizer {
    
    func authorizationStatus() -> LCAuthorizationStatus {
        if #available(macOS 10.11, *) {
            // 获取系统通讯录权限状态
            let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
            return self.authorizationStatus(from: authorizationStatus)
        } else {        // 在 macOS 10.11 以下版本，默认返回已授权
            return .authorized
        }
    }

    func requestAuthorization(withCompletion completionHandler: @escaping (LCAuthorizationStatus) -> Void) {
        if #available(macOS 10.11, *) {      // 在 macOS 10.11 及以上版本，使用 CNContactStore 请求通讯录权限
            let store = CNContactStore()
            store.requestAccess(for: .contacts) { (granted, error) in
                completionHandler(granted ? .authorized : .denied)
            }
        } else {                            // 在 macOS 10.11 以下版本，默认返回已授权
            completionHandler(.authorized)
        }
    }
    
}
