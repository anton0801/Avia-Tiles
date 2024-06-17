import Foundation
import SwiftUI
import SpriteKit

let winGameNotificationName = Notification.Name("WIN_GAME_MATCHES")
let lossGameNotificationName = Notification.Name("LOSE_GAME_MATCHES")
let pauseGameNotificationName = Notification.Name("PAUSE_GAME_MATCHES")

class GameScreenScene: SKScene {
    
    private var gameDataItem: GameDataItem
    private var gameDataItemInt: Int
    
    private var gameField: [[PlaneDirection?]] = []
    
    var isMusicOn = UserDefaults.standard.bool(forKey: "isOnMusic") {
        didSet {
            if isMusicOn {
                startPlayingBackMusic()
            } else {
                gameBackground.removeAllChildren()
            }
        }
    }
    var isSoundsOn = UserDefaults.standard.bool(forKey: "isOnSound")
    
    init(gameDataItem: Int) {
        self.gameDataItem = allGameDataItems[gameDataItem]
        self.gameDataItemInt = gameDataItem
        livesCount = UserDefaults.standard.integer(forKey: "lives_count")
        coins = UserDefaults.standard.integer(forKey: "coins_for_game")
        super.init(size: CGSize(width: 750, height: 1335))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var gameBackground: SKSpriteNode!
    private var pause: SKSpriteNode!
    
    private var livesLabel: SKLabelNode!
    private var coinsLabel: SKLabelNode!
    
    private var tutorTextOne: SKLabelNode!
    private var tutorTextTwo: SKLabelNode!
    private var arrowOne: SKSpriteNode!
    private var arrowTwo: SKSpriteNode!
    
    private var livesCount: Int {
        didSet {
            livesLabel.text = "\(livesCount)"
            UserDefaults.standard.set(livesCount, forKey: "lives_count")
            if livesCount <= 0 {
                NotificationCenter.default.post(name: lossGameNotificationName, object: nil)
            }
        }
    }
    
    private var coins: Int {
        didSet {
            coinsLabel.text = "\(coins)"
            UserDefaults.standard.set(coins, forKey: "coins_for_game")
        }
    }
    
    private func startPlayingBackMusic() {
        if isMusicOn {
            let audioNode = SKAudioNode(fileNamed: "music")
            gameBackground.addChild(audioNode)
        }
    }
    
    override func didMove(to view: SKView) {
        gameBackground = .init(imageNamed: "game_screen_bg")
        gameBackground.size = size
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)
        startPlayingBackMusic()
        
        createHeader()
        createGameContent()
        
        if gameDataItem.trainingItem {
            createTutorRules()
        }
    }
    
    func restartGame() -> GameScreenScene {
        let newGameScreen = GameScreenScene(gameDataItem: self.gameDataItemInt)
        view?.presentScene(newGameScreen)
        return newGameScreen
    }
    
    func restartGame(gameDataItem: Int) -> GameScreenScene {
        let newGameScreen = GameScreenScene(gameDataItem: gameDataItem)
        view?.presentScene(newGameScreen)
        return newGameScreen
    }
    
    private func createTutorRules() {
        tutorTextOne = .init(text: "Click on this plane to win")
        tutorTextOne.fontName = "Souses"
        tutorTextOne.fontSize = 48
        tutorTextOne.fontColor = .white
        tutorTextOne.position = CGPoint(x: size.width / 2, y: size.height - 450)
        addChild(tutorTextOne)
        
        arrowOne = .init(imageNamed: "arrow_down")
        arrowOne.position = CGPoint(x: size.width / 2 - 50, y: size.height - 530)
        addChild(arrowOne)
        
        tutorTextTwo = .init(text: "To win, you need to align the planes")
        tutorTextTwo.fontName = "Souses"
        tutorTextTwo.fontSize = 38
        tutorTextTwo.fontColor = .white
        tutorTextTwo.position = CGPoint(x: size.width / 2, y: 150)
        addChild(tutorTextTwo)
        
        arrowTwo = .init(imageNamed: "arrow_up")
        arrowTwo.position = CGPoint(x: size.width / 2 + 80, y: 400)
        addChild(arrowTwo)
        
        let actionMoveUp = SKAction.move(to: CGPoint(x: arrowOne.position.x, y: size.height - 500), duration: 0.5)
        let actionMoveDown = SKAction.move(to: CGPoint(x: arrowOne.position.x, y: size.height - 550), duration: 0.5)
        let sequence = SKAction.sequence([actionMoveUp, actionMoveDown])
        let repeateForever = SKAction.repeatForever(sequence)
        arrowOne.run(repeateForever)
        
        let actionMoveUp2 = SKAction.move(to: CGPoint(x: arrowTwo.position.x, y: 400 + 30), duration: 0.5)
        let actionMoveDown2 = SKAction.move(to: CGPoint(x: arrowTwo.position.x, y: 400 - 30), duration: 0.5)
        let sequence2 = SKAction.sequence([actionMoveUp2, actionMoveDown2])
        let repeateForever2 = SKAction.repeatForever(sequence2)
        arrowTwo.run(repeateForever2)
    }
    
