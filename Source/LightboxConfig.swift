import UIKit
import Hue
import AVKit
import AVFoundation
import Imaginary
import IoniconsKit
import UIKit


public class LightboxConfig:NSObject {
    
  /// Whether to show status bar while Lightbox is presented
  @objc public static var defaultFontSize = CGFloat(16)
  public static var hideStatusBar = true
  public static var hideControlsInZoom = true
  public static var toggleControlsOnTouchWhenZoomed = false
  
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
    imageView.setImage(url: imageURL, placeholder: nil, completion: { result in
      switch result {
      case .value(let image):
        completion?(image)
      case .error:
        completion?(nil)
      }
    })
  }
  
  /// Indicator is used to show while image is being fetched
  @objc public static var makeLoadingIndicator: () -> UIView = {
    return LoadingIndicator()
  }
  
  public struct PageIndicator {
    public static var enabled = true
    public static var separatorColor = UIColor(hex: "757A4E")
    
    public static var textAttributes: [NSAttributedStringKey: Any] = [
      .font: UIFont.boldSystemFont(ofSize: defaultFontSize-2),
      .foregroundColor: UIColor(hex: "757A4E"),
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }()
    ]
  }
  
  public struct CloseButton {
    public static var enabled = false
    public static var size: CGSize?
    public static var text = NSLocalizedString("Close", comment: "")
    public static var image: UIImage?
    public static var position = HeaderViewChildPosition.start
    
    public static var textAttributes: [NSAttributedStringKey: Any] = [
      .font: UIFont.boldSystemFont(ofSize: defaultFontSize-2),
      .foregroundColor: UIColor(hex: "757A4E"),
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
    
    public static var text = String.ionicon(with: .iosDownloadOutline)
    public static var image: UIImage?
    public static var position = HeaderViewChildPosition.end
    
    public static var textAttributes: [NSAttributedStringKey: Any] = [
      .font: UIFont.ionicon(of: 36),
      .foregroundColor: UIColor(hex: "757A4E"),
//      .shadow:{
//        let attributedStringShadow = NSShadow()
//        attributedStringShadow.shadowOffset = CGSize(width: 0, height: 1)
//        attributedStringShadow.shadowBlurRadius = 1.0
//        attributedStringShadow.shadowColor = UIColor(hex: "4D4B50")
//        return attributedStringShadow
//      }(),
      .paragraphStyle: {
        var style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
      }(
        )
    ]
  }
  
  public struct DeleteButton {
    public static var enabled = false
    public static var size: CGSize?
    public static var text = NSLocalizedString("Delete", comment: "")
    public static var image: UIImage?
    public static var position = HeaderViewChildPosition.center
    
    public static var textAttributes: [NSAttributedStringKey: Any] = [
      .font: UIFont.boldSystemFont(ofSize: defaultFontSize-2),
      .foregroundColor: UIColor(hex: "FA2F5B"),
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
    public static var ellipsisColor = UIColor(hex: "757A4E")
    
    public static var textAttributes: [NSAttributedStringKey: Any] = [
      .font: UIFont.boldSystemFont(ofSize: defaultFontSize),
      .foregroundColor: UIColor(hex: "DBDBDB")
    ]
  }
  
  public struct Zoom {
    public static var minimumScale: CGFloat = 1.0
    public static var maximumScale: CGFloat = 3.0
  }
  
  public struct Header {
    public static var displayGradient = true
    public static var topPadding: CGFloat = -2
    public static var gradientColors = [UIColor(hex: "040404"), UIColor(hex: "040404").alpha(0.02)]
  }
  
  public struct Footer {
    public static var bottomPadding: CGFloat = 0
    public static var gradientColors = [UIColor(hex: "040404").alpha(0.1), UIColor(hex: "040404")]
  }
}

