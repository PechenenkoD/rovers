//
//  View.swift
//  NASARover
//
//  Created by Dmitro Pechenenko on 18.08.2023.
//

import SwiftUI

extension View {
    
    public func hAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    public func vAlign(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
}
