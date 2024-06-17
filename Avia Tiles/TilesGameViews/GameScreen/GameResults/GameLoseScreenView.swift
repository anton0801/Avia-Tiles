import SwiftUI

struct GameLoseScreenView: View {
    
    @Environment(\.presentationMode) var backMode
    @EnvironmentObject var userViewModel: UserViewModel
    
    var restartAction: () -> Void
    
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
            
            Button {
                restartAction()
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
            Image("game_result_lose_bg")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .ignoresSafeArea()
        )
    }
}

#Preview {
    GameLoseScreenView(restartAction: { })
        .environmentObject(UserViewModel())
}
