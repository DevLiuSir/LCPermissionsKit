//
//  ViewController.swift
//  LCPermissionsKit
//
//  Created by Liu Chuan on 2023/1/17.
//

import Cocoa
import LCPermissionsKit


class ViewController: NSViewController {
    
    @IBOutlet weak var contactsLabel: NSTextField!
    @IBOutlet weak var calendarLabel: NSTextField!
    @IBOutlet weak var remindersLabel: NSTextField!
    @IBOutlet weak var photosLabel: NSTextField!
    @IBOutlet weak var fullDiskAccessLabel: NSTextField!
    
    // 定义包含 NSTextField 的数组属性
    var statusLabels: [NSTextField] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        /// 权限状态（全盘访问）
//        let status = LCPermissionsKit.authorizationStatus(for: .fullDiskAccess)
//        
//        // 如果没有认证权限，加载授权窗口
//        if status != .authorized {
//            // 请求全盘访问
//            LCPermissionsKit.requestAuthorization(for: .fullDiskAccess) { status in
//                print(status)
//            }
//        }else {
//            print("是否已获得：完全磁盘盘访问权限 \(status)")
//        }
        
        
        
        statusLabels = [calendarLabel, remindersLabel, contactsLabel, photosLabel, fullDiskAccessLabel]
        
        updateLabels()
    }

}



//MARK: - Actions
extension ViewController {
    
    @IBAction func authorize(_ button: NSButton) {
        LCPermissionsKit.shared.requestAuthorization(for: LCPermissionType(rawValue: button.tag)!) { status in
            DispatchQueue.main.async {
                self.statusLabels[button.tag].stringValue = self.stringFromStatus(status)
            }
        }
    }

    
}



extension ViewController {
    
    // MARK: - Private

    // 更新标签文本内容
    private func updateLabels() {
        // 遍历状态标签数组，更新每个标签的文本内容
        statusLabels.enumerated().forEach { index, label in
            // 根据索引获取对应权限类型的授权状态
            let status = LCPermissionsKit.shared.authorizationStatus(for: LCPermissionType(rawValue: index)!)
            // 更新标签的文本内容
            label.stringValue = stringFromStatus(status)
        }
    }
    
    /// 根据权限授权状态返回相应的字符串
    /// - Parameter authorizationStatus: 权限授权状态
    /// - Returns: 对应的字符串描述
    private func stringFromStatus(_ authorizationStatus: LCAuthorizationStatus) -> String {
        switch authorizationStatus {
        case .denied:
            return "拒绝"
        case .authorized:
            return "已授权"
        case .notDetermined:
            return "未确定"
        case .limited:
            return "有限授权"
        }
    }

    
    
}
