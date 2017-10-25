//
//  MainViewController.swift
//  ARKitDemo
//
//  Created by Alexandru Clapa on 25/10/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import UIKit
import WebKit

class MainViewController: UIViewController {
	@IBOutlet weak var pageAddressTextField: UITextField!
	@IBOutlet weak var renderedPageImageView: UIImageView!
	@IBOutlet weak var webPageView: UIView!
	
    weak var webView: WKWebView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		let placeholderImage = UIImage(named: "placeholder.jpeg")
		renderedPageImageView.image = placeholderImage
    }
	
	func loadImage() -> UIImage? {
		let nsDocumentDirectory = FileManager.SearchPathDirectory.documentDirectory
		let nsUserDomainMask = FileManager.SearchPathDomainMask.userDomainMask
		let paths = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true)
		if let dirPath = paths.first {
			let imageURL = URL(fileURLWithPath: dirPath).appendingPathComponent("webpage.png")
			print(imageURL)
			let image = UIImage(contentsOfFile: imageURL.path)
			if let image = image {
				return image
			} else {
				return nil
			}
		}
		return nil
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if let image = loadImage() {
			renderedPageImageView.image = image
		}
	}
}
