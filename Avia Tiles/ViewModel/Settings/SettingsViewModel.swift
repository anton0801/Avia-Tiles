import Foundation

class SettingsViewModel: ObservableObject {
    
    @Published var isOnMusic = false {
        didSet {
            UserDefaults.standard.set(isOnMusic, forKey: "isOnMusic")
        }
    }
    
    @Published var isOnSound = false {
        didSet {
            UserDefaults.standard.set(isOnSound, forKey: "isOnSound")
        }
    }
    
    init() {
        isOnMusic = UserDefaults.standard.bool(forKey: "isOnMusic")
        isOnSound = UserDefaults.standard.bool(forKey: "isOnSound")
    }
    
}
