//
//  Feed.swift
//  DiffableDataSource-Practice
//
//  Created by Thisisme Hi on 2021/12/01.
//

import UIKit

// 아이템 부분

struct Feed: Hashable {
    var id = UUID()
    var name: String
    var content: String
    
    init(name: String, content: String) {
        self.name = name
        self.content = content
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.id == rhs.id
    }
    
    public let feedArray = [
        Feed(name: "루희", content: "밥을 먹는 건 참 좋은데, 왜 요새 살이 너무 쪄서 내일은 진짜 물단식을 해볼까해."),
        Feed(name: "루희", content: "밥을 먹는 건 참 좋은데, 왜 요새 살이 너무 쪄서 내일은 진짜 물단식을 해볼까해."),
        Feed(name: "만동", content: "소연이는 만동이다. 만동이~~ 왜냐하면 오라버니의 이름이 만수이기 때문이다."),
        Feed(name: "루희", content: "밥을 먹는 건 참 좋은데, 왜 요새 살이 너무 쪄서 내일은 진짜 물단식을 해볼까해."),
        Feed(name: "루희", content: "밥을 먹는 건 참 좋은데, 왜 요새 살이 너무 쪄서 내일은 진짜 물단식을 해볼까해.")
    ]
}
