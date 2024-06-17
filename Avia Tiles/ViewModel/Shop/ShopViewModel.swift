import Foundation

class ShopViewModel: ObservableObject {
    
    @Published var errorInBuyingLives: Bool = false
    
    func buyLives(storeItem: StoreItem, userViewModel: UserViewModel) {
        if userViewModel.coins >= storeItem.price {
            let currentMissionLives = UserDefaults.standard.integer(forKey: "missions_lives")
            UserDefaults.standard.set(currentMissionLives + storeItem.lives, forKey: "missions_lives")
            if currentMissionLives >= 10 {
                if !UserDefaults.standard.bool(forKey: "mission_1_completed") {
                    UserDefaults.standard.set(true, forKey: "mission_1_completed")
                    UtilFuncs.sendUserNotification(title: "Mission completed", subtitle: "Buy 10 lives mission completed")
                }
            }
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "lives_count") + storeItem.price, forKey: "lives_count")
            setUpErrorInBuyError(value: false)
            userViewModel.coins -= storeItem.price
            return
        }
        setUpErrorInBuyError(value: true)
    }
    
    func setUpErrorInBuyError(value: Bool) {
        errorInBuyingLives = value
    }
    
}
