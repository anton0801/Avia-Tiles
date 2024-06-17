import SwiftUI

struct SettingsScreenView: View {
    
    @StateObject private var settingsViewModel: SettingsViewModel = SettingsViewModel()
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var backPosibility
    
    @State var isMusicOnState = false
    @State var isSoundsOnState = false
    
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
            
            Spacer()
            
            HStack {
                Image("music_label")
                    .resizable()
                    .frame(width: 230, height: 60)
                
                Spacer()
                
                ZStack {
                    Image("toggle_background")
                        .resizable()
                        .frame(width: 90, height: 60)
                    Toggle(isOn: $isMusicOnState) {
                        EmptyView()
                    }
                    .onChange(of: isMusicOnState) { value in
                        settingsViewModel.isOnMusic = value
                    }
                    .offset(x: -20)
                }
                .frame(width: 90, height: 60)
            }
            .frame(width: 350)
            
            HStack {
                Image("sound_label")
                    .resizable()
                    .frame(width: 230, height: 60)
                
                Spacer()
                
                ZStack {
                    Image("toggle_background")
                        .resizable()
                        .frame(width: 90, height: 60)
                    Toggle(isOn: $isSoundsOnState) {
                        EmptyView()
                    }
                    .onChange(of: isSoundsOnState) { value in
                        settingsViewModel.isOnSound = value
                    }
                    .offset(x: -20)
                }
                .frame(width: 90, height: 60)
            }
            .frame(width: 350)
            
            Spacer()
            
            NavigationLink(destination: RulesScreenView()
                .environmentObject(userViewModel)
                .navigationBarBackButtonHidden(true)) {
                    Image("rules_button")
                        .resizable()
                        .frame(width: 150, height: 80)
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

#Preview {
    SettingsScreenView()
        .environmentObject(UserViewModel())
}
