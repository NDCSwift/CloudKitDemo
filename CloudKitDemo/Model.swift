//
    // Project: CloudKitDemo
    //  File: Model.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    
import SwiftData
import Foundation

@Model
final class Entry {
    var id: UUID = UUID()
    var title: String = ""
    var details: String = ""
    
    
    init(title: String, details: String) {
        self.title = title
        self.details = details
    }
    
}
