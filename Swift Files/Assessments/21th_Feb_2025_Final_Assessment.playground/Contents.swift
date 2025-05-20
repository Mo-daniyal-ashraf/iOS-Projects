import UIKit

/* Task: Implement a simple messaging system.
 1. Define an enum MessageType to represent different types of messages (e.g., text, image, video).
 2. Create a protocol MessageContent with a property content of type String to represent the actual content of the message.
 3. Define a class Message with properties for sender, receiver, timestamp, type (using MessageType), and content (conforming to MessageContent protocol) and instance methods like printMessageDetails, etc.
 4. Use property wrappers to validate message content and make sure it's not empty, if empty provide default value.
 5. Use lazy properties for computing timestamps only when needed.
 6. Implement inheritance by creating subclasses of Message for different message types (e.g., TextMessage, ImageMessage, VideoMessage).
 7. Override methods and properties as needed in subclasses.
 8. Use property observers to update timestamps when messages are sent.
 9. Implement designated, convenience, and default initializers for Message and its subclasses.
 10. Implement the deinitializer for Message and all it's subclasses and print a message when it is deallocated.
 11. Create a structure Chat to represent a conversation between two users. It should have properties for user1, user2, an array of messages and a id which is unique for every chat and a sendMessage function to append the messages.
 12. Define an extension for Chat to add a method for sending a specific type of message.
 13. Use high-order functions and closures to filter and manipulate messages and provide methods like update message, delete message and search message by providing the keyword.
 14. Implement read-only and computed properties to calculate statistics on messages (e.g., message count, average message length).
 15. Implement a class ChatManager with properties for storing multiple chats, archived chats and a delegate for all chats operations.
 16. Add methods to ChatManager for showing all chats, showing archived chats, adding chats, removing chats, and updating chats. Use the delegation pattern to delegate all the operations to ChatOperation Class expect for displaying chats.
 17. Implement type methods to perform actions on chat (e.g., archiving, unarchiving).
 18. Define subscripting to access messages in a chat by index.
 19. Implement optional chaining and optional handling where appropriate.
 */


// Enum for Message type[text, Image, Video]
enum MessageType: String {
    
    case text = "Text"
    case image = "Image"
    case video = "video"
}

protocol MessageContent {
    
    var content: String { get }
}

// A Property Wrapper for validating content in message
@propertyWrapper
struct validateMessageContent {
    
    private var content: String = ""
    
    var wrappedValue: String {
        
        get { return content }
        
        set {
            // if content is empty then set to some default text
            if newValue.isEmpty {
                content = "This is a default text, because you didn't provided the content!"
            }
            else {
                content = newValue
            }
        }
    }
}

class Message {
    
    var sender: String
    var receiver: String
    var timestamp: String
    var type: MessageType
    @validateMessageContent var content: String
    
    // Method for displaying all messages
    func printMessageDetails() {
        
        print("""
              -----------------------------------------------
                HERE IS THE DETAILS OF YOUR MESSAGE
              -----------------------------------------------
                  From: \(sender)
                  To : \(receiver)
                  Sended at: \(timestamp)
                  Content type: \(type.rawValue)
                  Content: \(content)
              -----------------------------------------------
              """)
    }

    // A Lazy property for computing Timestamp
    lazy var computeTimestamp: String = {
        return self.timestamp
    }()
    
    // Designated Initializers for initialing all store properties of Message class
    init(sender: String, receiver: String, timestamp: String, type: MessageType, content: String) {

        self.sender = sender
        self.receiver = receiver
        self.timestamp = timestamp
        self.type = type
        self.content = content
    }
    
    // A convenience initializeer for setting the default sender name to "Daniyal"
    convenience init(receiver: String, timestamp: String, type: MessageType, content: String) {
        
        self.init(sender: "Daniyal", receiver: receiver, timestamp: timestamp, type: type, content: content)
    }
    
    // Deinitializar for printing some message when Message class instance disallocates
    deinit {
        
        print("You Deleted a message!")
    }

}

class TextMessage: Message {
        
