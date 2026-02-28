import SwiftUI

struct SeaLevelPage: View {
    @Binding var tempIncrease: Double
    @State var floodValue: Double
    @State private var selectedMode: Mode = .seaLevel
    
    var body: some View{
       ZStack{
            GeometryReader{ screen in
                if selectedMode == .temp{
                    GlobeView(tempIncrease: $tempIncrease, floodValue: $floodValue, showStars: false, transparentBg: true, textureSwap: true)
                        .ignoresSafeArea()
                        .padding(.bottom, screen.size.height / 7)
                }
                else{ //sea level mode
                    GlobeView(tempIncrease: $tempIncrease, floodValue: $floodValue, showStars: false, transparentBg: true, textureSwap: true, floodSim: true)
                        .ignoresSafeArea()
                        .padding(.bottom, screen.size.height / 7)
                }
                VStack{
                    Text("Sea Level Rise Visualizer")
                        .font(Font.largeTitle.bold())
                        .foregroundStyle(Color.white)
                    Text("Explore the effects in real-time")
                        .font(.headline)
                        .foregroundStyle(.white.opacity(0.9))
                        .fontWeight(.medium)
                    Spacer()
                    ModeSelector(selectedMode: $selectedMode)
                        .padding(.bottom, 10)
                    if selectedMode == .temp{
                        TempControlCard(tempIncrease: $tempIncrease)
                            .frame(width: screen.size.width*0.85)
                            .padding(.bottom, screen.size.height / 11)
                    }
                    else{
                        OceanControlCard(floodValue: $floodValue)
                            .frame(width: screen.size.width * 0.85)
                            .padding(.bottom, screen.size.height / 12)
                    }
                    
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
