//
//  CoreDataView.swift
//  Bookworm
//
//  Created by Denny Arfansyah on 25/01/23.
//

import Foundation
import SwiftUI

struct CoreDataView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>

    
    var body: some View {
        VStack {
            List(students) { student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstName = ["Ginny", "Harry", "Ron", "Luna"]
                let lastName = ["Delpiero", "Gringer", "Wesley", "Potter"]
                
                let choosenFirstName = firstName.randomElement()!
                let choosenLastName = lastName.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = choosenFirstName + " " + choosenLastName
                
                try? moc.save()
            }
        }
    }
}

struct CoreDataView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataView()
    }
}
