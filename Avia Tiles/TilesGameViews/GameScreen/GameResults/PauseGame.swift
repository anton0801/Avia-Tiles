import SwiftUI

struct PauseGame: View {
    
    @Environment(\.presentationMode) var backMode
    @EnvironmentObject var userViewModel: UserViewModel
    
    var resumeAction: (Bool, Bool) -> Void
    var restartAction: (Bool, Bool) -> Void
    
    @State var isMusicOnState = UserDefaults.standard.bool(forKey: "isOnMusic") {
        didSet {
            UserDefaults.standard.set(isMusicOnState, forKey: "isOnMusic")
        }
    }
    @State var isSoundsOnState = UserDefaults.standard.bool(forKey: "isOnSound") {
        didSet {
            UserDefaults.standard.set(isSoundsOnState, forKey: "isOnSound")
        }
    }
    
    var body: some View {
        VStack {
            HStack {
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
            
            Spacer()
            
            Text("PAUSE")
                .font(.custom("Souses", size: 24))
                .foregroundColor(.white)
            
            Spacer()
            
            HStack {
                Image("music_label")
                    .resizable()
                    .frame(width: 200, height: 70)
                
                Spacer()
                
                ZStack {
                    Image("toggle_background")
                        .resizable()
                        .frame(width: 90, height: 60)
                    Toggle(isOn: $isMusicOnState) {
                        EmptyView()
                    }
                    .onChange(of: isMusicOnState) { value in
                        isMusicOnState = value
                    }
                    .offset(x: -20)
                }
                .frame(width: 90, height: 60)
            }
            .frame(width: 250)
            
            HStack {
                Image("sound_label")
                    .resizable()
                    .frame(width: 200, height: 70)
                
                Spacer()
                
                ZStack {
                    Image("toggle_background")
                        .resizable()
                        .frame(width: 90, height: 60)
                    Toggle(isOn: $isSoundsOnState) {
                        EmptyView()
                    }
                    .onChange(of: isSoundsOnState) { value in
                        isSoundsOnState = value
                    }
                    .offset(x: -20)
                }
                .frame(width: 90, height: 60)
            }
            .frame(width: 250)
            
            Spacer()
            
            Button {
                resumeAction(isMusicOnState, isSoundsOnState)
            } label: {
               Image("resume_button")
                   .resizable()
                   .frame(width: 220, height: 90)
            }
            Button {
               restartAction(isMusicOnState, isSoundsOnState)
            } label: {
               Image("restart_button")
                   .resizable()
                   .frame(width: 220, height: 90)
            }
            Button {
               backMode.wrappedValue.dismiss()
            } label: {
               Image("go_to_menu_button")
                   .resizable()
                   .frame(width: 220, height: 90)
            }
            .padding(.top)
        }
        .background(
            Image("game_screen_bg")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    PauseGame(resumeAction: { _, _ in }, restartAction: { _, _ in })
        .environmentObject(UserViewModel())
}
