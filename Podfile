
platform :ios, '12.0'


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
#            config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
#            config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
#            config.build_settings['CODE_SIGNING_ALLOWED'] = "NO"
        end
    end
end


target 'Whisper' do
  use_frameworks!
  inhibit_all_warnings!

  pod 'RxCocoa'
  pod 'Moya/RxSwift'
  pod 'IQKeyboardManagerSwift'
  pod 'SnapKit'
  pod 'Kingfisher'
  pod 'HandyJSON'
  pod 'SwifterSwift'
  pod 'RRRTipsHUD'
  pod 'FDFullscreenPopGesture'
  pod 'MJRefresh'
  pod 'SAMKeychain'

  pod 'SendBirdUIKit'

end
