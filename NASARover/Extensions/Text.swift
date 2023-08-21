//
//  Text.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 19.08.2023.
//

import SwiftUI

extension Text {
    static func marsDateText(dateString: String) -> Text {
        guard let date = DateFormatter.dateFormatter.date(from: dateString) else {
            return Text(dateString)
        }
        return Text(date, style: .date)
    }
}
