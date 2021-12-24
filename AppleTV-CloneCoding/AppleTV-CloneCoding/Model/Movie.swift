//
//  Movie.swift
//  AppleTV-CloneCoding
//
//  Created by Thisisme Hi on 2021/12/24.
//

import UIKit

class Movie: Hashable {
        
    var id = UUID()
    var poster: UIImage
    var genre: String?
    var price: Int?
    
    init(poster: UIImage,
         genre: String? = nil,
         price: Int? = nil) {
        self.poster = poster
        self.genre = genre
        self.price = price
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        lhs.id == rhs.id
    }
}
