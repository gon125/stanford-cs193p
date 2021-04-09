//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Geonhyeong LIm on 2021/04/02.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(of element: Element) -> Int? {
        self.firstIndex { $0.id == element.id }
    }
}
