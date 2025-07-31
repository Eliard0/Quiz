//
//  QuestionViewController.swift
//  Quiz
//
//  Created by Eliardo Venancio on 22/07/25.
//

import UIKit

class QuestionViewController: UIViewController {
    let questionView = QuestionView()
    
    let questions: [ModelQuestion] = [
        ModelQuestion(title: "Qual linguagem usamos para programar em iphones", options: ["java", "swift", "php", "javaScript"], correctAnswer: "swift")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Pergunta"
        
        view.addSubview(questionView)
        questionView.translatesAutoresizingMaskIntoConstraints = false
        questionView.delegate = self
        
        NSLayoutConstraint.activate([
            questionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            questionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            questionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            questionView.heightAnchor.constraint(equalToConstant: 300)

        ])
        
        questionView.configure(with: questions[0])
        
    }
}


extension QuestionViewController: QuestionViewDelegate {
    func questionView(_ view: QuestionView, didSelect answer: String) {
        let correct = questions[0].correctAnswer == answer
        let title = correct ? "Correto" : "Errado"
        
        let alert = UIAlertController(title: title, message: "Voce escolheu \(answer)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        present(alert, animated: true)
        
    }
}
