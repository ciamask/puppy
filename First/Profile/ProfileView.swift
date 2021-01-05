//
//  ProfileView.swift
//  First
//
//  Created by cia on 04/01/2021.
//

import UIKit

class ProfileView: UIView {
        
    var onFollowMe: ((String) -> Void)?
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "puppy")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 90
        return imageView
    }()
    
    let name: UILabel = {
        let label = UILabel()
        label.text = "Shreeya Maskey"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return label
    }()
    
    let details: UILabel = {
        let label = UILabel()
        label.text = "Hello, I'm Shreeya the great. I am awesome!!! i love puppies..YAYYYYYYYYYYY!!!!!!! COOOOL!!!!"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 5
        return label
    }()
    
    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FOLLOW ME", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.systemBlue
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
//        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleFollowMe), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(profileImage)
        profileImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(name)
        name.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20).isActive = true
        name.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(details)
        details.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20).isActive = true
        details.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        details.rightAnchor.constraint(equalTo: rightAnchor, constant: -20).isActive = true
        
        addSubview(followButton)
        followButton.topAnchor.constraint(equalTo: details.bottomAnchor,constant: 40).isActive = true
        followButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 40).isActive = true
        followButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -40).isActive = true
        followButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    @objc func handleFollowMe() {
        onFollowMe?("Shreeya")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
