//
//  HomeView.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 10/10/22.
//

import UIKit

class WeatherView: UIView {
    lazy var weatherCard = make(WeatherCard()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    lazy var getButton = make(UIButton(type: .roundedRect)) {
        $0.setTitle("Get weather", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 5
        $0.backgroundColor = .white
    }
    init() {
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension WeatherView: ViewCoding {
    func setupView() {
        backgroundColor = .systemBackground
    }
    func setupHierarchy() {
        addSubview(weatherCard)
        addSubview(getButton)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // card constraints
            weatherCard.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            weatherCard.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weatherCard.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            weatherCard.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
            // button constraints
            getButton.topAnchor.constraint(equalTo: weatherCard.bottomAnchor, constant: 20),
            getButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
