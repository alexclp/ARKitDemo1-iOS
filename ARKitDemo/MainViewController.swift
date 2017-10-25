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
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		if let image = ImageIO.loadImage(name: "webpage.png") {
			renderedPageImageView.image = image
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showWebControllerSegue" {
			let destination = segue.destination as! WebPageViewController
			if let text = pageAddressTextField.text {
				destination.addressToLoad = text
			}
		}
	}
}
