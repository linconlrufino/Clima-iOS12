platform :ios, '9.0'

target 'Clima' do
    use_frameworks!

    # Pods for Clima
    
      pod 'SwiftyJSON'
      pod 'Alamofire'
      pod 'SVProgressHUD'
    
end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
