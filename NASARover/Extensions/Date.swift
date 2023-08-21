//
//  Date.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 19.08.2023.
//

import SwiftUI

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
}
