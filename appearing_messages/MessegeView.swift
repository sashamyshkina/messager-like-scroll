//
//  MessageView.swift
//  appearing_messages
//  Created by Sasha Myshkina on 18.06.2020.
//  Copyright © 2020 Sasha Myshkina. All rights reserved.
//
import UIKit

@IBDesignable
class MessageView: UIView {
    
    lazy var imageBackgroundView: UIImageView = {
        var i = UIImageView()
        i.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        i.layer.cornerRadius = 30
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var messageTextLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addCustomView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.addCustomView()
    }
    
    func addCustomView() {
        addSubview(imageBackgroundView)
        imageBackgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15).isActive = true
        imageBackgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: -15).isActive = true
        imageBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        imageBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        imageBackgroundView.addSubview(messageTextLabel)
        messageTextLabel.leftAnchor.constraint(equalTo: imageBackgroundView.leftAnchor, constant: 25).isActive = true
        messageTextLabel.rightAnchor.constraint(equalTo: imageBackgroundView.rightAnchor, constant: 0).isActive = true
        messageTextLabel.topAnchor.constraint(equalTo: imageBackgroundView.topAnchor, constant: 16).isActive = true
        messageTextLabel.bottomAnchor.constraint(equalTo: imageBackgroundView.bottomAnchor, constant: -25).isActive = true
    }
}
