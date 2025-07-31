//
//  QuestionView.swift
//  Quiz
//
//  Created by Eliardo Venancio on 22/07/25.
//

import UIKit

protocol QuestionViewDelegate: AnyObject {
    func questionView(_ view: QuestionView, didSelect answer: String)
}

class QuestionView: UIView {
    weak var delegate: QuestionViewDelegate?
    
    var currentQuestion: ModelQuestion?
    
    let titleLabel = UILabel()
    var buttons: [UIButton] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with question: ModelQuestion){
        currentQuestion = question
        titleLabel.text = question.title
        
        for (index, option) in question.options.enumerated() {
            if index < buttons.count {
                buttons[index].setTitle(option, for: .normal)
                buttons[index].isHidden = false
            }
        }
        
        for i in question.options.count..<buttons.count {
            buttons[i].isHidden = true
        }
    }
    
    func setupLayout(){
        titleLabel.font = .boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(titleLabel)
        
        buttons = (0..<4).map { _ in
            let btn = UIButton(type: .system)
            btn.setTitle("Opcao", for: .normal)
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.addTarget(self, action: #selector(optionTapped(_:)), for: .touchUpInside)
            btn.layer.cornerRadius = 8
            btn.layer.borderWidth = 1
            btn.layer.borderColor = UIColor.systemBlue.cgColor
            
            return btn
        }
        
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stack)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
    }
    
    @objc func optionTapped(_ sender: UIButton){
        guard let title = sender.titleLabel?.text else { return }
        delegate?.questionView(self, didSelect: title)
    }
}
