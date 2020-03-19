//
//  OnboardingContactAssemble.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 17.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//

import Foundation

final class OnboardingContactAssemble: Assembly {
    
    static func contact() -> [OnboardingContactView] {
          
        let hello = OnboardingContactView()
        hello.onbordingAllGame = .contact(.hello)
        
        let admin = OnboardingContactView()
        admin.onbordingAllGame = .contact(.admin)
        
        let othergamer = OnboardingContactView()
        othergamer.onbordingAllGame = .contact(.othergamer)
           
        let guess = OnboardingContactView()
        guess.onbordingAllGame = .contact(.guess)
           
        let admin2Letter = OnboardingContactView()
        admin2Letter.onbordingAllGame = .contact(.admin2Letter)
        
        let didNotGuess = OnboardingContactView()
        didNotGuess.onbordingAllGame = .contact(.didNotGuess)
           
        return[hello, admin, othergamer, guess, admin2Letter, didNotGuess]
    }

    static func assembleModule() -> Module {
        
        let module = OnboardingContactPageView(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let presenter = OnboardingContactPagePresenter()
        let router = OnboardingContactRouter(transition: module)
        
        let onboardingViews = OnboardingContactAssemble.contact()
        onboardingViews.forEach({ $0.moduleOutput = module })
        
        module.presenter = presenter
        module.guideViewControllers = onboardingViews
        
        presenter.view = module
        presenter.router = router
        
        return module
    }
}

