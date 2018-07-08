import UIKit
import Imaginary

open class LightboxImage:NSObject {

  @objc open fileprivate(set) var image: UIImage?
  @objc open fileprivate(set) var imageURL: URL?
  @objc open fileprivate(set) var imageDownloadURL: URL?
  @objc open fileprivate(set) var videoURL: URL?
  @objc open var text: String
  
  // MARK: - Initialization
  
  @objc public init(image: UIImage, text: String = "", videoURL: URL? = nil) {
    self.image = image
    self.text = text
    self.videoURL = videoURL
  }
  
  @objc public init(imageURL: URL, text: String = "", videoURL: URL? = nil) {
    self.imageURL = imageURL
    self.text = text
    self.videoURL = videoURL
  }

  public init(imageURL: URL, imageDownloadURL: URL, text: String = "", videoURL: URL? = nil) {
    self.imageURL = imageURL
    self.imageDownloadURL = imageDownloadURL
    self.text = text
    self.videoURL = videoURL
  }
  
  open func addImageTo(_ imageView: UIImageView, completion: ((UIImage?) -> Void)? = nil) {
    if let image = image {
      imageView.image = image
      completion?(image)
    } else if let imageURL = imageURL {
      LightboxConfig.loadImage(imageView, imageURL, completion)
    }
  }
}
