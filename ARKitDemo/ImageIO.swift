//
//  ImageIO.swift
//  ARKitDemo
//
//  Created by Alexandru Clapa on 25/10/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import Foundation
import UIKit

class ImageIO {
	class func loadImage(name: String) -> UIImage? {
		let imageURL = getDocumentsDirectory().appendingPathComponent(name)
		print(imageURL)
		let image = UIImage(contentsOfFile: imageURL.path)
		if let image = image {
			return image
		}
		return nil
	}
	
	private class func getDocumentsDirectory() -> URL {
		let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return paths[0]
	}
	
	class func saveImage(image: UIImage, name: String) {
		if let data = UIImagePNGRepresentation(image) {
			let filename = getDocumentsDirectory().appendingPathComponent(name)
			try? data.write(to: filename)
		}
	}
}
