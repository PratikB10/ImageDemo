//
//  NetworkHelper.swift
//  ImageDemo
//
//  Created by User on 06/03/20.
//  Copyright © 2020 User. All rights reserved.

import UIKit

private var baseUrl = "https://picsum.photos/list"

extension UIViewController {
    
    func getImageData(completion: @escaping([PhotoModel]?) -> Void) {
        if let url = URL(string: baseUrl) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                if let data = data {
                    do {
                        let json = try JSONDecoder().decode([PhotoModel].self, from: data)
                        completion(json)
                        return
                    }
                    catch let error {
                        print("JSON Parse Error: \(error.localizedDescription)")
                        completion(nil)
                        return
                    }
                }
            }.resume()
        }
    }
}

struct PhotoModel: Codable {
    var id: Int
    var author: String
}
