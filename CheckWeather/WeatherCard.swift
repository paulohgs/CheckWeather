//
//  WeatherCard.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 17/10/22.
//

import UIKit

class WeatherCard: UIView {
    var cityName: String
    var condition: String
    var actualTemp, feelsLike, tempMin, tempMax, windSpeed, humidity: Double
    private lazy var cityLabel = make(UILabel()) {
        $0.text = cityName
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        $0.numberOfLines = 1
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private lazy var conditionLabel = make(UILabel()) {
        $0.text = condition
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.numberOfLines = 0
    }
    private lazy var tempNumbers = make(UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = """
        Acutal temp: \(actualTemp) Feelslike: \(feelsLike)
        Temp. max: \(tempMax) Temp. min: \(tempMin)
        Wind Speed: \(windSpeed) Humidity: \(humidity)
        """
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
        $0.distribution = .fill
        $0.isLayoutMarginsRelativeArrangement = true
        $0.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15)
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .systemGray2
    }
    init() {
        cityName = ""
        condition = ""
        actualTemp = 0.0
        feelsLike = 0.0
        tempMin = 0.0
        tempMax = 0.0
        windSpeed = 0.0
        humidity = 0.0
        super.init(frame: UIScreen.main.bounds)
        buildLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureViewCard(with model: WeatherModel) {
        cityLabel.text = model.name
        conditionLabel.text = model.weather[0].weatherDescription
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
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor)
        ])
    }
    func setupHierarchy() {
        // setup hierarchy
        self.addSubview(stack)
    }
}
