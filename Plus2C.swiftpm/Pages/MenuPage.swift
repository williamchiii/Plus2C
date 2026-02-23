import SwiftUI

struct MenuPage: View {
    var body: some View {
        NavigationStack{
            GeometryReader(){geometry in
                ZStack{
                    GlobeView()
                        .ignoresSafeArea()
                    VStack{
                        Text("Explore Changes")
                            .font(Font.largeTitle.bold())
                            .foregroundStyle(.white)
                        Spacer()
                        ExploreCard(
                            systemImage: "water.waves",
                            title: "Sea Level Rise Explorer",
                            subtitle: "See the effects of global warming on our planet"
                        ){
                            TopographicEarthPage()
                        }
                        ExploreCard(
                            systemImage: "person.fill",
                            title: "Connect with others",
                            subtitle: "Find people with similar interests to you."
                        ){
                            SeaLevelPage()
                        }
                    }
                }

            }
        }
        
    }
}

