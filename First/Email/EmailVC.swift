//
//  EmailVC.swift
//  First
//
//  Created by cia on 04/01/2021.
//

import UIKit

class EmailVC: UIViewController {
    
    let emailView = EmailView()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        emailView.emailVC = self   
        title = "Form"
    }
    
    override func loadView() {
        view = emailView
    }
    
    deinit {
        print("Email VC is out of memory...")
    }
    
}
