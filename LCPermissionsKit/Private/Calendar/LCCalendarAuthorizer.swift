//
//  LCCalendarAuthorizer.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Cocoa
import EventKit

/// 日历权限 授权器
class LCCalendarAuthorizer: NSObject {
    
    // 事件实体类型，默认为事件
    private var entityType: EKEntityType

    /// 创建事件权限授权器实例
    static func events() -> LCCalendarAuthorizer {
        return LCCalendarAuthorizer(entityType: .event)
    }

    /// 创建提醒事项权限授权器实例
    static func reminders() -> LCCalendarAuthorizer {
        return LCCalendarAuthorizer(entityType: .reminder)
    }

    /// 初始化方法，设置实体类型
    ///
    /// - Parameter entityType: 要授权的日历实体类型
    init(entityType: EKEntityType) {
        self.entityType = entityType
    }
    
    /// 将`事件权限授权状态`转换为`自定义权限授权状态`
    ///
    /// - Parameter status: EKAuthorizationStatus，事件权限的授权状态
    /// - Returns: LCAuthorizationStatus，对应的自定义权限授权状态
    private func authorizationStatus(from status: EKAuthorizationStatus) -> LCAuthorizationStatus {
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
extension LCCalendarAuthorizer: LCAuthorizer {
    
    func authorizationStatus() -> LCAuthorizationStatus {
        // 获取事件（日历）权限的授权状态
        let status = EKEventStore.authorizationStatus(for: self.entityType)
        return authorizationStatus(from: status)
        
    }
    // 请求事件（日历）权限的授权
    func requestAuthorization(withCompletion completionHandler: @escaping (LCAuthorizationStatus) -> Void) {
        // 创建事件（日历）存储对象
        let store = EKEventStore()
        // 请求事件（日历）权限
        store.requestAccess(to: self.entityType) { (granted, error) in
            completionHandler(granted ? .authorized : .denied)
        }
    }
}
