//
//  LCFullDiskAccessAuthorizer.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Cocoa



class LCFullDiskAccessAuthorizer: NSObject {

    /// 共享的单例实例
    static let shared = LCFullDiskAccessAuthorizer()
    
    /// 文件管理器
    private var fileManager: FileManager
    
    /// 工作区
    private var workspace: NSWorkspace
    
    /// 用户主目录路径
    private var userHomeFolderPath: String?

    // 初始化方法，可以传入`自定义的文件管理器`和`工作区`
    init(fileManager: FileManager = FileManager.default, workspace: NSWorkspace = NSWorkspace.shared) {
        self.fileManager = fileManager
        self.workspace = workspace
    }
    
    /// 检查`完全磁盘访问权限`，使用`指定文件`进行检测
    ///
    /// - Parameter path: 指定的文件路径
    /// - Returns: LCAuthorizationStatus，完全磁盘访问权限的授权状态
    private func checkFDA(usingFile path: String) -> LCAuthorizationStatus {
        // 尝试以 只读模式 打开 指定路径 的文件
        let file = open(path, O_RDONLY)
        
        // 检查文件是否成功打开
        if file != -1 {
            // 如果成功打开，则 关闭文件 并返回 已授权 状态
            close(file)
            return .authorized
        }
        
        // 如果打开文件失败，则检查错误码以确定授权状态
        if errno == EPERM || errno == EACCES {
            // 如果权限不足，则返回拒绝状态
            return .denied
        }
        
        // 如果未确定授权状态，则返回未确定状态
        return .notDetermined
    }

    /// 获取`完全磁盘访问权限`的`授权状态`
    ///
    /// - Returns: LCAuthorizationStatus，完全磁盘访问权限的授权状态
    private func fullDiskAuthorizationStatus() -> LCAuthorizationStatus {
        // 定义测试文件路径数组
        let testFiles = [
            getUserHomeFolderPath().appending("/Library/Safari/CloudTabs.db"),
            getUserHomeFolderPath().appending("/Library/Safari/Bookmarks.plist"),
            "/Library/Application Support/com.apple.TCC/TCC.db",
            "/Library/Preferences/com.apple.TimeMachine.plist",
        ]
        
        // 初始化授权状态为未确定
        var resultStatus = LCAuthorizationStatus.notDetermined
        
        // 遍历 测试文件路径 数组，检查每个文件的 磁盘访问权限
        for file in testFiles {
            let status = checkFDA(usingFile: file)
            
            // 如果有一个文件已授权，则整体状态为已授权，并跳出循环
            if status == .authorized {
                resultStatus = .authorized
                break
            }
            
            // 如果有一个文件权限被拒绝，则整体状态为被拒绝
            if status == .denied {
                resultStatus = .denied
            }
        }
        
        // 返回最终的磁盘访问权限授权状态
        return resultStatus
    }

    
    /// 获取用户主目录路径
    ///
    /// - Returns: 用户主目录路径
    private func getUserHomeFolderPath() -> String {
        if let path = userHomeFolderPath {
            return path
        }
        let isSandboxed = ProcessInfo.processInfo.environment["APP_SANDBOX_CONTAINER_ID"] != nil
        if isSandboxed {        // 沙盒
            let pw = getpwuid(getuid())
            assert(pw != nil)
            userHomeFolderPath = String(cString: pw!.pointee.pw_dir)
        } else {                // 非沙盒
            userHomeFolderPath = NSHomeDirectory()
        }
        return userHomeFolderPath!
    }
    
    /// 打开系统偏好设置 - 完全磁盘访问权限
    private func openPreferences() {
        // 使用工作区打开系统偏好设置中的完全磁盘访问权限设置页面
        workspace.open(URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_AllFiles")!)
    }
}



//MARK: - LCAuthorizer
extension LCFullDiskAccessAuthorizer: LCAuthorizer {

    func authorizationStatus() -> LCAuthorizationStatus {
        //MARK: 获取 完全磁盘访问权限 的 授权状态
        if #available(macOS 10.14, *) {
            // 获取系统完全磁盘访问权限状态
            return fullDiskAuthorizationStatus()
        } else {
            // 在 macOS 10.14 以下版本，默认返回已授权
            return .authorized
        }
    }

    func requestAuthorization(withCompletion completionHandler: @escaping (LCAuthorizationStatus) -> Void) {
        //MARK: 请求完全磁盘访问权限的授权
        if #available(macOS 10.14, *) {
            // 在 macOS 10.14 及以上版本，打开系统偏好设置页面
            openPreferences()
        } else {
            // 在 macOS 10.14 以下版本，默认返回已授权
            completionHandler(.authorized)
        }
    }
}
