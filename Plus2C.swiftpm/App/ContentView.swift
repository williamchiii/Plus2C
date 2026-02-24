import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                GlobeView()
                    .ignoresSafeArea()
                VStack {
                    Text("+2°C")
                        .font(Font.largeTitle.bold())
                        .foregroundStyle(.white)
                        .padding(.top, 80)
                    Text("Explore how small shifts reshape our planet.")
                        .font(Font.headline)
                        .foregroundStyle(.white)
                    Spacer()
                    HStack{
                        NavigationLink(destination: MenuPage()){
                            Text("Begin Exploring")
                        }
                        .font(.headline)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 14)
                        .background(.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .padding(.bottom, 100)
                        
                    }
                }
            }
            
            .background(Color.black)
        }
    }
}
