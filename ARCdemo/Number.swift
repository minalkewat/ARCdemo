//
//  Number.swift
//  ARCdemo
//
//  Created by Meenal Kewat on 4/2/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import Foundation
import UIKit

class Number{
    var countryCode: String
    var numberString: String
    unowned var contact: Contact
    
    init?(countryCode: String, numberString: String, contact: Contact) {
        guard countryCode != "" || numberString != "" else {
            return nil
        }
        self.countryCode = countryCode
        self.numberString = numberString
        self.contact = contact
    }
}

extension Number: CustomStringConvertible{
    var description: String{
        return [countryCode,numberString].joined(separator: " ")
    }
}
