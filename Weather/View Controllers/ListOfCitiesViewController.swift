//
//  ListOfCitiesViewController.swift
//  Weather
//
//  Created by Yan Shvyndikov on 08.12.2022.
//

import UIKit

final class ListOfCitiesViewController: UIViewController {
    
    private let cityNameArray = ["Москва", "Санкт-Петербург", "Новосибирск", "Екатеринбург", "Казань", "Нижний Новгород", "Челябинск", "Омск", "Самара", "Ростов-на-Дону", "Уфа", "Красноярск", "Пермь", "Воронеж", "Волгоград"]
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 60
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Список городов"
        view.backgroundColor = .systemBackground
        
        tableView.register(ListOfCitiesTableViewCell.self, forCellReuseIdentifier: ListOfCitiesTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        self.view.addSubview(tableView)
        setConstrains()
    }
}

extension ListOfCitiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfCitiesTableViewCell.identifier,
                                                for: indexPath) as! ListOfCitiesTableViewCell
        
        cell.textLabel?.text = "\(cityNameArray[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(cityNameArray[indexPath.row])")
    }
}

//MARK: Add ConstrainsManeViewController
extension ListOfCitiesViewController {
    private func setConstrains(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}
