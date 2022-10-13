//
//  ViewController.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 10/10/22.
//

import UIKit

class ViewController: UIViewController {
    let homeView: HomeView = HomeView()

    override func loadView() {
        view = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
