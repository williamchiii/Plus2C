import SwiftUI

struct ContentView: View {
    @Binding var tempIncrease: Double
    @Binding var floodValue: Double
    @State private var isPressed = false
    
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
                        .foregroundStyle(.white.opacity(0.9))
                        .fontWeight(.medium)
                    Spacer()
                    HStack{
                        NavigationLink(destination: MainMenuPage(floodValue: $floodValue)){
                            Text("Begin Exploring")
                        }
                        .font(.headline)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 14)
                        .background(.white.opacity(isPressed ? 0.8 : 1.0))
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                        .scaleEffect(isPressed ? 0.95 : 1.0)
                        .animation(.easeInOut(duration: 0.2), value: isPressed)
                        .padding(.bottom, 100)
                        .simultaneousGesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { _ in
                                    isPressed = true
                                }
                                .onEnded { _ in
                                    isPressed = false
                                }
                        )
                        
                    }
                }
            }
            
            .background(Color.black)
        }
    }
}
