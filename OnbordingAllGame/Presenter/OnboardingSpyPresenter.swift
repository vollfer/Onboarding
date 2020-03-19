//
//  OnboardingContactPagePresenter.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 04.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//

import Foundation

protocol OnboardingContactPageViewInput: class {
    func scrollToNext()
}

final class OnboardingContactPagePresenter {
    
    //MARK: - Properties
    
    weak var view: OnboardingContactPageViewInput?
    var router: OnboardingContactRouter?
    
}

extension OnboardingContactPagePresenter: OnboardingContactPageViewOutput {
    
    
    func didTapNextButton(isLastView: Bool) {
        
        guard isLastView == false else {
            router?.openMainScreen()
            return
        }
        
        view?.scrollToNext()
    }
    
    func viewIsReady() {
        
    }
    
    
}
