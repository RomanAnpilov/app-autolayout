//
//  PageCell.swift
//  First App
//
//  Created by Роман Анпилов on 31.03.2022.
//

import UIKit

class PageCell: UICollectionViewCell {
    var page: Page? {
        didSet {
            guard let unwrapPage = page else {return}
            
            bearImageView.image = UIImage(named: unwrapPage.imageName)
            let attributedText = NSMutableAttributedString(string: unwrapPage.headerText, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
            attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our store soon!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "koala"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let topImageContainerView: UIView = {
        let UIview = UIView()
        UIview.translatesAutoresizingMaskIntoConstraints = false
        return UIview
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
    
        textView.textAlignment = .center
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        topImageContainerView.addSubview(bearImageView)
        addSubview(topImageContainerView)
        addSubview(descriptionTextView)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PageCell {
    func setLayout() {
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.rightAnchor.constraint(equalTo: rightAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            bearImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24),
            descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
