//
//  Movie.swift
//  AppleTV-CloneCoding
//
//  Created by Thisisme Hi on 2021/12/24.
//

import UIKit

class Movie: Hashable {
        
    var id = UUID()
    var poster: UIImage?
    var genre: String?
    var price: Int?
    
    init(poster: UIImage? = nil,
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

extension Movie {
    static let allBigMovies = [
        Movie(poster: UIImage(named: "imgBigPoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgBigPoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgBigPoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgBigPoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgBigPoster"), genre: nil, price: nil)
    ]
    
    static let allMiddleMovies = [
        Movie(poster: UIImage(named: "imgMiddlePoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgMiddlePoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgMiddlePoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgMiddlePoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgMiddlePoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgMiddlePoster"), genre: nil, price: nil)
    ]
    
    static let allSmallMovies = [
        Movie(poster: UIImage(named: "imgSmallPoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgSmallPoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgSmallPoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgSmallPoster"), genre: nil, price: nil),
        Movie(poster: UIImage(named: "imgSmallPoster"), genre: nil, price: nil)
    ]
}
