//
//  view.swift
//  First
//
//  Created by cia on 04/03/2021.
//

import UIKit

class normalView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let login: UILabel = {
        let title = UILabel()
        title.text = "Login"
        return title
    }()
    
    let text: UILabel = {
        let title = UILabel()
        title.text = "Please sign in to continue"
        return title
    }()
    
    let textfield: UITextField = {
        let field = UITextField()
        field.placeholder = "    Email"
        field.textColor = .lightGray
        return field
    }()
    
    let passwordfield: UITextField = {
        let field = UITextField()
        field.placeholder = "    Password"
        field.textColor = .lightGray
        return field
    }()
    
    let loginbtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("LOGIN", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .selected)
        btn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return btn
    }()
    
    private func setupUI(){
        addSubview(login)
        login.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        login.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
        addSubview(text)
        login.topAnchor.constraint(equalTo: login.topAnchor, constant: 10).isActive = true
        login.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
        addSubview(textfield)
        login.topAnchor.constraint(equalTo: text.topAnchor, constant: 30).isActive = true
        login.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
        addSubview(passwordfield)
        login.topAnchor.constraint(equalTo: textfield.topAnchor, constant: 10).isActive = true
        login.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
        addSubview(loginbtn)
        login.topAnchor.constraint(equalTo: passwordfield.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        login.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        
    }
    
}
