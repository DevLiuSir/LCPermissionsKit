//
//  LCPhotosAuthorizer.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Cocoa
import Photos


/// 照片权限 授权器
class LCPhotosAuthorizer: NSObject {
    
    /// 将`照片权限授权状态`转换为`自定义权限授权状态`
    ///
    /// - Parameter status: PHAuthorizationStatus，照片权限的授权状态
    /// - Returns: LCAuthorizationStatus，对应的自定义权限授权状态
    private func authorizationStatus(from status: PHAuthorizationStatus) -> LCAuthorizationStatus {
        switch status {
        case .denied, .restricted:
            return .denied
        case .authorized:
            return .authorized
        case .notDetermined:
            return .notDetermined
        case .limited:
            return .limited
        @unknown default:
            return .denied
        }
    }
}

//MARK: - LCAuthorizer
extension LCPhotosAuthorizer: LCAuthorizer {
    
    func authorizationStatus() -> LCAuthorizationStatus {
        //MARK: 获取照片权限的授权状态
        if #available(macOS 10.13, *) {
            // 获取系统照片权限状态
            let status = PHPhotoLibrary.authorizationStatus()
            return authorizationStatus(from: status)
        } else {
            // 在 macOS 10.13 以下版本，默认返回已授权
            return .authorized
        }
    }
    
    func requestAuthorization(withCompletion completionHandler: @escaping (LCAuthorizationStatus) -> Void) {
        //MARK:  请求照片权限的授权
        if #available(macOS 10.13, *) {
            // 在 macOS 10.13 及以上版本，使用 PHPhotoLibrary 请求照片权限
            PHPhotoLibrary.requestAuthorization { status in
                completionHandler(self.authorizationStatus(from: status))
            }
        } else {
            // 在 macOS 10.13 以下版本，默认返回已授权
            completionHandler(.authorized)
        }
        
    }
}
