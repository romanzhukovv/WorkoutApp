//
//  Resources.swift
//  WorkoutApp
//
//  Created by Roman Zhukov on 19.10.2022.
//

import UIKit

enum Resources {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        
        static let separator = UIColor(hexString: "#E8ECEF")
    }
    
    enum Strings {
        enum TabBar {
            static let overview = "Overview"
            static let session = "Session"
            static let progress = "Progress"
            static let settings = "Settings"
        }
    }
    
    enum Images {
        enum TabBar {
            static let overview = UIImage(systemName: "house")
            static let session = UIImage(systemName: "alarm")
            static let progress = UIImage(systemName: "chart.bar.fill")
            static let settings = UIImage(systemName: "gearshape")
        }
    }
}
