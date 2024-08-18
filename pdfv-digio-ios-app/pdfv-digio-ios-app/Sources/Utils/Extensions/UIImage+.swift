//
//  UIImage+.swift
//  pdfv-digio-ios-app
//
//  Created by Pedro Veloso on 18/08/24.
//

import UIKit

extension UIImage {
    static func load(from url: URL, completion: @escaping (_ image: UIImage?) -> Void ) {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let data = try? Data(contentsOf: url) else {
                completion(nil)
                return
            }

            DispatchQueue.main.async {
                completion(.init(data: data))
            }
        }
    }
}
