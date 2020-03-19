//
//  OnboardingKeeperAssemble.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 16.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//

import Foundation

final class OnboardingKeeperAssemble: Assembly {
    
    static func keeper() -> [OnboardingContactView] {
          
           let hello = OnboardingContactView()
           hello.onbordingAllGame = .keeper(.hello)
           
           let guess = OnboardingContactView()
           guess.onbordingAllGame = .keeper(.guess)
           
           let gamer = OnboardingContactView()
           gamer.onbordingAllGame = .keeper(.gamer)
           
           let finish = OnboardingContactView()
           finish.onbordingAllGame = .keeper(.finish)
           
           return[hello, guess, gamer, finish]
       }

    static func assembleModule() -> Module {
        
        let module = OnboardingContactPageView(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let presenter = OnboardingContactPagePresenter()
        let router = OnboardingContactRouter(transition: module)
        
        let onboardingViews = OnboardingKeeperAssemble.keeper()
        onboardingViews.forEach({ $0.moduleOutput = module })
        
        module.presenter = presenter
        module.guideViewControllers = onboardingViews
        
        presenter.view = module
        presenter.router = router
        
        return module
    }
}
