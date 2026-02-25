import SwiftUI

enum Mode{
    case temp
    case seaLevel
}

struct ModeSelector: View {
    @Binding var selectedMode: Mode
    @State private var selected = "Temperature"
    let options = ["Temperature (C)", "Sea Level (Meters)"]
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)){
                        selectedMode = .temp
                    }
                }) {
                    Text("Temperature (C)")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding(10)
                        .background(
                            Group{
                                if selectedMode == .temp{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.clear)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                                        )
                                }
                            }
                        )
                }
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)){
                        selectedMode = .seaLevel
                    }
                }) {
                    Text("Sea Level (Meters)")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding(10)
                        .background(
                            Group{
                                if selectedMode == .seaLevel{
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(Color.clear)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(Color.white.opacity(0.3), lineWidth: 1.5)
                                        )
                                }
                            }

                        )
                }
            }
            .padding(6)
            .background(.ultraThinMaterial)
            .clipShape(Capsule())
        }
    }
}
