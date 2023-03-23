//
//  WeatherCard.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 17/10/22.
//

import UIKit

class WeatherCard: UIView {
    private lazy var cityLabel = make(UILabel()) {
        $0.text = ""
        $0.textAlignment = .natural
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var conditionLabel = make(UILabel()) {
        $0.text = ""
        $0.textAlignment = .natural
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.numberOfLines = 0
    }
    private lazy var tempNumbers = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = ""
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        $0.numberOfLines = 0
    }
    private lazy var stack = make(UIStackView(arrangedSubviews: [
        cityLabel,
        conditionLabel,
        tempNumbers
    ])) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 10
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.isLayoutMarginsRelativeArrangement = true
        $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemGray2
    }
    init() {
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureViewCard(with model: WeatherModel) {
        cityLabel.text = model.name
        conditionLabel.text = model.weather[0].weatherDescription
        tempNumbers.text = """
        Acutal temp: \(model.main.temp) Feelslike: \(model.main.feelsLike)
        Temp. max: \(model.main.tempMax) Temp. min: \(model.main.tempMin)
        Wind Speed: \(model.wind.speed) Humidity: \(model.main.humidity)
        """
    }
}

extension WeatherCard: ViewCoding {
    func setupView() {
        // setup the view
        backgroundColor = .systemBackground
    }
    func setupConstraints() {
        // setup constraints
        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    func setupHierarchy() {
        // setup hierarchy
        self.addSubview(stack)
    }
}
