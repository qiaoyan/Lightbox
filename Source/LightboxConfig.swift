import UIKit
import AVKit
import AVFoundation
//import Imaginary
import IoniconsKit

@objc public class LightboxConfig:NSObject {
  /// Whether to show status bar while Lightbox is presented
  @objc public static var defaultFontSize = CGFloat(16)
  @objc public static var defaultTintColor = UIColor.white
  public static var hideStatusBar = true

  /// Provide a closure to handle selected video
  public static var handleVideo: (_ from: UIViewController, _ videoURL: URL) -> Void = { from, videoURL in
    let videoController = AVPlayerViewController()
    videoController.player = AVPlayer(url: videoURL)

    from.present(videoController, animated: true) {
      videoController.player?.play()
    }
  }

  /// How to load image onto UIImageView
  @objc public static var loadImage: (UIImageView, URL, ((UIImage?) -> Void)?) -> Void = { (imageView, imageURL, completion) in
    
    // Use Imaginary by default
//    imageView.setImage(url: imageURL, placeholder: nil, completion: { result in
//      switch result {
//      case .value(let image):
//        completion?(image)
//      case .error:
//        completion?(nil)
//      }
//    })
  }

  /// Indicator is used to show while image is being fetched
  @objc public static var makeLoadingIndicator: () -> UIView = {
    return LoadingIndicator()
  }

  /// Number of images to preload.
  ///
  /// 0 - Preload all images (default).
  public static var preload = 3

  public struct PageIndicator {
    public static var enabled = true
    public static var separatorColor = defaultTintColor
    
    public static var textAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.systemFont(ofSize: defaultFontSize-4),
      .foregroundColor: defaultTintColor,
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }

  public struct CloseButton {
    public static var enabled = true
    public static var size: CGSize?
//    public static var text = NSLocalizedString("Close", comment: "")
    public static var text = String.ionicon(with: .iosCloseOutline)
    public static var image: UIImage?
    public static var textAttributes: [NSAttributedString.Key: Any] = [
//      .font: UIFont.boldSystemFont(ofSize: defaultFontSize-2),
      .font: UIFont.ionicon(of: 36),
      .foregroundColor: defaultTintColor,
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }
  
  public struct DownloadButton {
    public static var enabled = true
    public static var size: CGSize?
//        public static var text = NSLocalizedString("Download", comment: "")

    public static var text = String.ionicon(with: .iosDownloadOutline)
    public static var image: UIImage?
    public static var textAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.ionicon(of: 36),
      .foregroundColor: defaultTintColor,
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }

  public struct DeleteButton {
    public static var enabled = false
    public static var size: CGSize?
    public static var text = NSLocalizedString("Delete", comment: "")
    public static var image: UIImage?

    public static var textAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.boldSystemFont(ofSize: defaultFontSize-2),
      .foregroundColor: defaultTintColor,
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }

  public struct InfoLabel {
    public static var enabled = true
    public static var textColor = UIColor.white
    public static var ellipsisText = NSLocalizedString("Show more", comment: "")
    public static var ellipsisColor = defaultTintColor
    
    public static var textAttributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.boldSystemFont(ofSize: defaultFontSize),
      .foregroundColor: UIColor(hex: "F2F2F2")
    ]
  }

  public struct Zoom {
    public static var minimumScale: CGFloat = 1.0
    public static var maximumScale: CGFloat = 4.0
  }
}
