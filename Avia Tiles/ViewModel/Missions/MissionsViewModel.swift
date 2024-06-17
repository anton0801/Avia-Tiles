import Foundation

class MissionsViewModel: ObservableObject {
    
    @Published var missions = [MissionsItem]()
    
    init() {
        updateMissions()
    }
    
    private func updateMissions() {
        missions = getMissionsItem()
    }
    
    private func getMissionsItem() -> [MissionsItem] {
        return [
            MissionsItem(id: "mission_1", mission: "Buy 10 lives", completed: UserDefaults.standard.bool(forKey: "mission_1_completed")),
            MissionsItem(id: "mission_2", mission: "Complete half levels", completed: UserDefaults.standard.bool(forKey: "mission_2_completed")),
            MissionsItem(id: "mission_3", mission: "Complete all levels", completed: UserDefaults.standard.bool(forKey: "mission_3_completed")),
            MissionsItem(id: "mission_4", mission: "Сomplete the training", completed: UserDefaults.standard.bool(forKey: "mission_4_completed")),
            MissionsItem(id: "mission_5", mission: "Pass in 7 seconds", completed: UserDefaults.standard.bool(forKey: "mission_5_completed"))
        ]
    }
    
}
