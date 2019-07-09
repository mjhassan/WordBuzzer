//
//  word.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation

struct word {
    let english: String
    let spanish: String
}

extension word: Codable {
    enum CodingKeys: String, CodingKey {
        case english = "text_eng"
        case spanish = "text_spa"
    }
}
