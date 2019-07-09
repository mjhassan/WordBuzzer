//
//  UILabel+Resize.swift
//  WordBuzzer
//
//  Created by Jahid Hassan on 7/9/19.
//  Copyright © 2019 Jahid Hassan. All rights reserved.
//

import UIKit

extension UILabel {
    func expectedSize(in size: CGSize) -> CGSize {
        let expectedRect = NSString(string: self.text!).boundingRect(with: size,
                                                                    options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                    attributes: [NSAttributedString.Key.font: self.font] as [NSAttributedString.Key : Any],
                                                                    context: nil)
        
        return expectedRect.size
    }
}
