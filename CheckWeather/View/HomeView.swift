//
//  HomeView.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 10/10/22.
//

import UIKit

class HomeView: UIView {

    let homeLabel = make(UILabel()) {
        $0.text = "Home"
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    init() {
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeView: ViewCoding {
    func setupView() {
        backgroundColor = .systemBackground
    }
    func setupHierarchy() {
        addSubview(homeLabel)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            homeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            homeLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
