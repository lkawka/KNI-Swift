//
//  ViewController.swift
//  JSONTest
//
//  Created by Rafał Małczyński on 17.04.2018.
//  Copyright © 2018 Rafał Małczyński. All rights reserved.
//

import UIKit

// Plug-in for safari
// https://github.com/rfletcher/safari-json-formatter/downloads
// Plug-in for chrome
// https://chrome.google.com/webstore/detail/json-formatter/bcjindcccaagfpapjjmafapmmgkkhgoa


// First course
// https://api.letsbuildthatapp.com/jsondecodable/course
// Two courses
// https://api.letsbuildthatapp.com/jsondecodable/courses
// More complex JSON
// https://api.letsbuildthatapp.com/jsondecodable/website_description


// First course

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
    let asd: String?
    
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//        asd = json["asd"] as? String ?? ""
//    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/website_description"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Manage errors and data stuff
            // Also, check for 200 OK status for response
            guard let data = data else { return }
            
            //let jsonAsString = String(data: data, encoding: .utf8)
            //print(jsonAsString)
            
            // Swift 2/3  and Objective-C approach
//            do {
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:Any] else { return }
//                print(json)
//
//                let course = Course(json: json)
//                print(course)
//
//            } catch let jsonError {
//                print(jsonError)
//            }
            
//            // Swift 4
//            do {
//
//                let courses = try JSONDecoder().decode([Course].self, from: data)
//                print(courses)  // When using Decodable, you don't really have to create an init for your model - protocol does the job :)
//
//            } catch let jsonError {
//                print(jsonError)
//            }
////
            // Website Description
            do {
                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
                print(websiteDescription)
            } catch let error {
                print(error)
            }

            }.resume()
        
        
    }
    
}
