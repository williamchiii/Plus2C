import SwiftUI

struct OceanControlCard: View {
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        VStack{
            Text("In the VStack")
                .foregroundStyle(Color(.white))
                .font(Font.headline)
            HStack{
                Text("In the HStack")
                    .foregroundStyle(Color(.white))
                    .font(Font.headline)
            }
            Slider(
                    value: $speed,
                    in: 0...100,
                    step: 5
                ) {
                    Text("Speed")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("100")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
                Text("\(speed)")
                    .foregroundColor(isEditing ? .red : .blue)
            Text("Rise Amount")
                .foregroundStyle(Color(.white))
                .font(Font.headline)
        }
    }

}
