Pod::Spec.new do |s|
  s.name             = "QBImagePickerController"
  s.version          = "3.4.3-custom"
  s.summary          = "A clone of UIImagePickerController with multiple selection support."
  s.homepage         = "https://github.com/Neral/QBImagePicker"
  s.license          = "MIT"
  s.author           = { "Neral" => "nerijus.lasauskas@gmail.com" }
  s.source           = { :git => "https://github.com/Neral/QBImagePicker.git", :tag => s.version.to_s }
  s.social_media_url = "https://twitter.com/questbeat"
  s.source_files     = "QBImagePicker/*.{h,m}"
  s.exclude_files    = "QBImagePicker/QBImagePicker.h"
  s.resource_bundles = { "QBImagePicker" => "QBImagePicker/*.{lproj,storyboard}" }
  s.platform         = :ios, "8.0"
  s.requires_arc     = true
  s.frameworks       = "Photos"
end
