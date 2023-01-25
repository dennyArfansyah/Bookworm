//
//  ContentView.swift
//  Bookworm
//
//  Created by Denny Arfansyah on 25/01/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showingNewScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            VStack {
                                Text(book.title ?? "Unknown title")
                                    .font(.headline)
                                Text(book.author ?? "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBook)
            }
            .navigationTitle("Bookworm")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingNewScreen.toggle()
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingNewScreen) {
                AddBookView()
            }
        }
    }
    
    private func deleteBook(for offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
