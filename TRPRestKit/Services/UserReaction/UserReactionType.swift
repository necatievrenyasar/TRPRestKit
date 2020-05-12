//
//  UserReactionType.swift
//  TRPRestKit
//
//  Created by Evren Yaşar on 1.05.2020.
//  Copyright © 2020 Evren Yaşar. All rights reserved.
//

import Foundation
public enum UserReactionType: String {
    case thumbsUp = "THUMBS UP"
    case thumbsDown = "THUMBS DOWN"
    case neutral = "NEUTRAL"
}

public enum UserReactionComment: String {
    case iHaveAlreadyVisited = "I_HAVE_ALREADY_VISITED"
    case iDontLikePlace = "I_DONT_LIKE_PLACE"
}
