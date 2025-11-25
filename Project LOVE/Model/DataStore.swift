//
//  DataSource.swift
//  Project LOVE
//
//  Created by SDC-USER on 24/11/25.
//
import Foundation

class DataStore {
    private var activities : [Activity] = []
    
    init() {
        loadSampleData()
    }
    func loadSampleData() {
        var sampleActivities: [Activity] = [
            Activity(name: "Chill & Glow Sesh", description: "Facemasks, candles, chill beats — just cozy vibes and glow time ", image: "Activityimage", time: "5 mins"),
            Activity(name: "Petal Hunt", description: "Pick pretty blooms and build your own bouquet together.", image: "Activityimage", time: "5 mins"),
            Activity(name: "Wholesome Craft Challenge", description: "Make a doodle / note / digital collage for her", image: "Activityimage", time: "5 mins"),
            Activity(name: "Memory Lane Marathon", description: "Make a mini reel using your photos and favorite audio", image: "Activityimage", time: "5 mins"),
            Activity(name: "Stuff-A-Memory Day", description: "Buy a tine plush, both name it and take care of it together", image: "Activityimage", time: "5 mins"),
            Activity(name: "Memory Lane Marathon", description: "Make a mini reel using your photos and favorite audio", image: "Activityimage", time: "5 mins"),
            Activity(name: "Memory Lane Marathon", description: "Make a mini reel using your photos and favorite audio", image: "Activityimage", time: "5 mins"),
            Activity(name: "Stuff-A-Memory Day", description: "Buy a tine plush, both name it and take care of it together", image: "Activityimage", time: "5 mins"),
            Activity(name: "Memory Lane Marathon", description: "Make a mini reel using your photos and favorite audio", image: "Activityimage", time: "5 mins")]
        
        self.activities = sampleActivities
    }
    func getActivities() -> [Activity] {
        return activities
    }
    
    
}
var dataStore = DataStore()
