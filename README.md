# Permission
对系统权限进行的封装，支持iOS 14。采用Swift编写，不支持OC

## 特点
把系统权限的获取与请求统一起来，不用每次都去写重复代码。目前支持:
- 相机
- 相册
- 麦克风
- 通讯录
- 日历
- 提醒

## 安装
#### 手动
推荐使用CocoaPods安装

#### CocoaPods
- 导入所有模块

```
pod 'GLPermission'
```
- 导入相机模块

```
pod 'GLPermission/Camera'
```

- 导入麦克风模块

```
pod 'GLPermission/Microphone'
```

- 导入相册模块

```
pod 'GLPermission/Photo'
```

- 导入联系人模块

```
pod 'GLPermission/Contacts'
```

- 导入提醒模块

```
pod 'GLPermission/Reminder'
```

- 导入日历模块

```
pod 'GLPermission/Calendar'
```


如果提示未找到，先执行`pod repo update`，再执行`pod install`。支持`iOS 9.0`以上系统

## 使用(具体用法请查看Demo，使用方法非常简单)
以相机来举例子

- 获取相机权限

```
let authorizationStatus = GLMicrophonePermission.authorizationStatus
print("麦克风权限状态: \(authorizationStatus.rawValue)")
```

- 请求相机权限

```
GLMicrophonePermission.requestAuthorization { (authorizationStatus) in
    print("请求麦克风权限状态: \(authorizationStatus.rawValue)")
}
```

## 使用过程中的注意事项
- 建议只导入需要使用的那个模块，否则你的`plist`文件需要把所有的权限都加上

## 更新记录(倒叙)
### 1、1.0.0（2020.10.24）
- 发布首个版本

## 补充
该仓库会不断进行优化，在使用过程中，有任何建议或问题，欢迎提issue，或者通过邮箱1035841713@qq.com联系我<br>
喜欢就star❤️一下吧