//
//  UserModel.swift
//  WhatsApp_Clone
//
//  Created by Mddaniyal on 5/22/25.
//

import Foundation
import RealmSwift

class User: Object {
    
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var name: String
    @Persisted var email: String
    @Persisted var mobileNumber: Int
    @Persisted var about: String
    @Persisted var chats = List<Chat>()
}

class Chat: Object {
    
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var user1Id: String
    @Persisted var user2Id: String
    @Persisted var lastMessage: String?
    @Persisted var lastMessageTime: Date?
    @Persisted var messages = List<Message>()
}

class Message: Object {
    
    @Persisted(primaryKey: true) var id: String = UUID().uuidString
    @Persisted var chatId: String
    @Persisted var senderId: String
    @Persisted var receiverId: String
    @Persisted var text: String
    @Persisted var sentAt: Date
    @Persisted var isSeen: Bool
}
