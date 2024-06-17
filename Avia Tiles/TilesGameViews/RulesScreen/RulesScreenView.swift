import SwiftUI

struct RulesScreenView: View {
    
    @Environment(\.presentationMode) var backPosibility
    @EnvironmentObject var userViewModel: UserViewModel
    
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
            
            VStack {
                Text("Find the same puzzles so that they match, and don't try to lose. To win, you need to align the planes. Buy lives to have a better chance of winning")
                    .font(.custom("Souses", size: 24))
                    .foregroundColor(.white)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(.black)
            )
            .padding()
            
            Spacer()
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
    RulesScreenView()
        .environmentObject(UserViewModel())
}
