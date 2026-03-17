//
//  SecondViewController.swift
//  secondlesson
//
//  Created by меньков александр on 17.03.2026.
//

import UIKit
class SecondViewController: UIViewController {
    
    var onNameSubmitted: ((String) -> Void)?
    
    private let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter your name"
        tf.borderStyle = .roundedRect
        tf.returnKeyType = .done
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    private let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("OK", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        
        button.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "Name Page"
        
        setupKeyboardHandling()
        view.addSubview(nameTextField)
        view.addSubview(submitButton)
        
        NSLayoutConstraint.activate([
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120)
            
        ])
        nameTextField.delegate = self
    }
    
    private func setupKeyboardHandling() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func submitButtonTapped() {
        guard let name = nameTextField.text, !name.isEmpty else {
            
            let alert = UIAlertController(
                title: "Error",
                message: "Please, enter name",
                preferredStyle: .alert
            )
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated:true)
            return
        }
        onNameSubmitted?(name)
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate
extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        submitButtonTapped()
        return true
    }
}
