//
//  ViewController.swift
//  ARCdemo
//
//  Created by Meenal Kewat on 4/2/19.
//  Copyright © 2019 Meenal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        runScenario()
    }
    
    func runScenario(){
       let user = User(name: "meenal")
        let iPhone = Phone(model: "iPhone Xs")
        user.add(phone: iPhone)
        let subcription = CarrierSubscription(name: "Rahul", countryCode: "143", number: "8880409789", user: user)
        iPhone.provision(carrierSubscription: subcription)
        print(subcription.completePhoneNumber())
    }
    
}

class User{
    let name: String
    
    private(set) var phones: [Phone] = []
    var subscription: [CarrierSubscription] = []
    
    func add(phone: Phone){
        phones.append(phone)
        phone.owner = self
    }
    
    init(name: String) {
        self.name = name
        print("User \(name) was initializer")
    }
    
    deinit {
        print("Deallocating user named: \(name)")
    }
}

class Phone{
    let model: String
    weak var owner: User?
    var carrierSubscription:CarrierSubscription?
    
    func provision(carrierSubscription: CarrierSubscription){
        self.carrierSubscription = carrierSubscription
    }
    
    func decommission(){
        carrierSubscription = nil
    }
    
    init(model: String) {
        self.model = model
        print("Phone \(model) was initialized")
    }
    
    deinit {
        print("Deallocating phone named: \(model)")
    }
}

class CarrierSubscription{
    let name: String
    let countryCode: String
    let number: String
    unowned let user: User
    
    lazy var completePhoneNumber: () -> String = { [unowned self] in
        self.countryCode + " " + self.number
    }
    
    init(name: String, countryCode: String, number: String, user: User) {
        self.name = name
        self.countryCode = countryCode
        self.number = number
        self.user = user
        user.subscription.append(self)
        print("CarrierSubscription \(name) is initialized")
    }
    
    deinit {
        print("Deallocating CarrierSubscription named: \(name)")
    }
}

