//
//  customButton.swift
//  RandomWikiPage
//
//  Created by user on 27/06/22.
//

import Foundation
import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(CustomColor.bluScuro)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .shadow(color: .black, radius: 10)
             .padding()
    }
}