    // Overrideing the Designated Initializers of super class
    override init(sender: String, receiver: String, timestamp: String, type: MessageType, content: String) {
        
        super.init(sender: sender, receiver: receiver, timestamp: timestamp, type: type, content: content)
    }
    
    // A convenience initializeer for setting the default type of content according to class
    convenience init(sender: String, receiver: String, timestamp: String, content: String) {
        
        self.init(sender: sender, receiver: receiver, timestamp: timestamp, type: .text, content: content)
    }
    
    deinit {
        
        print("You Deleted a Text message!")
    }
}

class ImageMessage: Message {
    
    override init(sender: String, receiver: String, timestamp: String, type: MessageType, content: String) {
    
        super.init(sender: sender, receiver: receiver, timestamp: timestamp, type: type, content: content)
    }
    
    convenience init(sender: String, receiver: String, timestamp: String, content: String) {
        
        self.init(sender: sender, receiver: receiver, timestamp: timestamp, type: .image, content: content)
    }
    
    deinit {
        
        print("You Deleted a Image message!")
    }
}


class VideoMessage: Message {
    
    
    override init(sender: String, receiver: String, timestamp: String, type: MessageType, content: String) {
        
        super.init(sender: sender, receiver: receiver, timestamp: timestamp, type: type, content: content)
    }
    
    convenience init(sender: String, receiver: String, timestamp: String, content: String) {
        
        self.init(sender: sender, receiver: receiver, timestamp: timestamp, type: .video, content: content)
    }
    
    deinit {
        
        print("You Deleted a Vedio message!")
    }
}


extension Chat {
    
    // A new method in chat class that will send specific type of message
    mutating func sendMessageOfASpecificType(sender: String, receiver: String, timestamp: String, content: String, specificTypeMessage: MessageType) {
        
        var newMessage = Message(sender: sender, receiver: receiver, timestamp: timestamp, type: specificTypeMessage, content: content)
        
        messages.append(newMessage)
        
        print("[\(specificTypeMessage)[ type of message sended successfully!")
    }
}


struct Chat {
    
    var user1: String
    var user2: String
    var messages: [Message]
    var id: Int
    
    // Delegate for ChatManager
    var chatManagerDelegate: ChatManagerDelegate?
    
    // Subscripting to access messages in a chat by index
    subscript(index: Int) -> Message {
        
        get {
            return self.messages[index]
        }
    }
    
    init(user1: String, user2: String, id: Int, chatManagerDelegate: ChatManagerDelegate){
        
        self.user1 = user1
        self.user2 = user2
        self.messages = []
        self.id = id
        self.chatManagerDelegate = chatManagerDelegate
        
        // add the chat into chats in ChatManager when it's fully initialized
        self.chatManagerDelegate?.addNewChat(chat: self)
    }
    
    // A computed property that will return the Statistics(number of messages and average message length)
    var getStatistics: String {
        
        get {
            
            var totalLength = 0
            
            for message in messages {
                
                totalLength += message.content.count
            }
            
            let avgMessageLength = totalLength / messages.count
            
            let finalStatistics =  """
                                   ----------------------------------------------------------
                                     HERE IS THE STATISTICS OF YOUR MESSAGES FOR CHAT ID : \(self.id)
                                   ----------------------------------------------------------
                                       Message count: \(messages.count)
                                       Average message length: \(avgMessageLength)
                                   ----------------------------------------------------------
                                   """
            
            return finalStatistics
        }
    }
    
    // Method that will add new messages into the chat
    mutating func sendMessage( message: Message) {
        
        messages.append(message)
    }
    
    // A Method that will filter the message according to content type [text, image, video]
    func filterMessages(condition: (Message) -> Bool ) -> [Message] {
                
        return messages.filter(condition)
    }

    // A method that will delete all messages of a specific sender
    func deleteMessageBySenderName(senderName: String) {
        
        var tempMessageArray = messages
        var isDeleted: Bool = false
        var noOfMessage = 0
        
        for (idx, message) in tempMessageArray.enumerated() {
            
            if message.sender == senderName {
                
                isDeleted = true
                tempMessageArray.remove(at: idx)
                noOfMessage += 1
            }
        }
        
        if isDeleted {
            
            print("[\(noOfMessage)]: messages of \(senderName) deleted successfully!")
        } else {
            
            print("Does not found the user \(senderName)!")
        }
    }
    
