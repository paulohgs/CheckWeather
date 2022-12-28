//
//  Utils.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 10/10/22.
//

import UIKit

func make<T: UIView>(_ uiView: T, _ configure: (T) -> Void) -> T {
    configure(uiView)
    return uiView
}
