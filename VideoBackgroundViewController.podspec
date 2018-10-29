Pod::Spec.new do |s|

  s.name         = "VideoBackgroundViewController"
  s.version      = "0.0.5"
  s.summary      = "A View Controller that shows a video in the background, like Spotify"
  s.description  = <<-DESC
    A View Controller that shows a video in the background, like Spotify, written in Swift
  DESC

  s.homepage     = "https://github.com/PiXeL16/VideoBackgroundViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Chris Jimenez" => "cjimenez16@gmail.com" }
  s.social_media_url   = "http://twitter.com/chrisjimeneznat"

  s.platform     = :ios, "9.0"

  s.source       = { :git => "https://github.com/PiXeL16/VideoBackgroundViewController.git", :tag => s.version }
  s.source_files  = "VideoBackgroundViewController/", "VideoBackgroundViewController/**/*.{h,m,swift}"

  s.requires_arc = true

end
