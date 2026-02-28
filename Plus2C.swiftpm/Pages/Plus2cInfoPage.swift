import SwiftUI

struct Plus2cInfoPage: View{
    var body: some View{
        ScrollView{
            GeometryReader {geo in
                VStack{
                    VStack{
                        Image(systemName: "thermometer.variable.badge.clock")
                            .foregroundStyle(.red)
                            .font(.largeTitle)
                        Text("+2°C")
                            .foregroundStyle(.white)
                            .font(.largeTitle.bold())
                        Text("The critical threshold")
                            .foregroundStyle(.white)
                            .font(.headline)
                    }
                    .padding(.top, 20)
                        
                    VStack{
                        HStack{
                            Image(systemName: "exclamationmark.bubble.fill")
                                .foregroundStyle(.orange)
                                .font(.title2)
                            Text("Why 2°C Matters")
                                .foregroundStyle(.black)
                                .font(.title2.bold())
                            Spacer()
                        }
                        .padding(.horizontal,30)
                        .padding(.top, 25)
                        .padding(.bottom, 10)
                        Text("+2°C of global warming matters because it causes major changes to the planet, even though the number sounds small. It is a global average, which means many places warm much more than 2 degrees. At this level, heatwaves become stronger and more frequent, sea levels rise faster from melting ice, and ecosystems like coral reefs are severely damaged. Food and water supplies also become less stable. Overall, +2°C increases the risk of long-term and possibly irreversible climate damage that affects millions of people around the world.")
                            .foregroundStyle(.black)
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.horizontal, 30)
                            .padding(.bottom, 30)
                        
                    }
                    .frame(width: geo.size.width/1.3)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.white.opacity(0.9))
                    )
                    VStack{
                        HStack{
                            Image(systemName: "globe.europe.africa.fill")
                                .foregroundStyle(.blue)
                                .font(.title2)
                            Text("Key Thresholds")
                                .foregroundStyle(.black)
                                .font(.title2.bold())
                            
                            Spacer()
                                
                        }
                        .padding()
                        tempCard(
                            color: Color(red: 0.95, green: 0.5, blue: 0.0),   // darker orange (less yellow)
                            title: "+1.3°C",
                            description: "Today",
                            isCurrent: true,
                            theWidth: geo.size.width/1.4
                        )

                        tempCard(
                            color: Color(red: 0.95, green: 0.3, blue: 0.0),   // burnt orange
                            title: "+1.5°C",
                            description: "Paris Agreement Lower Target",
                            isCurrent: false,
                            theWidth: geo.size.width/1.4
                        )

                        tempCard(
                            color: Color(red: 0.8, green: 0.1, blue: 0.05),   // strong red-orange
                            title: "‼️ +2.0°C",
                            description: "Irreversible damage",
                            isCurrent: false,
                            theWidth: geo.size.width/1.4
                        )

                        tempCard(
                            color: Color(red: 0.5, green: 0.0, blue: 0.0),    // deep red
                            title: "+3.0°C",
                            description: "Catastrophic",
                            isCurrent: false,
                            theWidth: geo.size.width/1.4
                        )                    }
                    .padding(.horizontal)
                    .padding(.top, 15)
                    .padding(.bottom, 30)
                    .frame(width: geo.size.width/1.3)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.white.opacity(0.9))
                    )

                }
                
                .frame(width: geo.size.width, alignment: .center)
            }
        }
        .background(
            Image("stars")
                .ignoresSafeArea()
        )
         
    }
}

struct tempCard: View{
    let color: Color
    let title: String
    let description: String
    let isCurrent: Bool
    let theWidth: CGFloat
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(title)
                    .foregroundStyle(color)
                    .font(.headline)
                Text(description)
                    .font(.caption)
                    .foregroundStyle(.black.opacity(0.7))
            }
            .padding()
            Spacer()
            if isCurrent{
                Text("We are here")
                    .foregroundStyle(.white)
                    .padding(8)
                    .font(.caption)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(color)
                    )
                    .padding()
                
            }
        }
        .frame(width: CGFloat(theWidth))
        .background(
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(color.opacity(0.15))
        )
    
    }
}

#Preview {
    Plus2cInfoPage()
}
