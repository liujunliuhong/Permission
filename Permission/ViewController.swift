//
//  ViewController.swift
//  Permission
//
//  Created by galaxy on 2020/10/24.
//

import UIKit
import AVFoundation
import Photos
import Contacts
import EventKit

fileprivate struct Model {
    let title: String
    let selector: Selector
    init(title: String, selector: Selector) {
        self.title = title
        self.selector = selector
    }
}

public class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "ID")
        return tableView
    }()
    
    private var dataSource: [Model] = []
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.frame = self.view.bounds
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .always
        } else {
            self.automaticallyAdjustsScrollViewInsets = true
        }
        
        let model1 = Model(title: "获取相机权限状态", selector: #selector(getCameraAuthorizationStatus))
        let model2 = Model(title: "请求相机权限", selector: #selector(requestCameraAuthorization))
        
        let model3 = Model(title: "获取麦克风权限状态", selector: #selector(getMicrophoneAuthorizationStatus))
        let model4 = Model(title: "请求麦克风权限", selector: #selector(requestMicrophoneAuthorization))
        
        let model5 = Model(title: "获取相册权限状态", selector: #selector(getPhotoAuthorizationStatus))
        let model6 = Model(title: "请求相册权限", selector: #selector(requestPhotoAuthorization))
        
        let model7 = Model(title: "获取联系人权限状态", selector: #selector(getContactsAuthorizationStatus))
        let model8 = Model(title: "请求联系人权限", selector: #selector(requestContactsAuthorization))
        
        let model9 = Model(title: "获取提醒权限状态", selector: #selector(getReminderAuthorizationStatus))
        let model10 = Model(title: "请求提箱权限", selector: #selector(requestReminderAuthorization))
        
        let model11 = Model(title: "获取日历权限状态", selector: #selector(getCalendarAuthorizationStatus))
        let model12 = Model(title: "请求日历权限", selector: #selector(requestCalendarAuthorization))
        
        self.dataSource = [model1,
                           model2,
                           model3,
                           model4,
                           model5,
                           model6,
                           model7,
                           model8,
                           model9,
                           model10,
                           model11,
                           model12]
        
        
        self.view.addSubview(self.tableView)
        self.tableView.reloadData()
    }
}

// MARK: - Camera
extension ViewController {
    @objc private func getCameraAuthorizationStatus() {
        let authorizationStatus = GLCameraPermission.authorizationStatus
        print("相机权限状态: \(authorizationStatus.rawValue)")
    }
    @objc private func requestCameraAuthorization() {
        GLCameraPermission.requestAuthorization { (authorizationStatus) in
            print("请求相机权限状态: \(authorizationStatus.rawValue)")
        }
    }
}

// MARK: - Microphone
extension ViewController {
    @objc private func getMicrophoneAuthorizationStatus() {
        let authorizationStatus = GLMicrophonePermission.authorizationStatus
        print("麦克风权限状态: \(authorizationStatus.rawValue)")
    }
    @objc private func requestMicrophoneAuthorization() {
        GLMicrophonePermission.requestAuthorization { (authorizationStatus) in
            print("请求麦克风权限状态: \(authorizationStatus.rawValue)")
        }
    }
}

// MARK: - Photo
extension ViewController {
    @objc private func getPhotoAuthorizationStatus() {
        let authorizationStatus = GLPhotoPermission.authorizationStatus
        print("相册权限状态: \(authorizationStatus.rawValue)")
    }
    @objc private func requestPhotoAuthorization() {
        GLPhotoPermission.requestAuthorization { (authorizationStatus) in
            print("请求相册权限状态: \(authorizationStatus.rawValue)")
        }
    }
}

// MARK: - contacts
extension ViewController {
    @objc private func getContactsAuthorizationStatus() {
        let authorizationStatus = GLContactsPermission.authorizationStatus
        print("联系人权限状态: \(authorizationStatus.rawValue)")
    }
    @objc private func requestContactsAuthorization() {
        GLContactsPermission.requestAuthorization { (authorizationStatus) in
            print("请求联系人权限状态: \(authorizationStatus.rawValue)")
        }
    }
}


// MARK: - reminder
extension ViewController {
    @objc private func getReminderAuthorizationStatus() {
        let authorizationStatus = GLReminderPermission.authorizationStatus
        print("提醒权限状态: \(authorizationStatus.rawValue)")
    }
    
    @objc private func requestReminderAuthorization() {
        GLReminderPermission.requestAuthorization { (authorizationStatus) in
            print("请求提醒权限状态: \(authorizationStatus.rawValue)")
        }
    }
}


// MARK: - calendar
extension ViewController {
    @objc private func getCalendarAuthorizationStatus() {
        let authorizationStatus = GLCameraPermission.authorizationStatus
        print("日历权限状态: \(authorizationStatus.rawValue)")
    }
    
    @objc private func requestCalendarAuthorization() {
        GLCalendarPermission.requestAuthorization { (authorizationStatus) in
            print("请求日历权限状态: \(authorizationStatus.rawValue)")
        }
    }
}


extension ViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ID")
        let model = self.dataSource[indexPath.row]
        cell?.textLabel?.text = model.title
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model = self.dataSource[indexPath.row]
        self.perform(model.selector)
    }
}


