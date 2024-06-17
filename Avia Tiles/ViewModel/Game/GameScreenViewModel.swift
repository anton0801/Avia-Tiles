import Foundation

class GameScreenViewModel: ObservableObject {
    
    @Published var activeView: ActiveGameView = .game
    
}


enum ActiveGameView {
    case game, win, lose, pause
}
