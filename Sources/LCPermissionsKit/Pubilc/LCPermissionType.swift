//
//  LCPermissionType.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Foundation

/// 权限类型
public enum LCPermissionType: Int {
    /// 日历权限
    case calendar = 0
    /// 提醒事项权限
    case reminders
    /// 联系人权限
    case contacts
    /// 照片权限
    case photos
    /// 完全磁盘访问权限
    case fullDiskAccess
}

