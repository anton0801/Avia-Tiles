import SwiftUI

struct ShopScreenView: View {
    
    @Environment(\.presentationMode) var backPosibility
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var shopViewModel: ShopViewModel = ShopViewModel()
    
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
                    ForEach(storeItems, id: \.id) { storeItem in
                        StoreItemView(storeItem: storeItem) {
                            shopViewModel.buyLives(storeItem: storeItem, userViewModel: userViewModel)
                        }
                    }
                }
            }
            
            if shopViewModel.errorInBuyingLives {
                Text("Not enought credits for buy this item!")
                    .font(.custom("Souses", size: 24))
                    .foregroundColor(.red)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            shopViewModel.setUpErrorInBuyError(value: false)
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

struct StoreItemView: View {
    
    var storeItem: StoreItem
    var buyLivesAction: () -> Void
    
    var body: some View {
        HStack {
            ZStack {
                Image("field_bg")
                    .resizable()
                    .frame(width: 140, height: 80)
                Text("\(storeItem.lives) LIVES")
                    .font(.custom("Souses", size: 18))
                    .foregroundColor(.white)
            }
            ZStack {
                Image("btn_bg")
                    .resizable()
                    .frame(width: 100, height: 80)
                Button {
                    buyLivesAction()
                } label: {
                    Text("\(storeItem.price)")
                        .font(.custom("Souses", size: 18))
                        .foregroundColor(.white)
                }
            }
        }
    }
}

#Preview {
    ShopScreenView()
        .environmentObject(UserViewModel())
}
