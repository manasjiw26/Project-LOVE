//
//  DataSource.swift
//  Project LOVE
//
//  Created by SDC-USER on 24/11/25.
//
import Foundation

class DataStore {
     var activities : [Activity] = []
    
    init() {
        loadSampleData()
        loadSampleRewards()
    }
    func loadSampleData() {
        var sampleActivities: [Activity] = [
            Activity(name: "Chill & Glow Sesh", description: "Facemasks, candles, chill beats — just cozy vibes and glow time ", image: "", time: "5 mins"),
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
    
     var rewards: [Reward] = []
    
    func loadSampleRewards() {
        var sampleRewards: [Reward] = [
            Reward(image: "Send_Hug", name: "Send hug"),
            Reward(image: "Send_Flower", name: "Send flower"),
            Reward(image: "Send_Kiss", name: "Send kiss"),
            Reward(image: "Send_Heart", name: "Send heart"),
            Reward(image: "Send_Note", name: "Send note"),
            Reward(image: "Send_Wave", name: "Send wave"),
            Reward(image: "Send_Hug", name: "Send high five")
        ]
        self.rewards = sampleRewards
    }
}
let dataStore = DataStore()
    func getActivities() -> [Activity] {
        return activities
    }
    
    
}
var dataStore = DataStore()
