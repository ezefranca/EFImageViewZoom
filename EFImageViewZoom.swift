//
//  EFImageViewZoom.swift
//  EFImageViewZoom
//
//  Created by Ezequiel França on 27/05/17.
//  Copyright © 2017 Ezequiel França. All rights reserved.
//

import UIKit

public protocol EFImageViewZoomDelegate : class {
    func viewForZooming(zoomView: EFImageViewZoom) -> UIView?
}

public extension EFImageViewZoomDelegate {
    func viewForZooming(zoomView: EFImageViewZoom) -> UIView? {
        return zoomView.imageView
    }
}

private extension UIScrollView {
    func hideIndicators() {
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
}

@IBDesignable

public class EFImageViewZoom: UIScrollView {
    
    public weak var _delegate: EFImageViewZoomDelegate?
    fileprivate (set) public var imageView: UIImageView!
    fileprivate var cacheImage: UIImage!
    
    @IBInspectable public var image: UIImage! {
        didSet{
            guard let _imageView = self.imageView else {
                cacheImage = image
                return
            }
            _imageView.image = image
        }
    }
    
    @IBInspectable public var _minimumZoomScale: CGFloat = 1.0 {
        didSet{
            self.minimumZoomScale = _minimumZoomScale
        }
    }
    
    @IBInspectable public var _maximumZoomScale: CGFloat = 6.0 {
        didSet{
            self.maximumZoomScale = _maximumZoomScale
        }
    }
    
    public var contentModeImageView : UIView.ContentMode = .scaleAspectFit {
        didSet{
            self.contentMode = contentModeImageView
            self.sizeToFit()
            self.contentSize = self.imageView.intrinsicContentSize
            self.imageView.contentMode = contentModeImageView
        }
    }
    
    public var highlightedImage: UIImage? = nil {
        didSet {
            self.imageView.highlightedImage = highlightedImage
        }
    }
    
    public var isHighlighted: Bool = false {
        didSet {
            self.imageView.isHighlighted = isHighlighted
        }
    }
    
    public var animationImages: [UIImage]? = nil {
        didSet {
            self.imageView.animationImages = animationImages
        }
    }
    
    public var highlightedAnimationImages: [UIImage]? = nil {
        didSet{
            self.imageView.highlightedAnimationImages = highlightedAnimationImages
        }
    }
    
    public var animationDuration: TimeInterval = TimeInterval() {
        didSet{
            self.imageView.animationDuration = animationDuration
        }
    }
    
    public var animationRepeatCount: Int = 0 {
        didSet{
            self.imageView.animationRepeatCount = animationRepeatCount
        }
    }
    
    override public var tintColor: UIColor! {
        didSet{
            self.imageView.tintColor = tintColor
        }
    }
    
    public func startAnimating() {
        self.imageView.startAnimating()
    }
    
    public func stopAnimating() {
        self.imageView.stopAnimating()
    }
    
    public var isAnimating: Bool {
        get{
            return self.imageView.isAnimating
        }
    }
    
    public override func awakeFromNib() {
		self.imageView = UIImageView(frame: self.bounds)
		self.imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.imageView.contentMode = contentModeImageView
        self.contentMode = contentModeImageView
        self.imageView.clipsToBounds = true
        self.addSubview(imageView)
        if let _cache = cacheImage {
            self.imageView.image = _cache
        }
        self.hideIndicators()
        self.setupTap()
        self.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(screenOrientationChanged), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    override public func draw(_ rect: CGRect) {
        self.imageView.frame = rect
        super.draw(rect)
    }
    
    @objc private func screenOrientationChanged() {
        draw(self.frame)
    }
    
    private func setupTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        self.addGestureRecognizer(tap)
    }
    
    @objc func doubleTapped() {
        self.setZoomScale(1.0, animated: true)
    }
}

extension EFImageViewZoom: UIScrollViewDelegate {
    public func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self._delegate?.viewForZooming(zoomView: scrollView as! EFImageViewZoom)
    }
}


