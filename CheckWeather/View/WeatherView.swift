//
//  HomeView.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 10/10/22.
//

import UIKit

class WeatherView: UIView {
    var cityName: String?
    lazy var cityLabel = make(UILabel()) {
        $0.text = cityName
        $0.font = .systemFont(ofSize: 24, weight: .medium)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    init() {
        cityName = "HOME"
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with model: WeatherModel) {
        self.cityName = model.name
    }
}
extension WeatherView: ViewCoding {
    func setupView() {
        backgroundColor = .systemBackground
    }
    func setupHierarchy() {
        addSubview(cityLabel)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            cityLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
