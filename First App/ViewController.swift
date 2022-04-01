//
//  ViewController.swift
//  First App
//
//  Created by Роман Анпилов on 31.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bear_img"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun and games", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our store soon!", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let topImageContainerView: UIView = {
        let UIview = UIView()
        UIview.translatesAutoresizingMaskIntoConstraints = false
        return UIview
    }()
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.systemPink, for: .normal)
        return button
    }()
    
    let pageController: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .systemPink
        pc.pageIndicatorTintColor = .gray
        return pc
    }()
    
    func setupBottomControllers () {
        
        let bottomStackView = UIStackView(arrangedSubviews: [previousButton,pageController,nextButton])
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.distribution = .fillEqually
        view.addSubview(bottomStackView)
        
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        topImageContainerView.addSubview(bearImageView)
        view.addSubview(topImageContainerView)
        view.addSubview(descriptionTextView)
        setupBottomControllers()
        setupLayout()
    }
        
    
}

extension ViewController {
    private func setupLayout() {
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topImageContainerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            bearImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.5)
        ])
        
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        
    }
}
