//
//  AllGameOnboardingAssembly.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 23.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//


final class AllGameOnboardingAssemble: Assembly {

    static func createContactModuls(with type: [GameTipsScreenType], moduleOutput: AllGameOnboardingPageView) -> [Module] {
        let moduls = type.map { type -> Module in
            let module = AllGameOnboardingView()
            module.onbordingAllGame = type
            module.moduleOutput = moduleOutput
            return module
        }
        return moduls
    }

    static func assembleModule(with model: TransitionModel) -> Module {
        
        guard let model = model as? Model else {
            fatalError()
        }

        let module = AllGameOnboardingPageView(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let presenter = AllGameOnboardingPagePresenter()
        let router = AllGameOnboardingRouter(transition: module)

        let onboardingViews = AllGameOnboardingAssemble.createContactModuls(with: model.gameTipsScreenTypes, moduleOutput: module)

        module.presenter = presenter
        module.guideViewControllers = onboardingViews

        presenter.view = module
        presenter.router = router

        return module
    }
}


// MARK: - Model
extension AllGameOnboardingAssemble {

    struct Model: TransitionModel {
        let gameTipsScreenTypes: [GameTipsScreenType]
    }
}
