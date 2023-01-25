//
//  AddBookView.swift
//  Bookworm
//
//  Created by Denny Arfansyah on 25/01/23.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var title = ""
    @State private var genre = ""
    @State private var rating = 3
    @State private var author = ""
    @State private var review = ""
    
    let genres = ["Fantasy", "Horor", "Kids", "Romance", "Thriller", "Poetry"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of the book", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                } header: {
                    Text("Write a review")
                }
                
                Button("Save") {
                    let newBook = Book(context: moc)
                    newBook.id = UUID()
                    newBook.title = title
                    newBook.genre = genre
                    newBook.rating = Int16(rating)
                    newBook.author = author
                    newBook.review = review
                    
                    try? moc.save()
                    dismiss()
                }
            }
            .navigationTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
