//
//  ViewCoding.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 10/10/22.
//

import Foundation

protocol ViewCoding {
    func setupView()
    func setupConstraints()
    func setupHierarchy()
}

extension ViewCoding {
    func buildLayout() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
}