    // Method for searching message by sender name
    func serachMessage(senderName: String) -> [Message] {
        
        var allMessages: [Message] = []
        
        for message in messages {
            
            if message.sender == senderName {
                
                allMessages.append(message)
            }
        }
        
        return allMessages
    }
}

protocol ChatManagerDelegate {
    
    func addNewChat(chat: Chat) -> Void
    func deleteChat(chat: Chat) -> Void
}

class ChatManager: ChatManagerDelegate {
    
    var chats: [Chat]
    var archivedChats: [Chat]
    
    init() {
        
        self.chats = []
        self.archivedChats = []
    }
    
    // Method For displaying all live chats
    func showAllChats() {
        
        print("Here is your all chats: ")
        for chat in chats {
            
            for message in chat.messages {
                message.printMessageDetails()
            }
        }
    }
    
    // Method For displaying all Archived chats
    func showAllArchivedChats() {
        
        print("Here is your all archived chats: ")
        for chat in archivedChats {
            for message in chat.messages {
                message.printMessageDetails()
            }
        }
    }
    
    // Method for adding new chat into chats array
    func addNewChat(chat: Chat) {
        
        chats.append(chat)
    }
    
    // Method for Archiveding chat
    func archivingCHatById(chat: Chat) {
        
        for (idx, c) in chats.enumerated() {
            
            if c.id == chat.id {
                archivedChats.append(chat)
                chats.remove(at: idx)
                break
            }
        }
    }
    
    // Method for Unarchiveding chat
    func unarchivingCHatById(chat: Chat) {
        
        for (idx, c) in archivedChats.enumerated() {
            
            if c.id == chat.id {
                chats.append(chat)
                archivedChats.remove(at: idx)
                break
            }
        }
    }

    // Method for deleting a chat
    func deleteChat(chat: Chat) {
        
        for (idx, c) in chats.enumerated() {
            
            if c.id == chat.id {
                chats.remove(at: idx)
                print("Chat deleted successfully!")
                break
            }
        }
    }
}





var message1: TextMessage? = TextMessage(sender: "Daniyal", receiver: "Arav", timestamp: "11:00 AM", content: "Are you going to college today?")

var message2: TextMessage? = TextMessage(sender: "Arav", receiver: "Daniyal", timestamp: "12:00 AM", content: "Yes, I will go and you!")

message1?.printMessageDetails()
print("\n")

var chatManaggerObj1 = ChatManager()

var chat1 = Chat(user1: "Daniyal", user2: "Arav", id: 001, chatManagerDelegate: chatManaggerObj1)
var chat2 = Chat(user1: "Raj", user2: "Arav", id: 002, chatManagerDelegate: chatManaggerObj1)

chat1.sendMessage(message: message1!)
chat1.sendMessage(message: message2!)


// Filterd messages using closure
var filterdMessages = chat1.filterMessages {
    (message: Message) in
    return message.type == .text
}

print("  Here are the Filterd messages:")
for message in filterdMessages {
    message.printMessageDetails()
}

// Delete message
print()
chat1.deleteMessageBySenderName(senderName: "Arav")
print()

// extension for Chat to add a method for sending a specific type of message.
chat1.sendMessageOfASpecificType(sender: "Daniyal", receiver: "Arav", timestamp: "01:00 PM", content: "Yes i will go college too.", specificTypeMessage: .text)
print()

print(chat1.getStatistics)

// Archived chat by their chat id
chatManaggerObj1.archivingCHatById(chat: chat1)

// Subscript for chat message by index
print()
chat1[1].printMessageDetails()

var searchedMessages = chat1.serachMessage(senderName: "Arav")
print("\n Here is all your searched messages:")

for message in searchedMessages {
    message.printMessageDetails()
}



print(Date())



