    //
    //  Message.swift
    //  Chatroom message
    //
    //  Created by Noye Samuel on 14/02/2023.
    //

import Foundation

struct Message {
    var  userId: String
    var contents: String?
    var date = Date()
    var hasJoined: Bool
    var hasLeft: Bool
    var isBeingDrafted: Bool
    var isSendingBalloons: Bool
}

enum Messages {
    case text(userId: String, contents: String, date: Date)
    case draft(userId: String, date: Date)
    case join(userId: String, date: Date)
    case leave(userId: String, date: Date)
    case balloon(userId: String, date: Date)
}
