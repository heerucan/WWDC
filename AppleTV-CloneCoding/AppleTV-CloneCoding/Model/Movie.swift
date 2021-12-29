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
    
    init(poster: UIImage? = nil) {
        self.poster = poster
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
        Movie(poster: UIImage(named: "imgBigPoster")),
        Movie(poster: UIImage(named: "imgBigPoster")),
        Movie(poster: UIImage(named: "imgBigPoster")),
        Movie(poster: UIImage(named: "imgBigPoster")),
        Movie(poster: UIImage(named: "imgBigPoster"))
    ]
    
    static let allMiddleMovies = [
        Movie(poster: UIImage(named: "imgMiddlePoster")),
        Movie(poster: UIImage(named: "imgSmallPoster")),
        Movie(poster: UIImage(named: "imgMiddlePoster")),
        Movie(poster: UIImage(named: "imgSmallPoster")),
        Movie(poster: UIImage(named: "imgMiddlePoster")),
        Movie(poster: UIImage(named: "imgMiddlePoster"))
    ]
    
    static let allSmallMovies = [
        Movie(poster: UIImage(named: "imgSmallPoster")),
        Movie(poster: UIImage(named: "imgMiddlePoster")),
        Movie(poster: UIImage(named: "imgSmallPoster")),
        Movie(poster: UIImage(named: "imgMiddlePoster")),
        Movie(poster: UIImage(named: "imgSmallPoster"))
    ]
    
    static let allSecondSmallMovies = [
        Movie(poster: UIImage(named: "imgSmallPoster")),
        Movie(poster: UIImage(named: "imgMiddlePoster")),
        Movie(poster: UIImage(named: "imgSmallPoster")),
        Movie(poster: UIImage(named: "imgMiddlePoster")),
        Movie(poster: UIImage(named: "imgSmallPoster"))
    ]
    
    static let allSecondBigMovies = [
        Movie(poster: UIImage(named: "imgBigPoster")),
        Movie(poster: UIImage(named: "imgBigPoster")),
        Movie(poster: UIImage(named: "imgBigPoster")),
        Movie(poster: UIImage(named: "imgBigPoster")),
        Movie(poster: UIImage(named: "imgBigPoster"))
    ]
}
