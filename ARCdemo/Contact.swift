//
//  Contact.swift
//  ARCdemo
//
//  Created by Meenal Kewat on 4/2/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit

class Contact{
    var firstName: String
    var lastName: String
    var avatar : UIImage
    var number:Number?
    
    init(firstName: String, lastName: String, avatar: String = "student") {
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = UIImage(named: avatar) ?? UIImage(named: "student")!
    }
}

extension Contact: CustomStringConvertible {
    var description: String {
        return [firstName, lastName].joined(separator: " ")
    }
}

    
