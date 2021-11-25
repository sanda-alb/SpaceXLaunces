//
//  String + Date.swift
//  SpaceXLaunches
//
//  Created by TK_User on 25.11.2021.
//

import Foundation

extension String {
    func formatDate() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [
            .withFullDate,
            .withDashSeparatorInDate
        ]
        guard let isoDate = isoDateFormatter.date(from: self) else { return "" }
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "d MMMM, yyy"
        return dateFormatter.string(from: isoDate)
        }
    }
