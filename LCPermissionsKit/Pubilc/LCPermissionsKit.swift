//
//  LCPermissionsKit.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Foundation


public class LCPermissionsKit: NSObject {
    
    /// 单列
    public static let shared = LCPermissionsKit()
    
    /// `权限类型`对应的`授权器集合`
    private static let authorizers: [LCPermissionType: LCAuthorizer] = [
        .photos: LCPhotosAuthorizer(),
        .contacts: LCContactsAuthorizer(),
        .calendar: LCCalendarAuthorizer.events(),
        .reminders: LCCalendarAuthorizer.reminders(),
        .fullDiskAccess: LCFullDiskAccessAuthorizer()
    ]
    
    /// 获取`指定权限类型`的`授权状态`
    public func authorizationStatus(for permissionType: LCPermissionType) -> LCAuthorizationStatus {
        guard let authorizer = LCPermissionsKit.authorizers[permissionType] else {
            fatalError("无法找到类型为 \(permissionType) 的授权器")
        }
        return authorizer.authorizationStatus()
    }
    
    /// 请求`指定权限类型`的`授权`
    ///
    /// - Parameters:
    ///   - permissionType: 要请求授权的权限类型
    ///   - completionHandler: 授权请求完成后的回调，返回授权状态
    public func requestAuthorization(for permissionType: LCPermissionType, withCompletion completionHandler: @escaping (LCAuthorizationStatus) -> Void) {
        guard let authorizer = LCPermissionsKit.authorizers[permissionType] else {
            fatalError("无法找到类型为 \(permissionType) 的授权器")
        }
        authorizer.requestAuthorization(withCompletion: completionHandler)
    }
}
