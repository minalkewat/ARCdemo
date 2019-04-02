//
//  ContactViewController.swift
//  ARCdemo
//
//  Created by Meenal Kewat on 4/2/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var database = Database.sharedInstance
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactTableViewCell
        cell.contact = database.contacts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            database.contacts.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
        
        guard let identifire = segue.identifier else {
            return
        }
        
        switch identifire {
        case "detailSegue":
            if let contactTableViewCell = sender as? ContactTableViewCell,
                let detailViewController = segue.destination as? DetailViewController {
                detailViewController.contact = contactTableViewCell.contact
            }
        case "addSegue":
            print("working")
            if let navcon = segue.destination as? UINavigationController,
                let newContactViewController = navcon.topViewController as? NewContactViewController {
                newContactViewController.delegate = self
            }
            
            
        default:
            break
        }
     }
}
extension ContactViewController:NewContactViewControllerDelegate{
    func newContactViewControllerDidCancel(_ newContactViewController: NewContactViewController) {
        newContactViewController.dismiss(animated: true, completion: nil)
    }
    
   func newContactViewController(_ newContactViewController: NewContactViewController, created contact: Contact) {
        let insertIndexPath = IndexPath(row: 0, section: 0)
        
        newContactViewController.dismiss(animated: true) {
            self.tableView.scrollToRow(at: insertIndexPath, at: .top, animated: true)
            self.database.contacts.insert(contact, at: insertIndexPath.row)
            self.tableView.insertRows(at: [insertIndexPath], with: .automatic)
        }
    }
    
}
