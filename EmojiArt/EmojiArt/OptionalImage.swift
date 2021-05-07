//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Geonhyeong LIm on 2021/04/30.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
