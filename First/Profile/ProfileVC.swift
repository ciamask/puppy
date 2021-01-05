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
        baseView.profileVC = self
//        navigationController?.isNavigationBarHidden = true
    }
    
    func gotoEmail() {
        let vc = EmailVC()
        navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
    }
    
    override func loadView() {
        view = baseView
    }
    
}

