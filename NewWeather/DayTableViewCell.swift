//
//  DayTableViewCell.swift
//  NewWeather
//
//  Created by Nurzhan Ababakirov on 13/3/21.
//

import UIKit

class DayTableViewCell: UITableViewCell {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(weatherDay: List){
        tempLabel.text = String(weatherDay.main.temp)
        humidityLabel.text = String(weatherDay.main.humidity    )
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
