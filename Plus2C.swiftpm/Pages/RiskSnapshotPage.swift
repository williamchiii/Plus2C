import SwiftUI

struct RiskSnapshotPage: View{
    @State private var selectedTimeFrame: TimeFrame = .current
    
    var body: some View{
        ZStack{
            GeometryReader{ geo in
                ScrollView{
                    VStack (spacing: 8){
                        Text("Risk Snapshot")
                    }
                    .padding(.horizontal)
                    TimeFrameSelector(selectedTimeFrame: $selectedTimeFrame)
                }
            }
        }
        .background(
            Image("stars")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

