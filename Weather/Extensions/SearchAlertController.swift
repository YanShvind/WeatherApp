//
//  SearchAlertController.swift
//  Weather
//
//  Created by Yan Shvyndikov on 08.12.2022.
//

import UIKit

extension ManeViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, complectionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["San Francisco", "Moscow", "New York", "Stambul", "Viena"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                complectionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "cancel", style: .cancel)
        
        ac.addAction(search)
        ac.addAction(cancel)
        
        present(ac, animated: true)
    }
}

