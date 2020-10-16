Pod::Spec.new do |s|
  s.name = 'SDWebImage3x'
  s.version = '3.8.3.2'
  s.ios.deployment_target = '7.0'
  s.tvos.deployment_target = '7.0'
  s.license = 'MIT'
  s.summary = 'Asynchronous image downloader with cache support with an UIImageView category.'
  s.homepage = 'https://github.com/SampleProjectsBooth/SDWebImage'
  s.author = { 'lincf0912' => 'dayflyking@163.com' }
  s.source = { :git => 'https://github.com/SampleProjectsBooth/SDWebImage.git', :branch => '3.x', :tag => s.version.to_s }

  s.description = 'This library provides a category for UIImageView with support for remote '      \
                  'images coming from the web. It provides an UIImageView category adding web '    \
                  'image and cache management to the Cocoa Touch framework, an asynchronous '      \
                  'image downloader, an asynchronous memory + disk image caching with automatic '  \
                  'cache expiration handling, a guarantee that the same URL won\'t be downloaded ' \
                  'several times, a guarantee that bogus URLs won\'t be retried again and again, ' \
                  'and performances!'

  s.requires_arc = true
  s.framework = 'ImageIO'
  
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'SDWebImage3x/{NS,SD,UI}*.{h,m}'
    core.exclude_files = 'SDWebImage3x/UIImage+WebP.{h,m}'
    core.tvos.exclude_files = 'SDWebImage3x/MKAnnotationView+WebCache.*'
  end

  s.subspec 'MapKit' do |mk|
    mk.ios.deployment_target = '7.0'
    mk.source_files = 'SDWebImage3x/MKAnnotationView+WebCache.*'
    mk.framework = 'MapKit'
    mk.dependency 'SDWebImage3x/Core'
  end

  s.subspec 'WebP' do |webp|
    webp.source_files = 'SDWebImage3x/UIImage+WebP.{h,m}'
    webp.xcconfig = {
      'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) SD_WEBP=1',
      'USER_HEADER_SEARCH_PATHS' => '$(inherited) $(SRCROOT)/libwebp/src'
    }
    webp.dependency 'SDWebImage3x/Core'
    webp.dependency 'libwebp'
  end
end
