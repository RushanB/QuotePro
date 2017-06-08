//
//  FetchPhoto.swift
//  QuotePro
//
//  Created by Rushan on 2017-06-07.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

import Foundation
import UIKit

class FetchPhoto {
    
     func fetchPhoto(completionHandler: @escaping (Photo) -> Void) {
        
        let url = URL(string: "http://lorempixel.com/300/300")
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask = session.dataTask(with: request){
            
            (data: Data?, response: URLResponse?, error: Error?) in
            
            guard let data = data else{
                print("no data returned from \(String(describing: error?.localizedDescription))")
                return
                
            }
            guard let realResponse = response as? HTTPURLResponse, realResponse.statusCode == 200 else{
                print("Not a 200 response")
                return
            }
            //set photo data to newPhoto
            let newPhoto = Photo()
            newPhoto.photo = UIImage(data: data)!
            
            completionHandler(newPhoto)
        }
        
        dataTask.resume()
    }
}
//            var image: UIImage?
//            
//            defer {
//                completion(image)
//            }
//            
//            if let error = error {
//                print(#line, error.localizedDescription)
//                return
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                print(#line, "response is nil or status code not 200")
//                return
//            }
//            
//            guard let data = data else {
//                print(#line, "no data")
//                return
//            }
//            print(#line, data)
//            image = UIImage(data: data)
//            }.resume()



