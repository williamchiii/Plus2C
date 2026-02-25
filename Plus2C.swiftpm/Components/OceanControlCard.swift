import SwiftUI

struct OceanControlCard: View {
    @Binding var floodValue: Double
    @State private var isEditing = false
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "water.waves.and.arrow.trianglehead.up")
                    .foregroundStyle(Color(.white))
                    .font(Font.title2)
                    
                Text("Flood Simulator")
                    .foregroundStyle(Color(.white))
                    .font(Font.title2)
            }
            .padding(.top, 20)
            Slider(
                    value: $floodValue,
                    in: 0...80,
                    step: 20
                ) {
                } minimumValueLabel: {
                    Text("0 m")
                        .foregroundStyle(Color(.white))
                        .padding(.horizontal, 15)
                } maximumValueLabel: {
                    Text("80 m")
                        .foregroundStyle(Color(.white))
                        .padding(.horizontal, 15)
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                .tint(.blue)
                Text("+\(Int(floodValue)) m")
                .foregroundColor(.white)
                .font(.title2.bold())
                .padding(.bottom, 20)
        }
        .background(
            ZStack{
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.ultraThinMaterial)
                //inner glow
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [.blue.opacity(0.10), .clear], startPoint: .top, endPoint: .bottom
                        )
                    )
            }
        )
        .shadow(color: .blue.opacity(0.5), radius: 25, x: 0, y: 5)
        .frame(width: 700)
    }

}
