//
//  ViewController.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 10/10/22.
//

import UIKit

final class ViewController: UIViewController {
    var weatherView: WeatherView = WeatherView()
    let viewModel: WeatherViewModel
    init(viewModel: WeatherViewModel = WeatherViewModel(session: URLSession.shared)) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func loadView() {
        view = weatherView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.getCitiesByName()
        viewModel.weatherInfos.bind { [weak self] _ in
            guard let value = self?.viewModel.weatherInfos.value else { return }
            DispatchQueue.main.async {
                self?.weatherView.weatherCard.configureViewCard(with: value)
            }
        }
    }
}
