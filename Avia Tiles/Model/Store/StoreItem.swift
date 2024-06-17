import Foundation

struct StoreItem: Identifiable {
    let id: String
    var lives: Int
    let price: Int
}

var storeItems = [
    StoreItem(id: "lives_1", lives: 1, price: 2000),
    StoreItem(id: "lives_2", lives: 2, price: 3000),
    StoreItem(id: "lives_3", lives: 3, price: 4000),
    StoreItem(id: "lives_4", lives: 4, price: 5000)
]
