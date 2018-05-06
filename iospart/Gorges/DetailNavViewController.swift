//
//  DetailNavViewController.swift
//  FinalProject
//
//  Created by Sonu Kapoor on 4/26/18.
//  Copyright © 2018 Sonu Kapoor. All rights reserved.
//

import UIKit

class DetailNavViewController: UIViewController {
    
    var nameLabel: UILabel!
    var address1Label: UILabel!
    var address2Label: UILabel!
    var ratingLabel: UILabel!
    var phoneLabel: UILabel!
    var yelpButton: UIButton!
    var exitButton: UIButton!
    var priceLabel: UILabel!
    
    var price: String!
    var phone: String!
    var name: String!
    var address1: String!
    var address2: String!
    var rating: String!
    var previewLink: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 220/255, green: 179/255, blue: 255/255, alpha: 1.0)
        
        nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.textColor = .black
        nameLabel.font = .boldSystemFont(ofSize: 24)   //can also add UIFont before RHS
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        address1Label = UILabel()
        address1Label.text = address1
        address1Label.textColor = .black
        address1Label.font = .boldSystemFont(ofSize: 16)
        address1Label.translatesAutoresizingMaskIntoConstraints = false
        
        address2Label = UILabel()
        address2Label.text = address2
        address2Label.textColor = .black
        address2Label.font = .boldSystemFont(ofSize: 16)
        address2Label.translatesAutoresizingMaskIntoConstraints = false
        
        ratingLabel = UILabel()
        ratingLabel.text = "Rating: " + rating
        ratingLabel.textColor = .black
        ratingLabel.font = .boldSystemFont(ofSize: 16)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        phoneLabel = UILabel()
        phoneLabel.text = "Call: " + phone
        phoneLabel.textColor = .black
        phoneLabel.font = .boldSystemFont(ofSize: 16)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        
        priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.textColor = .black
        priceLabel.font = .boldSystemFont(ofSize: 16)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        yelpButton = UIButton()
        yelpButton.setTitle("Go to Yelp!", for: .normal)
        yelpButton.layer.cornerRadius = 10
        yelpButton.backgroundColor = UIColor(displayP3Red: 161/255, green: 87/255, blue: 225/255, alpha: 1.0)
        yelpButton.setTitleColor(.white, for: .normal)
        yelpButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        yelpButton.addTarget(self, action: #selector(yelpButtonPressed), for: .touchUpInside)
        yelpButton.translatesAutoresizingMaskIntoConstraints = false
        
        exitButton = UIButton()
        exitButton.setTitle("Back", for: .normal)
        exitButton.layer.cornerRadius = 10
        exitButton.backgroundColor = UIColor(displayP3Red: 161/255, green: 87/255, blue: 225/255, alpha: 1.0)
        exitButton.setTitleColor(.white, for: .normal)
        exitButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        exitButton.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(priceLabel)
        view.addSubview(nameLabel)
        view.addSubview(address1Label)
        view.addSubview(address2Label)
        view.addSubview(ratingLabel)
        view.addSubview(phoneLabel)
        view.addSubview(exitButton)
        view.addSubview(yelpButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            nameLabel.widthAnchor.constraint(equalTo: nameLabel.widthAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            priceLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            priceLabel.widthAnchor.constraint(equalTo: priceLabel.widthAnchor),
            priceLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            ratingLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            ratingLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            ratingLabel.widthAnchor.constraint(equalTo: ratingLabel.widthAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            address1Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            address1Label.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 20),
            address1Label.widthAnchor.constraint(equalTo: address1Label.widthAnchor),
            address1Label.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            address2Label.centerXAnchor.constraint(equalTo: address1Label.centerXAnchor),
            address2Label.topAnchor.constraint(equalTo: address1Label.bottomAnchor, constant: 1),
            address2Label.widthAnchor.constraint(equalTo: address2Label.widthAnchor),
            address2Label.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            phoneLabel.centerXAnchor.constraint(equalTo: address2Label.centerXAnchor),
            phoneLabel.topAnchor.constraint(equalTo: address2Label.bottomAnchor, constant: 5),
            phoneLabel.widthAnchor.constraint(equalTo: phoneLabel.widthAnchor),
            phoneLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            yelpButton.centerXAnchor.constraint(equalTo: address2Label.centerXAnchor),
            yelpButton.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            yelpButton.widthAnchor.constraint(equalToConstant: 120),
            yelpButton.heightAnchor.constraint(equalToConstant: 30)
            ])
        NSLayoutConstraint.activate([
            exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            exitButton.widthAnchor.constraint(equalToConstant: 64)
            ])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func exitButtonPressed(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func yelpButtonPressed(sender: UIButton) {
        if let preview = previewLink {
            UIApplication.shared.open(preview)
        }
    }
    
}

