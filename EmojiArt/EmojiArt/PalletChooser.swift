//
//  PalletChooser.swift
//  EmojiArt
//
//  Created by Geonhyeong LIm on 2021/05/14.
//

import SwiftUI

struct PalletChooser: View {
    @ObservedObject var document: EmojiArtDocument
    @Binding var chosenPalette: String
    var body: some View {
        HStack {
            Stepper(
                onIncrement: {
                    self.chosenPalette = self.document.palette(after: self.chosenPalette)
                },
                onDecrement: {
                    self.chosenPalette = self.document.palette(before: self.chosenPalette)
                },
                label: {
                    EmptyView()
                })
            Text(self.document.paletteNames[self.chosenPalette] ?? "")
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct PalletChooser_Previews: PreviewProvider {
    static var previews: some View {
        PalletChooser(document: EmojiArtDocument(), chosenPalette: .constant(""))
    }
}
