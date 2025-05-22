//
//  UserModel.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/22/25.
//

import Foundation
import RealmSwift

//
//class User: Object {
//
//    @Persisted(primaryKey: true) var id = UUID().uuidString
//
//    @Persisted var mobileNumber: Int
//    @Persisted var name: String
//    @Persisted var email: String
//    @Persisted var chats = List<Chat>()
//}
//
//class Chat: Object {
//
//    @Persisted(primaryKey: true) var id = UUID().uuidString
//
//    @Persisted var user1Id: String
//    @Persisted var user2Id: String
//    @Persisted var lastMessage: String?
//    @Persisted var lastMessageTime: Date?
//
//    @Persisted var messages = List<Message>()
//}
//
//class Message: Object {
//
//    @Persisted(primaryKey: true) var id: String = UUID().uuidString
//    @Persisted var chatId: String
//    @Persisted var senderId: String
//    @Persisted var receiverId: String
//
//    @Persisted var text: String
//    @Persisted var sentAt: Date
//    @Persisted var isSeen: Bool
//}

class User {
    var id: String
    var name: String
    var email: String
    var mobileNumber: Int
    var chats: [Chat]

    init(id: String = UUID().uuidString, name: String, email: String, mobileNumber: Int, chats: [Chat] = []) {
        self.id = id
        self.name = name
        self.email = email
        self.mobileNumber = mobileNumber
        self.chats = chats
    }
}

class Chat {
    var id: String
    var user1Id: String
    var user2Id: String
    var lastMessage: String?
    var lastMessageTime: Date?
    var messages: [Message]

    init(id: String = UUID().uuidString, user1Id: String, user2Id: String, lastMessage: String?, lastMessageTime: Date?, messages: [Message]) {
        self.id = id
        self.user1Id = user1Id
        self.user2Id = user2Id
        self.lastMessage = lastMessage
        self.lastMessageTime = lastMessageTime
        self.messages = messages
    }
}

class Message {
    var id: String
    var chatId: String
    var senderId: String
    var receiverId: String
    var text: String
    var sentAt: Date
    var isSeen: Bool

    init(id: String = UUID().uuidString, chatId: String, senderId: String, receiverId: String, text: String, sentAt: Date, isSeen: Bool) {
        self.id = id
        self.chatId = chatId
        self.senderId = senderId
        self.receiverId = receiverId
        self.text = text
        self.sentAt = sentAt
        self.isSeen = isSeen
    }
}


