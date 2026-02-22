import SwiftUI

struct SeaLevelPage: View {
    @State private var sliderValue = 0.0
    @State private var isEditing = false
    
    var body: some View{
        ZStack{
            GlobeView()
                .ignoresSafeArea()
            GeometryReader{ geometry in
                VStack{
                    Text("Welcome to the second screen")
                        .font(Font.largeTitle.bold())
                        .foregroundStyle(Color.white)
                        .padding(.top, geometry.size.height * 0.05)
                    Spacer()
                    Slider(
                        value: $sliderValue,
                        in: 0...2,
                       
                        onEditingChanged: { editing in
                            isEditing = editing
                        }
                    )
                    .frame(width: geometry.size.width * 0.7)
                    
                    Text("Global Temperature Increase: \(sliderValue.formatted(.number.precision(.fractionLength(2))))°C")
                                .foregroundColor(isEditing ? .blue : .white)
                                .padding(.bottom, 70)
                                
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
        }
        
        .background(Color.black)
    }
        
}
