//
//  ViewController.swift
//  First
//
//  Created by cia on 04/01/2021.
//

import UIKit

class ProfileVC: UIViewController {

    let baseView = ProfileView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "GIRL"
        observeEvents()
//        navigationController?.isNavigationBarHidden = true
         }
    
    private func observeEvents() {
        baseView.onFollowMe = { [weak self] (name) in
            guard let self = self else { return }
            print("Name:", name)
//            print("Name: \(name)")
            self.gotoEmail()
        }
    }
    
    func gotoEmail() {
        let vc = EmailVC()
        navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
    }
    
    override func loadView() {
        view = baseView
    }
    
    deinit {
        print("Profile VC is out of memory...")
    }
    
}

