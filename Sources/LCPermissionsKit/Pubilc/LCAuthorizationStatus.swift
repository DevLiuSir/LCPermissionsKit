//
//  LCAuthorizationStatus.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Foundation


/// 授权状态
public enum LCAuthorizationStatus: Int {
    /// 未确定状态，用户尚未做出授权选择
    case notDetermined
    /// 拒绝授权状态，用户明确拒绝了权限
    case denied
    /// 授权状态，用户已授权
    case authorized
    /// 有限授权状态，仅在 macOS 10.11 及以上版本可用
    @available(macOS 10.11, *)
    case limited
}
