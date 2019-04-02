//
//  ContactTableViewCell.swift
//  ARCdemo
//
//  Created by Meenal Kewat on 4/2/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    var contact: Contact? {
        didSet{
            name?.text = contact.map({String(describing: $0)}) ?? " "
        }
    }

    @IBOutlet weak var name: UILabel?

}
