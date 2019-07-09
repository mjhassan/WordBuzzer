//
//  Services.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation
import Alamofire

class Services {
    private let urlString = "https://gist.githubusercontent.com/DroidCoder/7ac6cdb4bf5e032f4c737aaafe659b33/raw/baa9fe0d586082d85db71f346e2b039c580c5804/words.json"
    
    func fetchData(_ callback: @escaping (Data?)->Void) {
        Alamofire.request(urlString).responseJSON { response in
            guard let data = response.data else {
                callback(nil)
                return
            }
            
            callback(data)
        }
    }
}
