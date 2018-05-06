//
//  BackgroundViewController.swift
//  Gorges
//
//  Created by Fujia Ren on 5/2/18.
//  Copyright © 2018 Fujia Ren. All rights reserved.
//

import UIKit

class BackgroundViewController: UIViewController {
    
    
    var firstButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstButton = UIButton(type: .system)
        firstButton.setTitle("Restaurants", for: .normal)
        firstButton.addTarget(self, action: #selector(firstButtonPressed), for: .touchUpInside)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.setTitleColor(.white , for: .normal)
        firstButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: 19)
        
        view.addSubview(firstButton)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Artwork")
        backgroundImage.contentMode =  UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        self.navigationController?.isNavigationBarHidden = true
        setupConstraints()
    }
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),
            firstButton.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 30)
            ])

    }
    
    @objc func firstButtonPressed(sender: UIButton)
    {
        let modVC = SearchViewController()
        navigationController?.pushViewController(modVC, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


