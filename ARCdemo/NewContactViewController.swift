//
//  NewContactViewController.swift
//  ARCdemo
//
//  Created by Meenal Kewat on 4/2/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit



protocol NewContactViewControllerDelegate: class {
    func newContactViewController(_ newContactViewController: NewContactViewController, created: Contact)
     func newContactViewControllerDidCancel(_ newContactViewController: NewContactViewController)}

class NewContactViewController: UIViewController,UITextFieldDelegate {
    
      weak var delegate: NewContactViewControllerDelegate?

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstName.delegate = self
        lastName.delegate = self
        phoneNumber.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstName.becomeFirstResponder()
    }
    
    private func closeKeyboard(){
        for view in view.subviews where view.isFirstResponder{
            view.resignFirstResponder()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func Cancle(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func save(_ sender: Any) {
        // Validation
        guard let firstName = self.firstName.text,
            let lastName = self.lastName.text,
            let countryCode = self.phoneNumber.text,
            let numberString = self.phoneNumber.text, firstName != "" || lastName != "" else {
                return
        }
        
        closeKeyboard()
        let contact = Contact(firstName: firstName, lastName: lastName)
        let number = Number(countryCode: countryCode, numberString: numberString, contact: contact)
        contact.number = number
        self.delegate?.newContactViewController(self, created: contact)
        
    }
}
