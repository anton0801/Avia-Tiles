import Foundation

class UserViewModel: ObservableObject {
    
    @Published var coins: Int = 0 {
        didSet {
            saveCoins()
        }
    }
    
    init() {
        coins = 50000 // UserDefaults.standard.integer(forKey: "coins_for_game")
    }
    
    private func saveCoins() {
        UserDefaults.standard.set(coins, forKey: "coins_for_game")
    }
    
}
