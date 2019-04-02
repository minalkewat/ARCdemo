//
//  DetailViewController.swift
//  ARCdemo
//
//  Created by Meenal Kewat on 4/2/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lastname: UILabel!
    @IBOutlet weak var number: UILabel!
    
    var contact:Contact!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        name.text = contact.firstName
        lastname.text = contact.lastName
        number.text = contact.number.map({ String(describing: $0) }) ?? ""
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
