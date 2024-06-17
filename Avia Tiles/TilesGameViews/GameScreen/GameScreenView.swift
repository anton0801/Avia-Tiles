import SwiftUI
import SpriteKit

struct GameScreenView: View {
    
    @State private var gameScreenScene: GameScreenScene!
    @State var gameDataItem: Int?
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @StateObject private var vm = GameScreenViewModel()
    
    var body: some View {
        ZStack {
            if gameScreenScene != nil {
                SpriteView(scene: gameScreenScene)
                    .ignoresSafeArea()
            }
            
            switch (vm.activeView) {
            case .game:
                EmptyView()
            case .win:
                GameWinScreenView(nextLevelAction: {
                    gameDataItem = getGameDataItem()
                    gameScreenScene = gameScreenScene.restartGame(gameDataItem: gameDataItem!)
                    withAnimation(.easeInOut) {
                        vm.activeView = .game
                    }
                }, restartAction: {
                    gameScreenScene = gameScreenScene.restartGame()
                    withAnimation(.easeInOut) {
                        vm.activeView = .game
                    }
                })
                .environmentObject(userViewModel)
            case .lose:
                GameLoseScreenView(restartAction: {
                    gameScreenScene = gameScreenScene.restartGame()
                    withAnimation(.easeInOut) {
                        vm.activeView = .game
                    }
                })
                .environmentObject(userViewModel)
            case .pause:
                PauseGame { isMusicOne, isSoundsOn in
                    gameScreenScene.isMusicOn = isMusicOne
                    gameScreenScene.isSoundsOn = isSoundsOn
                    withAnimation(.easeInOut) {
                        vm.activeView = .game
                    }
                } restartAction: { isMusicOne, isSoundsOn in
                    gameScreenScene = gameScreenScene.restartGame()
                    gameScreenScene.isMusicOn = isMusicOne
                    gameScreenScene.isSoundsOn = isSoundsOn
                    withAnimation(.easeInOut) {
                        vm.activeView = .game
                    }
                }
                .environmentObject(userViewModel)

            }
        }
        .onAppear {
            if gameDataItem == nil {
                gameDataItem = getGameDataItem()
            }
            gameScreenScene = GameScreenScene(gameDataItem: gameDataItem!)
        }
        .onReceive(NotificationCenter.default.publisher(for: pauseGameNotificationName)) { _ in
            withAnimation(.easeInOut) {
                vm.activeView = .pause
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: winGameNotificationName)) { _ in
            if gameDataItem == 0 {
                UserDefaults.standard.set(true, forKey: "is_training_passed")
            }
            UserDefaults.standard.set(UserDefaults.standard.integer(forKey: "passed_levels") + 1, forKey: "passed_levels")
            if UserDefaults.standard.integer(forKey: "passed_levels") == 6 {
                UserDefaults.standard.set(true, forKey: "mission_2_completed")
                UtilFuncs.sendUserNotification(title: "Mission completed", subtitle: "Half levels passed")
            }
            if UserDefaults.standard.integer(forKey: "passed_levels") == 12 {
                UserDefaults.standard.set(true, forKey: "mission_3_completed")
                UtilFuncs.sendUserNotification(title: "Mission completed", subtitle: "All levels passed. But don't feel bad, you can go through them again and we'll be adding more new ones soon")
            }
            userViewModel.coins += 1000
            withAnimation(.easeInOut) {
                vm.activeView = .win
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: lossGameNotificationName)) { _ in
            withAnimation(.easeInOut) {
                vm.activeView = .lose
            }
        }
    }
    
    private func getGameDataItem() -> Int {
        let isTrainingPassed = UserDefaults.standard.bool(forKey: "is_training_passed")
        if !isTrainingPassed {
            return 0
        }
        let allGameDataItemsWithoutTraining = allGameDataItems.filter { !$0.trainingItem }
        return Int.random(in: 0..<allGameDataItemsWithoutTraining.count) + 1
    }
    
}

#Preview {
    GameScreenView()
        .environmentObject(UserViewModel())
}
