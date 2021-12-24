//
//  Films.swift
//  GET People and Films
//
//  Created by admin on 24/12/2021.
//

import Foundation

struct Films : Codable {
    let count: Int
    let results: [Result1]
}

// MARK: - Result
struct Result1 : Codable {
    let title: String
    let episode_id: Int
    let opening_crawl, director, producer, release_date: String
    let characters, planets, starships, vehicles: [String]
    let species: [String]
    let created, edited: String
    let url: String
}
