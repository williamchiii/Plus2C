import SwiftUI

struct SeaLevelPage: View {
    @Binding var tempIncrease: Double
    
    var body: some View{
        ZStack{
            GeometryReader{ screen in
                GlobeView(showStars: false, transparentBg: true)
                    .ignoresSafeArea()
                    .padding(.bottom, screen.size.height / 7)
        
                VStack{
                    Text("Sea Level Rise Visualizer")
                        .font(Font.largeTitle.bold())
                        .foregroundStyle(Color.white)
                    Text("Explore the effects in real-time")
                        .foregroundStyle(.white)
                        .font(.headline)
                    Spacer()
                    TempControlCard(tempIncrease: $tempIncrease)
                        .padding(.bottom, screen.size.height / 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
        }
        .background(
                Image("stars")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
    }
        
}
