//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Denny Arfansyah on 25/01/23.
//

import SwiftUI

struct EmojiRatingView: View {
    let rating: Int16
    
    var body: some View {
        switch rating {
        case 1:
            return Text("âšī¸")
        case 2:
            return Text("đļ")
        case 3:
            return Text("đ")
        case 4:
            return Text("đĢļ")
        default:
            return Text("đ")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
