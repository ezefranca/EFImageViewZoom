//
//  ViewController.swift
//  EFImageViewZoom
//
//  Created by Ezequiel França on 27/05/17.
//  Copyright © 2017 Ezequiel França. All rights reserved.
//

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

