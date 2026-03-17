//
//  ViewController.swift
//  secondlesson
//
//  Created by меньков александр on 16.03.2026.
//

import UIKit

class MainViewController: UIViewController {
    
    var name: ((String) -> Void)?
    
    private let goToButton: UIButton = { // замыкание для инициализации
        let button = UIButton(type: .system)
        button.setTitle("Enter your name", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(goToSecondScreen), for: .touchUpInside)
        
        return button
    }()
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Main Page"

        view.addSubview(goToButton)
        view.addSubview(greetingLabel)
    
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            goToButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            goToButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            goToButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
        
        ])
    }
    @objc private func goToSecondScreen() {
        let secondVC = SecondViewController()
        
        secondVC.onNameSubmitted = { [weak self] name in
            self?.greetingLabel.text = "Hello, \(name)!"
            self?.greetingLabel.textColor = .systemGreen
        }
        
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
}

 
