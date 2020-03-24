//
//  AllGameOnboardingView.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 04.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//

import UIKit

protocol AllGameOnboardingModuleOutput: AnyObject {
    func nextActiv(with type: GameTipsScreenType)
}

final class AllGameOnboardingView: UIViewController {
    
    // MARK: - Properties
    
    weak var moduleOutput: AllGameOnboardingModuleOutput?
    var onbordingAllGame: GameTipsScreenType?
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = .clear
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.cornerRadius = 5
        nextButton.layer.borderWidth = 1
        
        return nextButton
    }()
    
    private let titleLable: UILabel = {
        let titleLable = UILabel()
        titleLable.textAlignment = .center
        titleLable.minimumScaleFactor = 0.4
        titleLable.adjustsFontSizeToFitWidth = true
        titleLable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLable.systemTextColor()
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLable
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .center
        descriptionLabel.minimumScaleFactor = 0.4
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.systemTextColor()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionLabel
    }()
    
    
    // MARK: - Locals
    
    private enum Local {
        static let toGameText = R.string.localizable.onboardingHelloButtonToGame()
        static let nextText = R.string.localizable.onboardingHelloButtonNext()
    }

    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawSelf()
    }
    
    private func drawSelf() {
        
        view.addSubview(titleLable)
        view.addSubview(descriptionLabel)
        view.addSubview(nextButton)
        
        let buttonText: String
        
        switch onbordingAllGame {
        case .spy(.time), .contact(.didNotGuess), .keeper(.finish):
            buttonText = Local.toGameText
        default:
            buttonText = Local.nextText
        }
        
        nextButton.setTitle(buttonText, for: .normal)
        
        nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                nextButton.setTitleColor(.white, for: .normal)
                nextButton.layer.borderColor = UIColor.red.cgColor
            } else {
                nextButton.setTitleColor(.black, for: .normal)
                nextButton.layer.borderColor = UIColor.systemBlue.cgColor
            }
            
        } else {
            nextButton.setTitleColor(.white, for: .normal)
            nextButton.layer.borderColor = UIColor.red.cgColor
        }
        
        switch onbordingAllGame {
            
        case .spy(let spy):
            titleLable.text = spy.titleSpy
            descriptionLabel.text = spy.descriptionSpy
        case .contact(let contact):
            titleLable.text = contact.titleContact
            descriptionLabel.text = contact.descriptionContact
        case .keeper(let keeper):
            titleLable.text = keeper.titleKeeper
            descriptionLabel.text = keeper.descriptionKeeper
        case .none:
            break
        }
        
        
        NSLayoutConstraint.activate([
            
            //MARK: - Lable
            
            titleLable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLable.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            descriptionLabel.leftAnchor .constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            descriptionLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15),
            
            
            //MARK: - Button
            
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            nextButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 15),
            nextButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -15),
        ])
        
    }
    
    @objc private func nextAction() {
        guard let type = onbordingAllGame else { return }
        moduleOutput?.nextActiv(with: type)
    }
            
}
