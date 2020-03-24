//
//  AllGameOnboardingPagePresenter.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 04.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//


protocol AllGameOnboardingPageViewInput: class {
    func scrollToNext()
}

final class AllGameOnboardingPagePresenter {
    
    //MARK: - Properties
    
    weak var view: AllGameOnboardingPageViewInput?
    var router: AllGameOnboardingRouter?
    
}


//MARK: - OnboardingContactPageViewOutput
extension AllGameOnboardingPagePresenter: AllGameOnboardingPageViewOutput {
    
    func didTapNextButton(isLastStep: Bool) {
        
        guard isLastStep == false else {
            router?.openMainScreen()
            return
        }
        
        view?.scrollToNext()
    }
    
    func viewIsReady() {
        
    }
    
    
}
