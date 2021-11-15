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
  
    enum CodingKeys: String, CodingKey {
        case missionName = "mission_name"
        case launchDate = "launch_date_utc"
        case links = "links"
    }
}

struct Links: Decodable {
    
    var patchPath: String?
    
    enum CodingKeys: String, CodingKey {
        case patchPath = "mission_patch_small"
    }
}


