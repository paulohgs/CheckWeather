//
//  Observable.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 18/10/22.
//

import Foundation

class Observable<T> {
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    init(_ value: T?) {
        self.value = value
    }
    private var listener: ((T?) -> Void)?
    func bind(_ listener: @escaping (T?) -> Void) {
//        lixstener(value)
        self.listener = listener
    }
}
