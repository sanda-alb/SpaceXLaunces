//
//  Mission.swift
//  SpaceXLaunches
//
//  Created by TK_User on 12.11.2021.
//

import Foundation
import UIKit


struct Mission: Decodable {
    
    let missionName: String
    let launchDate: String?
    let links: Links
    let rocket: Rocket
  
    enum CodingKeys: String, CodingKey {
        case missionName = "mission_name"
        case launchDate = "launch_date_utc"
        case links = "links"
        case rocket = "rocket"
    }
}

struct Links: Decodable {
    
    let patchPath: String?
    let articleLink: String?
    let wikipedia: String?
    let images: [String]?
    let reddit: String?
    let video: String?
    
    enum CodingKeys: String, CodingKey {
        case patchPath = "mission_patch_small"
        case articleLink = "article_link"
        case wikipedia = "wikipedia"
        case reddit = "reddit_media"
        case video = "video_link"
        case images = "flickr_images"
    }
}

struct Rocket: Decodable {
    
let rocketName: String?
    
    enum CodingKeys: String, CodingKey {
        case rocketName = "rocket_name"
    }
}




