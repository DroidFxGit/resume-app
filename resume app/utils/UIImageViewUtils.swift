//
//  UIImageViewUtils.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import UIKit

typealias completionBlock = (_ image: UIImage) -> Void

enum ImageViewStyle {
    case profile
}

// MARK: - UIImageView extension
extension UIImageView {
    
    // MARK: - Public methods
    func applyStyle(for style: ImageViewStyle) {
        switch style {
        case .profile:
            self.layer.cornerRadius = self.bounds.height / 2
            self.layer.borderWidth = 2.0
            self.layer.borderColor = UIColor.white.cgColor
            self.clipsToBounds = true
        }
    }
    
    func imageFromUrl(url: URL, placeholderImage: String? = nil) {
        let temporalImage = UIImage(named: placeholderImage ?? "")
        self.image = temporalImage
        downloadImageFromUrl(url: url) { image in
            self.image = image
        }
    }
    
    // MARK: - Private methods
    private func downloadImageFromUrl(url: URL, completion: @escaping completionBlock) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            
            DispatchQueue.main.async() {
                completion(image)
            }
            }.resume()
    }
}
