# EFImageViewZoom
A very simple IBDesignable ImageView with zoom

## Installation
Just drag `EFImageViewZoom.swift` to your project.

## How to use
Just set an UIView in your Storyboard to `EFImageViewZoom` type.
![intructions](https://media.giphy.com/media/vEBdiijlgK8BW/giphy.gif)

```swift
import UIKit

class ViewController: UIViewController, EFImageViewZoomDelegate {

    @IBOutlet weak var imageViewZoom: EFImageViewZoom!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageViewZoom._delegate = self
        self.imageViewZoom.image = UIImage(named: "14bis.png")
        self.imageViewZoom.contentMode = .left
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```

## Screenshots
![Demo](https://media.giphy.com/media/23yu4cpEF0Dzq/giphy.gif)

## License
**EFImageViewZoom** is released under the MIT license. See the LICENSE file for more info.
