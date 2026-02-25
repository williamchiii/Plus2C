import SwiftUI

enum TimeFrame: String, CaseIterable{
    case year1900 = "1900"
    case current = "Current"
    case year2050 = "2050"
    case year2100 = "2100"
}

struct TimeFrameSelector: View{
    @Binding var selectedTimeFrame: TimeFrame
    
    var body: some View {
        HStack{
            ForEach(TimeFrame.allCases, id: \.self){ timeframe in
                Button(action: {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                        selectedTimeFrame = timeframe
                    }
                }) {
                    Text(timeframe.rawValue)
                        .font(.subheadline.bold())
                        .foregroundStyle(selectedTimeFrame == timeframe ? .black: .white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedTimeFrame == timeframe ? .white: .white.opacity(0.2))
                        )
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(.ultraThinMaterial.opacity(0.5))
        )
    }
}
