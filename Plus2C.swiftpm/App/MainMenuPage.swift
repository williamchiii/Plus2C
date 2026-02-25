import SwiftUI

struct MainMenuPage: View {
    @State private var tempIncrease = 0.0
    
    var body: some View {
        NavigationStack{
            GeometryReader(){geometry in
                //if landscape
                let isLandscape = geometry.size.width > geometry.size.height
                let cardBottomPaddingRatio = isLandscape ? 18 : 7
                
                ZStack{
                    
                    GlobeView(tempIncrease: $tempIncrease, showStars: false, transparentBg: true, movable: false, textureSwap: false)
                        .ignoresSafeArea()
                        .overlay(
                                WarmingCircle(tempIncrease: $tempIncrease)
                            )
                        .padding(.top, 5)
                        .padding(.bottom, geometry.size.height/1.8)
                        

                    VStack{
                        Text("Explore Changes")
                            .font(Font.largeTitle.bold())
                            .foregroundStyle(.white)
                        Spacer()
                        
                        TempControlCard(tempIncrease: $tempIncrease)
                            
                        
                        ExploreCard(
                            systemImage: "water.waves",
                            title: "Sea Level Rise Explorer",
                            subtitle: "See the implications of sea level rise base on your selected temperature incease of \(tempIncrease)"
                        ){
                            SeaLevelPage(tempIncrease: $tempIncrease)
                        }
                        ExploreCard(
                            systemImage: "aqi.high",
                            title: "Risk Snapshot",
                            subtitle: "Explore current and future risk outlooks"
                        ){
                            RiskSnapshotPage()
                        }
                        ExploreCard(
                            systemImage: "checklist",
                            title: "Action Checklist",
                            subtitle: "Get started with your climate action plan"
                        ){
                            ActionChecklistPage()
                        }
                        ExploreCard(
                            systemImage: "timelapse",
                            title: "Time Machine",
                            subtitle: "See the Earth in the past and future"
                        ){
                            TimeMachineCard()
                        }
                        ExploreCard(
                            systemImage: "info.circle",
                            title: "+2°C",
                            subtitle: "Learn more about the critical +2°C threshold"
                        ){
                            Plus2cInfoPage()
                        }
                        
                        .padding(.bottom, geometry.size.height/CGFloat(cardBottomPaddingRatio))
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

