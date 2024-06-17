import SwiftUI

struct MissionsScreenView: View {
    
    @Environment(\.presentationMode) var backPosibility
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var missionsViewModel: MissionsViewModel = MissionsViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    backPosibility.wrappedValue.dismiss()
                } label: {
                    Image("close_button")
                        .resizable()
                        .frame(width: 42, height: 42)
                }
                Spacer()
                ZStack {
                    Image("coins_bg")
                        .resizable()
                        .frame(width: 150, height: 40)
                    Text("\(userViewModel.coins)")
                        .font(.custom("Souses", size: 24))
                        .offset(x: 20)
                        .foregroundColor(.white)
                    Image("coin")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .offset(x: -60)
                }
            }
            .padding()
            
            ScrollView {
                VStack {
                    ForEach(missionsViewModel.missions, id: \.id) { mission in
                        MissionItem(missionItem: mission)
                    }
                }
            }
            
        }
        .background(
            Image("menu_screen")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        )
    }
}

struct MissionItem: View {
    
    var missionItem: MissionsItem
    
    var body: some View {
        HStack {
            ZStack {
                Image("field_bg")
                    .resizable()
                    .frame(width: 240, height: 80)
                Text(missionItem.mission)
                    .font(.custom("Souses", size: 18))
                    .foregroundColor(.white)
            }
            ZStack {
                Image("btn_bg")
                    .resizable()
                    .frame(width: 120, height: 80)
                if missionItem.completed {
                    Text("Completed")
                        .font(.custom("Souses", size: 18))
                        .foregroundColor(.white)
                } else {
                    Text("Not\ncompleted")
                        .font(.custom("Souses", size: 16))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
            }
        }
    }
    
}

#Preview {
    MissionsScreenView()
        .environmentObject(UserViewModel())
}
