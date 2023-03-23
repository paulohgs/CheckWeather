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
    // MARK: duvida para ser tirada com mentor sobre o configuration
    lazy var getButton = make(UIButton()) {
        $0.configuration = .bordered()
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
        // setup view
        backgroundColor = .systemBackground
    }
    func setupHierarchy() {
        addSubview(weatherCard)
        addSubview(getButton)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            weatherCard.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            weatherCard.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            weatherCard.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            weatherCard.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -50),
            getButton.topAnchor.constraint(equalTo: weatherCard.bottomAnchor, constant: 20),
            getButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
