//
//  Extensions.swift
//  ARKitDemo
//
//  Created by Alexandru Clapa on 25/10/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import UIKit

extension UIImage {
	convenience init(view: UIView) {
		UIGraphicsBeginImageContext(view.frame.size)
		view.layer.render(in:UIGraphicsGetCurrentContext()!)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		self.init(cgImage: image!.cgImage!)
	}
}
