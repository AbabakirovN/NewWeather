//
//  MainViewController.swift
//  NewWeather
//
//  Created by Nurzhan Ababakirov on 13/3/21.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    var weatherFive = [List]()
    
    @IBOutlet weak var tempOneLabel: UILabel!
    @IBOutlet weak var feelslLikeLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getWeatherFiveList { (weatherFiveList) in
            self.weatherFive = weatherFiveList.list
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
            
        } _: { (error) in
            print(error + "five")
        }
        
        ServerManager.shared.getWeatherOneList { (weatherOneList) in
            self.tempOneLabel.text = String(weatherOneList.main.temp)
            self.feelslLikeLabel.text = String(weatherOneList.main.feelsLike)
            self.humidityLabel.text = String(weatherOneList.main.humidity)
            self.windLabel.text = String(weatherOneList.wind.speed)
            self.nameLabel.text = String(weatherOneList.name)
        } _: { (error) in
            print(error + "one")
        }


        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherFive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let weatherDay = weatherFive[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as! DayTableViewCell
        cell.configure(weatherDay: weatherDay)
        return cell
    }

}
