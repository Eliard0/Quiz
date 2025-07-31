//
//  ViewController.swift
//  Quiz
//
//  Created by Eliardo Venancio on 22/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Quiz UIKit"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        
        return label
    }()
    
    lazy var buttonInitialQuiz: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Iniciar Quiz", for: .normal)
        button.addTarget(self, action: #selector(buttonInitialQuizNavigate), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupLayout()
        setConstrants()
    }
    
    func setupLayout(){
        view.addSubview(titleLabel)
        view.addSubview(buttonInitialQuiz)
    }
    
    func setConstrants(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            buttonInitialQuiz.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            buttonInitialQuiz.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func buttonInitialQuizNavigate(){
        let quizVC = QuestionViewController()
        navigationController?.pushViewController(quizVC, animated: true)
    }
}
