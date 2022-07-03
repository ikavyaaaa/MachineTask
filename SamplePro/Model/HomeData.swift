//
//  HomeData.swift
//  SamplePro
//
//  Created by Kavya on 02/07/22.
//

import Foundation

struct HomeData1: Codable {
    let status: Bool
    let homeData: [HomeDat]

// MARK: - HomeDatum
struct HomeDat: Codable {
    let type: String
    let values: [Value]
}

// MARK: - Value
struct Value: Codable {
    let id: Int
    let name: String?
    let imageURL: String?
    let bannerURL: String?
    let image: String?
    let actualPrice: String?
    let offerPrice: String?
    let offer: Int?
    let isExpress: Bool?
}
}

