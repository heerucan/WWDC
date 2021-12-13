//
//  Section.swift
//  DiffableDataSource-Practice
//
//  Created by Thisisme Hi on 2021/12/14.
//

import UIKit
// 1
class Section: Hashable {
  var id = UUID()
  // 2
  var title: String
  var videos: [Video]
  
  init(title: String, videos: [Video]) {
    self.title = title
    self.videos = videos
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
  
  static func == (lhs: Section, rhs: Section) -> Bool {
    lhs.id == rhs.id
  }
}
