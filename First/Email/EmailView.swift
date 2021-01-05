//
//  EmailView.swift
//  First
//
//  Created by cia on 05/01/2021.
//

import UIKit

class EmailView: UIView {
    
    var emailVC: EmailVC?
    
    let emailTextbox: UITextField = {
        let emailBox = UITextField()
        emailBox.translatesAutoresizingMaskIntoConstraints = false
        emailBox.placeholder = "Enter Email"
        emailBox.textAlignment = .justified
        emailBox.font = UIFont.systemFont(ofSize: 22)
        emailBox.borderStyle = .roundedRect
        emailBox.addTarget(self, action: #selector(handleEmailChanges), for: .editingChanged)
        return emailBox
    }()
    
    let usernameBox: UITextField = {
        let userBox = UITextField()
        userBox.translatesAutoresizingMaskIntoConstraints = false
        userBox.placeholder = "Enter Username"
        userBox.textAlignment = .justified
        userBox.font = UIFont.systemFont(ofSize: 22)
        userBox.borderStyle = .roundedRect
        userBox.clipsToBounds = true
        userBox.addTarget(self, action: #selector(handleUsernameChanges), for: .editingChanged)
        return userBox
    }()
    
    let passwordBox: UITextField = {
        let passBox = UITextField()
        passBox.translatesAutoresizingMaskIntoConstraints = false
        passBox.textAlignment = .justified
        passBox.borderStyle = .roundedRect
        passBox.placeholder = "PASSWORD"
        passBox.font = UIFont.systemFont(ofSize: 22)
        passBox.addTarget(self, action: #selector(handlepasswordChanges), for: .editingChanged)
        return passBox
    }()
    
    let okButton: UIButton = {
        let ok = UIButton(type: .system)
        ok.translatesAutoresizingMaskIntoConstraints = false
        ok.setTitle("OK", for: .normal)
        ok.setTitleColor(.white, for: .normal)
        ok.heightAnchor.constraint(equalToConstant: 44).isActive = true
        ok.backgroundColor = .systemBlue
        ok.addTarget(self, action: #selector(back), for: .touchUpInside)
        return ok
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        checkValidity()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isUsernameValid = false
    var isEmailValid = false
    var isPasswordValid = false
    
    // email
    
    // password
    
    @objc func handlepasswordChanges(_ textField: UITextField) {
        let password = textField.text ?? ""
        isPasswordValid = checkPassword(with: password)
        checkValidity()
    }
    
    private func checkPassword(with text: String) -> Bool{
        let passwordValue = text
        
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let capitalStringCheck = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalResult = capitalStringCheck.evaluate(with: passwordValue)
        
        let smallLetterRegEx  = ".*[a-z]+.*"
        let smallStringCheck = NSPredicate(format:"SELF MATCHES %@", smallLetterRegEx)
        let smallResult = smallStringCheck.evaluate(with: passwordValue)
        
        let numberRegEx  = ".*[0-9]+.*"
        let numberCheck = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberResult = numberCheck.evaluate(with: passwordValue)
        
        let specialChracterRegEx  = ".*[@#!$%^*]+.*"
        let specialChracterCheck = NSPredicate(format:"SELF MATCHES %@", specialChracterRegEx)
        let specialChracterResult = specialChracterCheck.evaluate(with: passwordValue)
        
        return capitalResult && smallResult && numberResult && specialChracterResult
    }

    @objc func handleEmailChanges(_ textField: UITextField) {
        let email = textField.text ?? ""
        isEmailValid = checkEmail(with: email)
        checkValidity()
    }
    
    private func checkEmail(with text: String) -> Bool {
        let emailregex = #"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,64}"#
        let emailpredicate = NSPredicate(format: "SELF MATCHES %@", emailregex)
        return emailpredicate.evaluate(with: text)
    }
    
    @objc func handleUsernameChanges(_ textField: UITextField) {
        let username = textField.text ?? ""
        isUsernameValid = checkUsername(with: username)
        checkValidity()
    }
    
    private func checkUsername(with text: String) -> Bool {
        return (text.count >= 10)
    }
    
    private func checkValidity() {
        if isPasswordValid == true && isEmailValid == true && isUsernameValid == true {
            okButton.isEnabled = true
            okButton.backgroundColor = UIColor.systemBlue
        } else {
            okButton.isEnabled = false
            okButton.backgroundColor = .black
        }
         
    }
    
    @objc func back() {
//        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        addSubview(usernameBox)
        usernameBox.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        usernameBox.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(emailTextbox)
        emailTextbox.topAnchor.constraint(equalTo: usernameBox.bottomAnchor, constant: 20).isActive = true
        emailTextbox.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        
        addSubview(passwordBox)
        passwordBox.topAnchor.constraint(equalTo: emailTextbox.bottomAnchor, constant: 20).isActive = true
        passwordBox.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(okButton)
        okButton.topAnchor.constraint(equalTo: passwordBox.bottomAnchor, constant: 20).isActive = true
        okButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        okButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
    }
}
