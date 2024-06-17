import Foundation
import SpriteKit

struct GameDataItem {
    let planes: [[PlaneData?]]
    let trainingItem: Bool
    let gridSize: Int
}

struct PlaneData {
    let planeRes: String
    let planeDirection: PlaneDirection
}

enum PlaneDirection: String {
    case left = "left"
    case top = "top"
    case bottom = "bottom"
    case right = "right"
}

let allGameDataItems = [
    GameDataItem(planes: [
        [nil, nil, nil, nil],
        [nil, PlaneData(planeRes: "plane_base", planeDirection: .left), PlaneData(planeRes: "plane_base", planeDirection: .top), nil],
        [nil, PlaneData(planeRes: "plane_base", planeDirection: .top), PlaneData(planeRes: "plane_base", planeDirection: .left), nil],
        [nil, nil, nil, nil]
    ], trainingItem: true, gridSize: 2),
    GameDataItem(planes: [
        [PlaneData(planeRes: "plane_base", planeDirection: .left), PlaneData(planeRes: "plane_base", planeDirection: .top), PlaneData(planeRes: "plane_base", planeDirection: .left), PlaneData(planeRes: "plane_base", planeDirection: .top)],
        [PlaneData(planeRes: "plane_base", planeDirection: .left), PlaneData(planeRes: "plane_base", planeDirection: .top), PlaneData(planeRes: "plane_base", planeDirection: .top), PlaneData(planeRes: "plane_base", planeDirection: .top)],
        [PlaneData(planeRes: "plane_base", planeDirection: .top), PlaneData(planeRes: "plane_base", planeDirection: .left), PlaneData(planeRes: "plane_base", planeDirection: .left), PlaneData(planeRes: "plane_base", planeDirection: .left)],
        [PlaneData(planeRes: "plane_base", planeDirection: .top), PlaneData(planeRes: "plane_base", planeDirection: .top), PlaneData(planeRes: "plane_base", planeDirection: .left), PlaneData(planeRes: "plane_base", planeDirection: .top)]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [PlaneData(planeRes: "plane_sec", planeDirection: .top), PlaneData(planeRes: "plane_sec", planeDirection: .top), PlaneData(planeRes: "plane_sec", planeDirection: .left), PlaneData(planeRes: "plane_sec", planeDirection: .top)],
        [PlaneData(planeRes: "plane_sec", planeDirection: .top), PlaneData(planeRes: "plane_sec", planeDirection: .left), PlaneData(planeRes: "plane_sec", planeDirection: .left), PlaneData(planeRes: "plane_sec", planeDirection: .top)],
        [PlaneData(planeRes: "plane_sec", planeDirection: .top), PlaneData(planeRes: "plane_sec", planeDirection: .top), PlaneData(planeRes: "plane_sec", planeDirection: .left), PlaneData(planeRes: "plane_sec", planeDirection: .left)],
        [PlaneData(planeRes: "plane_sec", planeDirection: .left), PlaneData(planeRes: "plane_sec", planeDirection: .left), PlaneData(planeRes: "plane_sec", planeDirection: .left), PlaneData(planeRes: "plane_sec", planeDirection: .right)]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [PlaneData(planeRes: "plane_tri", planeDirection: .top), PlaneData(planeRes: "plane_tri", planeDirection: .top), PlaneData(planeRes: "plane_tri", planeDirection: .top), PlaneData(planeRes: "plane_tri", planeDirection: .top)],
        [PlaneData(planeRes: "plane_tri", planeDirection: .top), PlaneData(planeRes: "plane_tri", planeDirection: .left), PlaneData(planeRes: "plane_tri", planeDirection: .left), PlaneData(planeRes: "plane_tri", planeDirection: .top)],
        [PlaneData(planeRes: "plane_tri", planeDirection: .left), PlaneData(planeRes: "plane_tri", planeDirection: .top), PlaneData(planeRes: "plane_tri", planeDirection: .left), PlaneData(planeRes: "plane_tri", planeDirection: .left)],
        [PlaneData(planeRes: "plane_tri", planeDirection: .left), PlaneData(planeRes: "plane_tri", planeDirection: .left), PlaneData(planeRes: "plane_tri", planeDirection: .right), PlaneData(planeRes: "plane_tri", planeDirection: .right)]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [PlaneData(planeRes: "plane_four", planeDirection: .top), PlaneData(planeRes: "plane_four", planeDirection: .top), PlaneData(planeRes: "plane_four", planeDirection: .top), PlaneData(planeRes: "plane_four", planeDirection: .top)],
        [PlaneData(planeRes: "plane_four", planeDirection: .top), PlaneData(planeRes: "plane_four", planeDirection: .left), PlaneData(planeRes: "plane_four", planeDirection: .left), PlaneData(planeRes: "plane_four", planeDirection: .top)],
        [PlaneData(planeRes: "plane_four", planeDirection: .left), PlaneData(planeRes: "plane_four", planeDirection: .top), PlaneData(planeRes: "plane_four", planeDirection: .left), PlaneData(planeRes: "plane_four", planeDirection: .left)],
        [PlaneData(planeRes: "plane_four", planeDirection: .left), PlaneData(planeRes: "plane_four", planeDirection: .left), PlaneData(planeRes: "plane_four", planeDirection: .right), PlaneData(planeRes: "plane_four", planeDirection: .right)]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [nil, PlaneData(planeRes: "plane_five", planeDirection: .top), PlaneData(planeRes: "plane_five", planeDirection: .top), nil],
        [PlaneData(planeRes: "plane_five", planeDirection: .top), PlaneData(planeRes: "plane_five", planeDirection: .left), PlaneData(planeRes: "plane_five", planeDirection: .left), PlaneData(planeRes: "plane_five", planeDirection: .top)],
        [PlaneData(planeRes: "plane_five", planeDirection: .left), PlaneData(planeRes: "plane_five", planeDirection: .top), PlaneData(planeRes: "plane_five", planeDirection: .top), PlaneData(planeRes: "plane_five", planeDirection: .right)],
        [nil, PlaneData(planeRes: "plane_five", planeDirection: .left), PlaneData(planeRes: "plane_five", planeDirection: .left), nil]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [nil, PlaneData(planeRes: "plane_six", planeDirection: .top), PlaneData(planeRes: "plane_six", planeDirection: .top), nil],
        [PlaneData(planeRes: "plane_six", planeDirection: .top), PlaneData(planeRes: "plane_six", planeDirection: .left), PlaneData(planeRes: "plane_six", planeDirection: .left), PlaneData(planeRes: "plane_six", planeDirection: .top)],
        [PlaneData(planeRes: "plane_six", planeDirection: .left), PlaneData(planeRes: "plane_six", planeDirection: .top), PlaneData(planeRes: "plane_six", planeDirection: .top), PlaneData(planeRes: "plane_six", planeDirection: .right)],
        [nil, PlaneData(planeRes: "plane_six", planeDirection: .left), PlaneData(planeRes: "plane_six", planeDirection: .left), nil]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [nil, PlaneData(planeRes: "plane_seven", planeDirection: .left), PlaneData(planeRes: "plane_seven", planeDirection: .top), nil],
        [PlaneData(planeRes: "plane_seven", planeDirection: .top), PlaneData(planeRes: "plane_seven", planeDirection: .left), PlaneData(planeRes: "plane_seven", planeDirection: .left), PlaneData(planeRes: "plane_seven", planeDirection: .right)],
        [PlaneData(planeRes: "plane_seven", planeDirection: .right), PlaneData(planeRes: "plane_seven", planeDirection: .top), PlaneData(planeRes: "plane_seven", planeDirection: .top), PlaneData(planeRes: "plane_seven", planeDirection: .left)],
        [nil, PlaneData(planeRes: "plane_seven", planeDirection: .left), PlaneData(planeRes: "plane_seven", planeDirection: .left), nil]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [nil, PlaneData(planeRes: "plane_eit", planeDirection: .left), PlaneData(planeRes: "plane_eit", planeDirection: .top), nil],
        [PlaneData(planeRes: "plane_eit", planeDirection: .top), PlaneData(planeRes: "plane_eit", planeDirection: .left), PlaneData(planeRes: "plane_eit", planeDirection: .left), PlaneData(planeRes: "plane_eit", planeDirection: .right)],
        [PlaneData(planeRes: "plane_eit", planeDirection: .right), PlaneData(planeRes: "plane_eit", planeDirection: .top), PlaneData(planeRes: "plane_eit", planeDirection: .top), PlaneData(planeRes: "plane_eit", planeDirection: .left)],
        [nil, PlaneData(planeRes: "plane_eit", planeDirection: .left), PlaneData(planeRes: "plane_eit", planeDirection: .left), nil]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [PlaneData(planeRes: "plane_nine", planeDirection: .left), PlaneData(planeRes: "plane_nine", planeDirection: .left), PlaneData(planeRes: "plane_nine", planeDirection: .top), nil],
        [PlaneData(planeRes: "plane_nine", planeDirection: .top), PlaneData(planeRes: "plane_nine", planeDirection: .left), PlaneData(planeRes: "plane_nine", planeDirection: .left), PlaneData(planeRes: "plane_nine", planeDirection: .right)],
        [PlaneData(planeRes: "plane_nine", planeDirection: .right), PlaneData(planeRes: "plane_nine", planeDirection: .top), PlaneData(planeRes: "plane_nine", planeDirection: .top), PlaneData(planeRes: "plane_nine", planeDirection: .left)],
        [nil, PlaneData(planeRes: "plane_nine", planeDirection: .left), PlaneData(planeRes: "plane_nine", planeDirection: .left), PlaneData(planeRes: "plane_nine", planeDirection: .right)]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [nil, PlaneData(planeRes: "plane_ten", planeDirection: .left), PlaneData(planeRes: "plane_ten", planeDirection: .top), nil],
        [PlaneData(planeRes: "plane_ten", planeDirection: .top), PlaneData(planeRes: "plane_ten", planeDirection: .left), PlaneData(planeRes: "plane_ten", planeDirection: .left), PlaneData(planeRes: "plane_ten", planeDirection: .right)],
        [PlaneData(planeRes: "plane_ten", planeDirection: .right), PlaneData(planeRes: "plane_ten", planeDirection: .top), PlaneData(planeRes: "plane_ten", planeDirection: .top), PlaneData(planeRes: "plane_ten", planeDirection: .left)],
        [nil, PlaneData(planeRes: "plane_ten", planeDirection: .left), PlaneData(planeRes: "plane_ten", planeDirection: .left), nil]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [nil, PlaneData(planeRes: "plane_elev", planeDirection: .top), PlaneData(planeRes: "plane_elev", planeDirection: .top), nil],
        [PlaneData(planeRes: "plane_elev", planeDirection: .top), PlaneData(planeRes: "plane_elev", planeDirection: .left), PlaneData(planeRes: "plane_elev", planeDirection: .left), PlaneData(planeRes: "plane_elev", planeDirection: .left)],
        [PlaneData(planeRes: "plane_elev", planeDirection: .left), PlaneData(planeRes: "plane_elev", planeDirection: .top), PlaneData(planeRes: "plane_elev", planeDirection: .top), PlaneData(planeRes: "plane_elev", planeDirection: .top)],
        [nil, PlaneData(planeRes: "plane_elev", planeDirection: .left), PlaneData(planeRes: "plane_elev", planeDirection: .left), nil]
    ], trainingItem: false, gridSize: 2),
    GameDataItem(planes: [
        [PlaneData(planeRes: "plane_twel", planeDirection: .left), PlaneData(planeRes: "plane_twel", planeDirection: .top), PlaneData(planeRes: "plane_twel", planeDirection: .top), PlaneData(planeRes: "plane_twel", planeDirection: .right)],
        [PlaneData(planeRes: "plane_twel", planeDirection: .top), PlaneData(planeRes: "plane_twel", planeDirection: .top), PlaneData(planeRes: "plane_twel", planeDirection: .left), PlaneData(planeRes: "plane_twel", planeDirection: .top)],
        [PlaneData(planeRes: "plane_twel", planeDirection: .top), PlaneData(planeRes: "plane_twel", planeDirection: .left), PlaneData(planeRes: "plane_twel", planeDirection: .top), PlaneData(planeRes: "plane_twel", planeDirection: .top)],
        [PlaneData(planeRes: "plane_twel", planeDirection: .top), PlaneData(planeRes: "plane_twel", planeDirection: .top), PlaneData(planeRes: "plane_twel", planeDirection: .top), PlaneData(planeRes: "plane_twel", planeDirection: .right)]
    ], trainingItem: false, gridSize: 2)
]

extension SKNode {
    func rotationAngle(for orientation: PlaneDirection) -> CGFloat {
        switch orientation {
        case .left:
            return CGFloat(CGFloat.pi / 2) // 90 градусов
        case .top:
            return CGFloat(0) // 0 градусов
        case .right:
            return CGFloat(-CGFloat.pi / 2) // -90 градусов
        case .bottom:
            return CGFloat(-CGFloat.pi) // 180 градусов
        }
    }
}
