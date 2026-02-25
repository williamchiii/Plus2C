import SwiftUI

enum Mode{
    case temp
    case seaLevel
}

struct ModeSelector: View {
    @Binding var selectedMode: Mode
    var body: some View {
        VStack{
            Text(verbatim: "Mode: \(selectedMode)")
                .foregroundStyle(Color.white)
            HStack{
                Button("Temperature (C)"){
                    selectedMode = .temp
                }
                Button("Sea Level (meters)"){
                    selectedMode = .seaLevel
                }
            }
        }
    }
}
