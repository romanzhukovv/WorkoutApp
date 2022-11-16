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
        
        static let background = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let titleGray = UIColor(hexString: "#545C77")
        
    }
    
    enum Strings {
        enum TabBar {
            static let overview = "Overview"
            static let session = "Session"
            static let progress = "Progress"
            static let settings = "Settings"
        }
        
        enum NavBar {
            static let overview = "Overview"
            static let session = "High Intensity Cardio"
            static let progress = "Workout Progress"
            static let settings = "Settings"
        }
        
        enum Session {
            static let navBarStart = "Start"
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
        }
        
        enum Overview {
            static let allWorkoutsButton = "All Workouts"
        }
    }
    
    enum Images {
        enum TabBar {
            static let overview = UIImage(systemName: "house")
            static let session = UIImage(systemName: "alarm")
            static let progress = UIImage(systemName: "chart.bar.fill")
            static let settings = UIImage(systemName: "gearshape")
        }
        
        enum Common {
            static let allWorkoutsButton = UIImage(systemName: "chevron.down")
            static let addButton = UIImage(named: "addButton")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    
}
