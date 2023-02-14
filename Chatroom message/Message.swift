    //
    //  Message.swift
    //  Chatroom message
    //
    //  Created by Noye Samuel on 14/02/2023.
    //

import Foundation

struct Message {
    var  userid: String
    var contents: []
    var date = Date()
    var hasJoined: Bool
    var hasLeft: Bool
    var isBeingDrafted: Bool
    var isSendingBallons: Bool
}