    private func createHeader() {
        pause = .init(imageNamed: "pause")
        pause.position = CGPoint(x: 60, y: size.height - 120)
        addChild(pause)
        
        let livesCountBackogrund: SKSpriteNode = .init(imageNamed: "coins_bg")
        livesCountBackogrund.position = CGPoint(x: 280, y: size.height - 120)
        livesCountBackogrund.size = CGSize(width: 180, height: pause.size.height)
        addChild(livesCountBackogrund)
        
        let livesIcon: SKSpriteNode = .init(imageNamed: "lives")
        livesIcon.position = CGPoint(x: 170, y: size.height - 120)
        livesIcon.size = CGSize(width: 70, height: 70)
        addChild(livesIcon)
        
        livesLabel = .init(text: "\(livesCount)")
        livesLabel.fontName = "Souses"
        livesLabel.fontSize = 24
        livesLabel.fontColor = .white
        livesLabel.position = CGPoint(x: 320, y: size.height - 128)
        addChild(livesLabel)
        
        let coinsCountBackogrund: SKSpriteNode = .init(imageNamed: "coins_bg")
        coinsCountBackogrund.position = CGPoint(x: 600, y: size.height - 120)
        coinsCountBackogrund.size = CGSize(width: 180, height: pause.size.height)
        addChild(coinsCountBackogrund)
        
        let coinsIcon: SKSpriteNode = .init(imageNamed: "coin")
        coinsIcon.position = CGPoint(x: 500, y: size.height - 120)
        coinsIcon.size = CGSize(width: 70, height: 70)
        addChild(coinsIcon)
        
        coinsLabel = .init(text: "\(coins)")
        coinsLabel.fontName = "Souses"
        coinsLabel.fontSize = 24
        coinsLabel.fontColor = .white
        coinsLabel.position = CGPoint(x: 630, y: size.height - 128)
        addChild(coinsLabel)
    }
    
    private func createGameContent() {
        for (yIndex, planesInRow) in gameDataItem.planes.enumerated() {
            var rowPlanesData: [PlaneDirection?] = []
            for (xIndex, plane) in planesInRow.enumerated() {
                if plane != nil {
                    let pointForPlane = positionForNode(xIndex: xIndex, yIndex: yIndex, gridSize: gameDataItem.gridSize, nodeSize: CGSize(width: 100, height: 100), spacing: 24)
                    let planeNode: SKSpriteNode = .init(imageNamed: plane!.planeRes)
                    planeNode.size = CGSize(width: 100, height: 100)
                    planeNode.position = pointForPlane
                    planeNode.zRotation = planeNode.rotationAngle(for: plane!.planeDirection)
                    planeNode.name = "plane_\(xIndex)_\(yIndex)"
                    addChild(planeNode)
                }
                rowPlanesData.append(plane?.planeDirection)
            }
            gameField.append(rowPlanesData)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let nodesAtLocation = nodes(at: location)
            
            checkForPlanesInNodes(nodes: nodesAtLocation)
            
            if nodesAtLocation.contains(pause) {
                NotificationCenter.default.post(name: pauseGameNotificationName, object: nil)
            }
        }
    }
    
    private func checkForPlanesInNodes(nodes: [SKNode]) {
        for node in nodes {
            if node.name?.contains("plane") == true {
                rotatePlane(plane: node)
                if isSoundsOn {
                    let action = SKAction.playSoundFileNamed("click_sound", waitForCompletion: false)
                    run(action)
                }
            }
        }
    }
    
    private func rotatePlane(plane: SKNode) {
        let components = plane.name!.components(separatedBy: "_")
        let xIndex = Int(components[1])!
        let yIndex = Int(components[2])!
        let currentRotationDirection = gameField[yIndex][xIndex]!
        let nextRotationDirection = getNextRotationDirection(current: currentRotationDirection)
        let action = SKAction.rotate(toAngle: plane.rotationAngle(for: nextRotationDirection), duration: 0.5)
        plane.run(action) {
            self.gameField[yIndex][xIndex] = nextRotationDirection
            self.checkGameFieldResults()
        }
        if currentRotationDirection == .top {
            livesCount -= 1
        }
    }
    
    private func getNextRotationDirection(current: PlaneDirection) -> PlaneDirection {
        let allPlaneDirections: [PlaneDirection] = [.left, .top, .right, .bottom]
        let currentIndex = allPlaneDirections.firstIndex(of: current) ?? 0
        if currentIndex + 1 > allPlaneDirections.count - 1 {
            return allPlaneDirections[0]
        }
        return allPlaneDirections[currentIndex + 1]
    }
    
    private func checkGameFieldResults() {
        for gameFieldItems in gameField {
            for planeDirection in gameFieldItems {
                if planeDirection != nil {
                    if planeDirection != .top {
                        return
                    }
                }
            }
        }
        if gameDataItem.trainingItem {
            UserDefaults.standard.set(true, forKey: "mission_4_completed")
            UtilFuncs.sendUserNotification(title: "Mission completed", subtitle: "Training mission completed")
        }
        NotificationCenter.default.post(name: winGameNotificationName, object: nil)
    }
    
}

#Preview {
    VStack {
        SpriteView(scene: GameScreenScene(gameDataItem: 0))
            .ignoresSafeArea()
    }
}


extension SKScene {
    func positionForNode(xIndex: Int, yIndex: Int, gridSize: Int, nodeSize: CGSize, spacing: CGFloat) -> CGPoint {
        // Вычисляем количество строк и столбцов
        let rows = gridSize
        let columns = gridSize
        
        // Вычисляем размеры сетки с учетом отступов
        let totalWidth = CGFloat(columns) * nodeSize.width + CGFloat(columns - 1) * spacing
        let totalHeight = CGFloat(rows) * nodeSize.height + CGFloat(rows - 1) * spacing
        
        // Вычисляем центр сцены
        let centerX = self.size.width / 2 - 100
        let centerY = self.size.height / 2 + 50
        
        // Вычисляем начальную точку (верхний левый угол)
        let startX = centerX - totalWidth / 2 + nodeSize.width / 2
        let startY = centerY + totalHeight / 2 - nodeSize.height / 2
        
        // Вычисляем координаты для элемента с учетом отступов
        let x = startX + CGFloat(xIndex) * (nodeSize.width + spacing)
        let y = startY - CGFloat(yIndex) * (nodeSize.height + spacing)
        
        return CGPoint(x: x, y: y)
    }
}
