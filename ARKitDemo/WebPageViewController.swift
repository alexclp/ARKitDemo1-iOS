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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		let webConfiguration = WKWebViewConfiguration()
		webView = WKWebView(frame: view.frame, configuration: webConfiguration)
		webView.navigationDelegate = self
		let myRequest = URLRequest(url: URL.init(string: "https://apple.com")!)
		webView.load(myRequest)
		
		view = webView
    }

	private func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
	
	func saveImage(image: UIImage) {
		if let data = UIImagePNGRepresentation(image) {
			let filename = getDocumentsDirectory().appendingPathComponent("webpage.png")
			try? data.write(to: filename)
		}
	}
	
	@objc func captureImage() {
		let image = UIImage(view: view)
		print(image)
		saveImage(image: image)
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
