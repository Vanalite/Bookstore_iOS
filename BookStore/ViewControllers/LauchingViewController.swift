//
//  LauchingViewController.swift
//  BookStore
//
//  Created by eastagile on 11/4/14.
//  Copyright (c) 2014 eastagile. All rights reserved.
//

import UIKit

class LauchingViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var singinButton: UIButton!
    @IBOutlet weak var guestLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signinButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func guestLoginButtonPressed(sender: UIButton) {
        NetworkOperation.executeRequest("GET", params: nil, path: recentBooksPath, { (success, error, json) -> Void? in
            println(json)
        })
    }
}
