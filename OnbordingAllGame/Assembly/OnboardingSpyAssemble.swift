//
//  OnboardingSpyAssemble.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 04.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//

import Foundation

final class OnboardingSpyAssemble: Assembly {
    
    static func spy() -> [OnboardingContactView] {
        let hello = OnboardingContactView()
        hello.onbordingAllGame = .spy(.hello)
        
        let takePhone = OnboardingContactView()
        takePhone.onbordingAllGame = .spy(.takePhone)
        
        let location = OnboardingContactView()
        location.onbordingAllGame = .spy(.location)
        
        let listen = OnboardingContactView()
        listen.onbordingAllGame = .spy(.listen)
        
        let guess = OnboardingContactView()
        guess.onbordingAllGame = .spy(.guess)
        
        let spy = OnboardingContactView()
        spy.onbordingAllGame = .spy(.spy)
        
        let time = OnboardingContactView()
        time.onbordingAllGame = .spy(.time)
        
        return[hello, takePhone, location, listen, guess, spy, time]
    }
    
    static func assembleModule() -> Module {
        
        let module = OnboardingContactPageView(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let presenter = OnboardingContactPagePresenter()
        let router = OnboardingContactRouter(transition: module)
        
        let onboardingViews = OnboardingSpyAssemble.spy()
        onboardingViews.forEach({ $0.moduleOutput = module })
        
        module.presenter = presenter
        module.guideViewControllers = onboardingViews
        
        presenter.view = module
        presenter.router = router
        
        return module
    }
}
