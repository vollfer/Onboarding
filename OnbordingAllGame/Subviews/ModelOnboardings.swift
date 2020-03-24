//
//  ModelOnboardings.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 17.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//


enum GameTipsScreenType {
    
    enum Spy {
        case hello
        case takePhone
        case location
        case listen
        case guess
        case spy
        case time
        
        var titleSpy: String {
            switch self {
            case .hello:
                return R.string.localizable.onboardingHelloTitle()
            case .takePhone:
                return R.string.localizable.onboardingAllGameTakePhoneSpyTitle()
            case .location:
                return R.string.localizable.onboardingAllGameLocationSpyTitle()
            case .listen:
                return R.string.localizable.onboardingAllGameListenSpyTitle()
            case .guess:
                return R.string.localizable.onboardingAllGameGuessSpyTitle()
            case .spy:
                return R.string.localizable.onboardingAllGameSpySpyTitle()
            case .time:
               return R.string.localizable.onboardingAllGameTimeSpyTitle()
            }
        }
        
        var descriptionSpy: String {
            switch self {
            case .hello:
                return R.string.localizable.onboardingAllGameHelloSpy()
            case .takePhone:
                return R.string.localizable.onboardingAllGameTakePhoneSpyDescription()
            case .location:
                return R.string.localizable.onboardingAllGameLocationSpyDescription()
            case .listen:
                return R.string.localizable.onboardingAllGameListenSpyDescription()
            case .guess:
                return R.string.localizable.onboardingAllGameGuessSpyDescription()
            case .spy:
                return R.string.localizable.onboardingAllGameSpySpyDescription()
            case .time:
                return R.string.localizable.onboardingAllGameTimeSpyDescription()
            }
        }
    }
    
    enum Contact {
        case hello
        case admin
        case othergamer
        case guess
        case admin2Letter
        case didNotGuess
        
        var titleContact: String {
            switch self {
            case .hello:
                return R.string.localizable.onboardingHelloTitle()
            case .admin:
                return R.string.localizable.onboardingAllGameAdminContactTitle()
            case .othergamer:
                return R.string.localizable.onboardingAllGameOtherGamerContactTitle()
            case .guess:
                return R.string.localizable.onboardingAllGameGuessContactTitle()
            case .admin2Letter:
                return R.string.localizable.onboardingAllGameAdmin2LetterContactTitle()
            case .didNotGuess:
                return R.string.localizable.onboardingAllGameDidNotGuessContactTitle()
            }
        }
        
        var descriptionContact: String {
            switch self {
            case .hello:
                return R.string.localizable.onboardingAllGameHelloContactDescription()
            case .admin:
                return R.string.localizable.onboardingAllGameAdminContactDescription()
            case .othergamer:
                return R.string.localizable.onboardingAllGameOtherGamerContactDescription()
            case .guess:
                return R.string.localizable.onboardingAllGameGuessContactDescription()
            case .admin2Letter:
                return R.string.localizable.onboardingAllGameAdmin2LetterContactDescription()
            case .didNotGuess:
                return R.string.localizable.onboardingAllGameDidNotGuessContactDescription()
            }
        }
    }
    
    enum Keeper {
        case hello
        case guess
        case gamer
        case finish
        
        var titleKeeper: String {
            switch self {
            case .hello:
                return R.string.localizable.onboardingHelloTitle()
            case .guess:
                return R.string.localizable.onboardingAllGameGuessKeeperTitle()
            case .gamer:
                return R.string.localizable.onboardingAllGameGamerKeeperTitle()
            case .finish:
               return R.string.localizable.onboardingAllGameFinishKeeperTitle()
            }
        }
        
        var descriptionKeeper: String {
            switch self {
            case .hello:
                return R.string.localizable.onboardingAllGameHelloKeeperDescription()
            case .guess:
                return R.string.localizable.onboardingAllGameGuessKeeperDescription()
            case .gamer:
                return R.string.localizable.onboardingAllGameGamerKeeperDescription()
            case .finish:
                return R.string.localizable.onboardingAllGameFinishKeeperDescription()
            }
        }
    }
    case spy(Spy)
    case contact(Contact)
    case keeper(Keeper)
}
