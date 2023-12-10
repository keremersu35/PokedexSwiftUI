//
//  String+CapitalizeFirstLetter.swift
//  Pokedex
//
//  Created by Kerem Ersu on 10.12.2023.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
