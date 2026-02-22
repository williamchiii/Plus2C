import SwiftUI

//This is just an example preview so far, not implemented fully yet.
struct TopographicEarthPage: View{
    var body: some View{
        ZStack{
            GlobeView(isTopographic: true)
                .ignoresSafeArea()
            VStack{
                Text("Explore Earth's Topography")
                    .font(Font.largeTitle.bold())
                    .foregroundStyle(.white)
                    .padding(.top, 80)
                Text("Whiter: higher elevation")
                    .font(Font.subheadline)
                    .foregroundStyle(.white)
                Spacer()
            }
            
        }
        
    }
}
