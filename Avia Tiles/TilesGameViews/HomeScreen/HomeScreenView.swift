import SwiftUI

struct HomeScreenView: View {
    
    @StateObject var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
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
                HStack {
                    Spacer()
                    Image("menu_pers")
                        .resizable()
                        .frame(width: 350, height: 250)
                }
                
                NavigationLink(destination: EmptyView()) {
                    Image("play_button")
                        .resizable()
                        .frame(width: 200, height: 80)
                }
                
                NavigationLink(destination: ShopScreenView()
                    .environmentObject(userViewModel)
                    .navigationBarBackButtonHidden(true)) {
                    Image("shop_button")
                        .resizable()
                        .frame(width: 200, height: 80)
                }
                
                NavigationLink(destination: SettingsScreenView()
                    .environmentObject(userViewModel)
                    .navigationBarBackButtonHidden(true)) {
                    Image("settings_button")
                        .resizable()
                        .frame(width: 200, height: 80)
                }
                
                NavigationLink(destination: MissionsScreenView()
                    .navigationBarBackButtonHidden(true)
                    .environmentObject(userViewModel)) {
                    Image("missions_button")
                        .resizable()
                        .frame(width: 200, height: 80)
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
}

#Preview {
    HomeScreenView()
}
