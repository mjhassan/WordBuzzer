//
//  word.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import Foundation

struct Word: Equatable {
    let english: String
    let spanish: String
    
    static func == (lhs: Word, rhs: Word) -> Bool {
        return lhs.english == rhs.english
    }
}

extension Word: Codable {
    enum CodingKeys: String, CodingKey {
        case english = "text_eng"
        case spanish = "text_spa"
    }
}
