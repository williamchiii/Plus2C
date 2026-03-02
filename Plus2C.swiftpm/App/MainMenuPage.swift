import SwiftUI

struct MainMenuPage: View {
    @State private var tempIncrease = 0.0
    @Binding var floodValue: Double
    
    init(floodValue: Binding<Double> = .constant(0.0)) {
            self._floodValue = floodValue
        }
    
    var body: some View {
        NavigationStack{
            GeometryReader(){geometry in
                //if landscape
                let isLandscape = geometry.size.width > geometry.size.height
                let cardBottomPaddingRatio = isLandscape ? 18 : 7
                
                ZStack{
                    
                    GlobeView(tempIncrease: $tempIncrease, floodValue: $floodValue, showStars: false, transparentBg: true, movable: false, textureSwap: false)
                        .ignoresSafeArea()
                        .overlay(
                                WarmingCircle(tempIncrease: $tempIncrease)
                            )
                        .padding(.top, 5)
                        .padding(.bottom, geometry.size.height/1.8)
                        

                    VStack(spacing: 0) {
                        Text("Explore Changes")
                            .font(Font.largeTitle.bold())
                            .foregroundStyle(.white)
                            .padding(.top, 8)
                            .padding(.bottom, 8)
                        
                        ScrollView {
                            VStack(spacing:5) {
                                Spacer()
                                    .frame(height: geometry.size.height * 0.35)
                                TempControlCard(tempIncrease: $tempIncrease)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 15)
                                    
                                ExploreCard(
                                    systemImage: "water.waves",
                                    title: "Sea Level Rise Explorer",
                                    subtitle: "See the implications of sea level rise based on temperature and explore the flood simulator"
                                ){
                                    SeaLevelPage(tempIncrease: $tempIncrease, floodValue: floodValue)
                                }
                                .padding(.horizontal, 30)
                                
                                ExploreCard(
                                    systemImage: "aqi.high",
                                    title: "Risk Snapshot",
                                    subtitle: "Explore past, current and future risk outlooks"
                                ){
                                    RiskSnapshotPage()
                                }
                                .padding(.horizontal, 30)
                                
                                ExploreCard(
                                    systemImage: "checklist",
                                    title: "Action Checklist",
                                    subtitle: "Get started with your climate action plan"
                                ){
                                    ActionChecklistPage()
                                }
                                .padding(.horizontal, 30)
                                
                                /*implement in future
                                ExploreCard(
                                    systemImage: "timelapse",
                                    title: "Time Machine",
                                    subtitle: "See how we got here and what the future holds"
                                ){
                                    Plus2cInfoPage()
                                }
                                 */
                                ExploreCard(
                                    systemImage: "info.circle",
                                    title: "+2°C",
                                    subtitle: "Learn more about the critical +2°C threshold"
                                ){
                                    Plus2cInfoPage()
                                }
                                .padding(.horizontal, 30)
                                
                                .padding(.bottom, geometry.size.height/CGFloat(cardBottomPaddingRatio))
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                }

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

#Preview {
    NavigationStack{
        MainMenuPage()
    }
}
