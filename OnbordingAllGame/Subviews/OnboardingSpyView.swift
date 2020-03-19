//
//  OnboardingContactView.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 04.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//

import UIKit

protocol OnboardingContactModuleOutput {
    func nexxtActiv(from type: GAMETYPE)
}

class OnboardingContactView: UIViewController {
    
    // MARK: - Properties
    
    var moduleOutput: OnboardingContactModuleOutput?
    var onbordingAllGame: GAMETYPE?
    
    private lazy var nextButton: UIButton = {
        let nextButton = UIButton()
        nextButton.backgroundColor = .clear
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.layer.cornerRadius = 5
        nextButton.layer.borderWidth = 1
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.layer.borderColor = UIColor.red.cgColor
        
        return nextButton
    }()
    
    private let titleLable: UILabel = {
        let titleLable = UILabel()
        titleLable.textAlignment = .center
        titleLable.minimumScaleFactor = 0.4
        titleLable.adjustsFontSizeToFitWidth = true
        titleLable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLable.textColor = .white
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLable
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .center
        descriptionLabel.minimumScaleFactor = 0.4
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return descriptionLabel
    }()
    
    
    // MARK: - Locals
    
    private enum Local {
        static let toGameText = R.string.localizable.onboardingHelloButtonToGame()
        static let nextText = R.string.localizable.onboardingHelloButtonNext()
        static let helloTitleText = R.string.localizable.onboardingHelloTitle()
        static let helloInSpy = R.string.localizable.onboardingAllGameHelloSpy()
        static let takePhoneTitle = R.string.localizable.onboardingAllGameTakePhoneSpyTitle()
        static let takePhoneDescription = R.string.localizable.onboardingAllGameTakePhoneSpyDescription()
        static let locationTitle = R.string.localizable.onboardingAllGameLocationSpyTitle()
        static let locationDescription = R.string.localizable.onboardingAllGameLocationSpyDescription()
        static let listenTitle = R.string.localizable.onboardingAllGameListenSpyTitle()
        static let listenDescription = R.string.localizable.onboardingAllGameListenSpyDescription()
        static let guessTitle = R.string.localizable.onboardingAllGameGuessSpyTitle()
        static let guessDescription = R.string.localizable.onboardingAllGameGuessSpyDescription()
        static let spyTitle = R.string.localizable.onboardingAllGameSpySpyTitle()
        static let spyDescription = R.string.localizable.onboardingAllGameSpySpyDescription()
        static let timeTitle = R.string.localizable.onboardingAllGameTimeSpyTitle()
        static let timeDescription = R.string.localizable.onboardingAllGameTimeSpyDescription()
        static let helloContact = R.string.localizable.onboardingAllGameHelloContactDescription()
        static let adminContactTitle = R.string.localizable.onboardingAllGameAdminContactTitle()
        static let adminContactDescription = R.string.localizable.onboardingAllGameAdminContactDescription()
        static let otherGamerContactTitle = R.string.localizable.onboardingAllGameOtherGamerContactTitle()
        static let otherGamerContactDescription = R.string.localizable.onboardingAllGameOtherGamerContactDescription()
        static let guessContactTitle = R.string.localizable.onboardingAllGameGuessContactTitle()
        static let guessContactDescription = R.string.localizable.onboardingAllGameGuessContactDescription()
        static let admin2LetterContactTitle = R.string.localizable.onboardingAllGameAdmin2LetterContactTitle()
        static let admin2LetterContactDescription = R.string.localizable.onboardingAllGameAdmin2LetterContactDescription()
        static let didNotGuessContactTitle = R.string.localizable.onboardingAllGameDidNotGuessContactTitle()
        static let didNotGuessContactDescription = R.string.localizable.onboardingAllGameDidNotGuessContactDescription()
        static let helloKeeperDescription = R.string.localizable.onboardingAllGameHelloKeeperDescription()
        static let guessKeeperTitle = R.string.localizable.onboardingAllGameGuessKeeperTitle()
        static let guessKeeperDescription = R.string.localizable.onboardingAllGameGuessKeeperDescription()
        static let gamerKeeperTitle = R.string.localizable.onboardingAllGameGamerKeeperTitle()
        static let gamerKeeperDescription = R.string.localizable.onboardingAllGameGamerKeeperDescription()
        static let finishKeeperTitle = R.string.localizable.onboardingAllGameFinishKeeperTitle()
        static let finishKeeperDescription = R.string.localizable.onboardingAllGameFinishKeeperDescription()
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
        
        nextButton.addTarget(self, action: #selector(nexxtAction), for: .touchUpInside)
        
        
        switch onbordingAllGame {
            
        case .spy(.hello):
            titleLable.text = Local.helloTitleText
            descriptionLabel.text = Local.helloInSpy
        case .spy(.takePhone):
            titleLable.text = Local.takePhoneTitle
            descriptionLabel.text = Local.takePhoneDescription
        case .spy(.location):
            titleLable.text = Local.locationTitle
            descriptionLabel.text = Local.locationDescription
        case .spy(.listen):
            titleLable.text = Local.listenTitle
            descriptionLabel.text = Local.listenDescription
        case .spy(.guess):
            titleLable.text = Local.guessTitle
            descriptionLabel.text = Local.guessDescription
        case .spy(.spy):
            titleLable.text = Local.spyTitle
            descriptionLabel.text = Local.spyDescription
        case .spy(.time):
            titleLable.text = Local.timeTitle
            descriptionLabel.text = Local.timeDescription
        case .contact(.hello):
            titleLable.text = Local.helloTitleText
            descriptionLabel.text = Local.helloContact
        case .contact(.admin):
            titleLable.text = Local.adminContactTitle
            descriptionLabel.text = Local.adminContactDescription
        case .contact(.othergamer):
            titleLable.text = Local.otherGamerContactTitle
            descriptionLabel.text = Local.otherGamerContactDescription
        case .contact(.guess):
            titleLable.text = Local.guessContactTitle
            descriptionLabel.text = Local.guessContactDescription
        case .contact(.admin2Letter):
            titleLable.text = Local.admin2LetterContactTitle
            descriptionLabel.text = Local.admin2LetterContactDescription
        case .contact(.didNotGuess):
            titleLable.text = Local.didNotGuessContactTitle
            descriptionLabel.text = Local.didNotGuessContactDescription
        case .keeper(.hello):
            titleLable.text = Local.helloTitleText
            descriptionLabel.text = Local.helloKeeperDescription
        case .keeper(.guess):
            titleLable.text = Local.guessKeeperTitle
            descriptionLabel.text = Local.guessKeeperDescription
        case .keeper(.gamer):
            titleLable.text = Local.gamerKeeperTitle
            descriptionLabel.text = Local.gamerKeeperDescription
        case .keeper(.finish):
            titleLable.text = Local.finishKeeperTitle
            descriptionLabel.text = Local.finishKeeperDescription
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
    
    @objc private func nexxtAction() {
        guard let type = onbordingAllGame else { return }
        moduleOutput?.nexxtActiv(from: type)
    }
        
    
}
