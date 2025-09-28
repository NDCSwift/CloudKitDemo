//
    // Project: CloudKitDemo
    //  File: ContentView.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context

    @Query(sort:[SortDescriptor(\Entry.title)]) private var entries: [Entry]
    @State private var name: String = ""
    @State private var details: String = ""
    var body: some View {
        VStack {
            TextField("Enter Name", text: $name)
                .textFieldStyle(.roundedBorder)
            TextField("Details", text: $details)
                .textFieldStyle(.roundedBorder)
            
            Button("Save Entry"){
                let newEntry = Entry(title: name, details: details)
                context.insert(newEntry)
                try? context.save()
                name = ""
                details = ""
            }
            .buttonStyle(.borderedProminent)

            Divider()
            
            List(entries) { entry in
                Text(entry.title)
                Text(entry.details)
            }
         
            }
        .padding()
    }
}

#Preview {
    ContentView()
}
