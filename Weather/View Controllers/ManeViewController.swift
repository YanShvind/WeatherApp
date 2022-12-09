//
//  ViewController.swift
//  Weather
//
//  Created by Yan Shvyndikov on 07.12.2022.
//

import UIKit

final class ManeViewController: UIViewController {
    
    private let createView: CreateView = {
        let view = CreateView()
        return view
    }()
    
    private var networkWeatherManager = NetworkWeatherManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        networkWeatherManager.delegate = self
        createView.delegate = self
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet.rectangle.portrait"),
                                                           style: .plain,
                                                            target: self,
                                                            action: #selector(openListButtonPressed))
        
        networkWeatherManager.fetchCurrentWeather(forCity: "Moscow")
    }

    override func loadView() {
        
        self.view = createView
    }
    
    private func updateWithInterface(weather: CurrentWeather) {
        
        DispatchQueue.main.async {
            self.createView.cityNameLabel.text = weather.cityName
            self.createView.temperatureLabel.text = "\(weather.temperatureSrting)°C"
            self.createView.feelsLikeLabel.text = "feelsLike: \(weather.feelsLikeTemperatureSrting)"
            self.createView.maneImage.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}

extension ManeViewController: NetworkWeatherManagerDelegate {
    
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
        updateWithInterface(weather: currentWeather)
    }
}

extension ManeViewController: CreateViewOutput {
    
    @objc func openListButtonPressed() {
        let controller = ListOfCitiesViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func searchButtonPressed() {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
        }
    }
}


