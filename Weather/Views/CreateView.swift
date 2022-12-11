//
//  CreateView.swift
//  Weather
//
//  Created by Yan Shvyndikov on 07.12.2022.
//

import UIKit

protocol CreateViewOutput: AnyObject {
    func searchButtonPressed()
}

final class CreateView: UIView {
    
    weak var delegate: CreateViewOutput?

    let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .systemCyan
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let temperatureLabel =  UILabel(text: "", font: UIFont(name: "Avenir Next Demi Bold", size: 50), alignment: .center)
    let cityNameLabel = UILabel(text: "Moscow", font: UIFont(name: "San Francisco", size: 17), alignment: .right)
    let feelsLikeLabel = UILabel(text: "", font: UIFont(name: "San Francisco", size: 17), alignment: .center)

    private let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.backgroundColor = UIColor(named: "testColor")
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Behaviors Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        
        configViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    @objc
    private func searchButtonPressed() {
        
        delegate?.searchButtonPressed()
    }
}

extension CreateView {
    private func configViewComponents() {

        addSubview(weatherImageView)
        addSubview(temperatureLabel)
        addSubview(cityNameLabel)
        addSubview(feelsLikeLabel)
        addSubview(searchButton)
        
        NSLayoutConstraint.activate([
            weatherImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            weatherImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            weatherImageView.topAnchor.constraint(equalTo: topAnchor, constant: 70),
            weatherImageView.heightAnchor.constraint(equalToConstant: 200),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherImageView.bottomAnchor, constant: 10),
            temperatureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            temperatureLabel.heightAnchor.constraint(equalToConstant: 50),
            
            searchButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            searchButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            
            cityNameLabel.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -10),
            cityNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            cityNameLabel.heightAnchor.constraint(equalToConstant: 40),
            cityNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            feelsLikeLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 1),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            feelsLikeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            feelsLikeLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
