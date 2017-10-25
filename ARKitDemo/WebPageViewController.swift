//
//  WebPageViewController.swift
//  ARKitDemo
//
//  Created by Alexandru Clapa on 25/10/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import UIKit
import WebKit

class WebPageViewController: UIViewController {
	var webView: WKWebView!
	var addressToLoad = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		let webConfiguration = WKWebViewConfiguration()
		webView = WKWebView(frame: view.frame, configuration: webConfiguration)
		webView.navigationDelegate = self
		var myRequest = URLRequest(url: URL.init(string: "https://apple.com")!)
		if addressToLoad != "" {
			myRequest = URLRequest(url: URL.init(string: addressToLoad)!)
		}
		webView.load(myRequest)
		
		view = webView
    }
	
	@objc func captureImage() {
		let image = UIImage(view: view)
		print(image)
		ImageIO.saveImage(image: image, name: "webpage.png")
		_ = self.navigationController?.popViewController(animated: true)
	}
}

extension WebPageViewController: WKNavigationDelegate {
	func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
		print("Did finish!")
		print(webView.isLoading)
		
		let button = UIBarButtonItem.init(title: "Capture", style: .plain, target: self, action: #selector(self.captureImage))
		self.navigationItem.rightBarButtonItem = button
	}
}
