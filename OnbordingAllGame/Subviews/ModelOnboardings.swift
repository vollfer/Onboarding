//
//  ModelOnboardings.swift
//  ForFriends
//
//  Created by Александр  Бровков  on 17.03.2020.
//  Copyright © 2020 Potapov Anton. All rights reserved.
//

import Foundation

enum GAMETYPE {
    
    enum Spy {
        case hello
        case takePhone
        case location
        case listen
        case guess
        case spy
        case time
    }
    enum Contact {
        case hello
        case admin
        case othergamer
        case guess
        case admin2Letter
        case didNotGuess
    }
    enum Keeper {
        case hello
        case guess
        case gamer
        case finish
    }
    case spy(Spy)
    case contact(Contact)
    case keeper(Keeper)
}
