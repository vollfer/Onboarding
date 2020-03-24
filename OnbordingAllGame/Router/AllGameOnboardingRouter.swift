//
//  AllGameOnboardingRouter.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 04.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//

import UIKit

protocol AllGameOnboardingPageRouterInput {
    func openMainScreen()
}

final class AllGameOnboardingRouter {
    
    //MARK: - Properties
    
    unowned let transition: ModuleTransitionHandler
        
        
    //MARK: - Init
        
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
    
}


//MARK: - OnboardingContactPageRouterInput
extension AllGameOnboardingRouter: AllGameOnboardingPageRouterInput {
    
    func openMainScreen() {

        guard transition.isModal == false else {
            transition.dismiss(animated: true)
            return
        }

        let transitionAnimation = CATransition()
        transitionAnimation.duration = 0.5
        transitionAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transitionAnimation.type = CATransitionType.fade

        transition.navigationController?.view.layer.add(transitionAnimation, forKey: nil)

        transition.navigationController?.popViewController(animated: false)

    }
    
}

