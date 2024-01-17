//
//  LCAuthorizer.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Foundation


/// 权限授权器的协议
protocol LCAuthorizer {
    
    /// 获取`权限`的`授权状态`
    ///
    /// - Returns: LCAuthorizationStatus，权限的授权状态
    func authorizationStatus() -> LCAuthorizationStatus
    
    /// `请求权限`的`授权`
    ///
    /// - Parameter completionHandler: 授权请求完成后的回调，返回授权状态
    func requestAuthorization(withCompletion completionHandler: @escaping (LCAuthorizationStatus) -> Void)
}

