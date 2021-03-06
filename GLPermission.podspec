
Pod::Spec.new do |s|
  s.name             = 'GLPermission'
  s.version          = '1.0.0'
  s.summary          = '系统权限管理工具'
  s.description      = '系统权限管理工具，采用Swift编写'
  s.homepage         = 'https://github.com/liujunliuhong/Permission'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'liujunliuhong' => '1035841713@qq.com' }
  s.source           = { :git => 'https://github.com/liujunliuhong/Permission.git', :tag => s.version.to_s }

  s.module_name = 'GLPermission'
  s.swift_version = '5.0'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  
  # Core
  s.subspec 'Core' do |ss| 
    ss.source_files = 'Sources/GLPermission.swift'
  end

  # 相机
  s.subspec 'Camera' do |ss|
    ss.source_files = 'Sources/GLCameraPermission.swift'
    ss.dependency 'GLPermission/Core'
  end

  # 麦克风
  s.subspec 'Microphone' do |ss|
    ss.source_files = 'Sources/GLMicrophonePermission.swift'
    ss.dependency 'GLPermission/Core'
  end

  # 相册
  s.subspec 'Photo' do |ss|
    ss.source_files = 'Sources/GLPhotoPermission.swift'
    ss.dependency 'GLPermission/Core'
  end

  # 联系人
  s.subspec 'Contacts' do |ss|
    ss.source_files = 'Sources/GLContactsPermission.swift'
    ss.dependency 'GLPermission/Core'
  end

  # 提醒
  s.subspec 'Reminder' do |ss|
    ss.source_files = 'Sources/GLReminderPermission.swift'
    ss.dependency 'GLPermission/Core'
  end

  # 日历
  s.subspec 'Calendar' do |ss|
    ss.source_files = 'Sources/GLCalendarPermission.swift'
    ss.dependency 'GLPermission/Core'
  end
end
