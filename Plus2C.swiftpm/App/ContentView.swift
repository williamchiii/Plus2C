import SwiftUI

struct ContentView: View {
    @Binding var tempIncrease: Double
    @Binding var floodValue: Double
    init(tempIncrease: Binding<Double> = .constant(0.0), floodValue: Binding<Double> = .constant(0.0)) {
            self._tempIncrease = tempIncrease
            self._floodValue = floodValue
        }
    var body: some View {
        NavigationStack{
            ZStack {
                GlobeView(tempIncrease: $tempIncrease, floodValue: $floodValue)
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
                        NavigationLink(destination: MainMenuPage(floodValue: $floodValue)){
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
