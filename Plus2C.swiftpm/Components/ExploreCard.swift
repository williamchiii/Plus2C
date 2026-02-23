import SwiftUI

struct ExploreCard<Destination: View>: View {
    let systemImage:String
    let title:String
    let subtitle:String
    @ViewBuilder let destination: () -> Destination
    
    var body: some View {
        NavigationLink(destination: destination()){
            //HStack spacing controlsspacing between the Icon and Text VStack
            GeometryReader{geometry in
                HStack(spacing: 20) {
                    Image(systemName: systemImage)
                        .font(.title3)
                        .foregroundStyle(Color(.black))
                        .frame(width: 30, height: 30)
                    //VStack alignment leading left and spacing tight
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title)
                            .font(.headline)
                            .foregroundStyle(Color(.black))
                        if #available(iOS 17.0, *){
                            Text(subtitle)
                                .font(.caption)
                                .foregroundStyle(Color(.black.opacity(0.6)))
                        } else{
                            Text(subtitle)
                                .font(.caption)
                                .foregroundStyle(Color(.black))
                        }
                        
                        
                    }
                    Spacer()
                    //right chevron
                    if #available(iOS 17.0, *) {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color(.black.opacity(0.6)))
                    } else {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(Color(.black))
                    }
                        
                }
                
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(.white.opacity(0.9), in:
                            RoundedRectangle(cornerRadius: 20))
            .frame(width: 700, height: 60)

        }
        .buttonStyle(.plain)
    }
}
