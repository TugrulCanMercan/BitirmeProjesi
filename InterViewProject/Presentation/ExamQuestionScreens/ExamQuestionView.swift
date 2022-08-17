//
//  ExamQuestionView.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 26.04.2022.
//

import SwiftUI
import TTComponents


extension UnitPoint{
    static var randomlyAnchor:Self{
        let point:[UnitPoint] = [.topLeading,.bottomTrailing,.topTrailing,.bottomLeading]
        let a = point.index(point.startIndex, offsetBy: Int.random(in: point.indices))
        return point[a]
    }
    
}

struct CornerRotateModifier:ViewModifier{
    let amount:Double
    let anchor:UnitPoint
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount),anchor: anchor)
            .clipped()
    }
}
extension AnyTransition{
    static var pivot:Self{
        .modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

enum Selection {
    case showExamQuestion
    case showAddQuestionDetail
    case showExamDetail
}



struct ExamQuestionView: View {
    
    @State var showPopUp:Bool = false
    @State var show = false
    @State var showAddQuestionDetail = false
    @State var selection:Selection = .showExamQuestion
    @StateObject var vm = AddQuestionViewModel()
    @StateObject var exmVm = ExamQuestionViewModel()
    @Namespace var animation
    
    var body: some View {
        TTView(content: {
            
            switch selection {
            case .showExamQuestion:
                CustomNavView {
                    VStack {

                        HStack{
                            Text("POPULER TEKNOLOJİLER")
                                .font(.caption)
                                .bold()
                            Spacer()
                        }
                        .padding(8)
                        .frame(maxWidth:.infinity)

                        GeometryReader { proxy in
                            ScrollView (.horizontal){

                                LazyHStack {
                                    ForEach(1...4,id:\.self) { _ in
                                        PopulerTechCell(proxy: proxy)
                                    }
                                }
                            }
                        }

                        .frame(maxWidth:.infinity)
                        .frame(maxHeight:UIScreen.main.bounds.height / 4)

                        VStack(spacing:20){

                            CustomNavLink(destination:   TakingTheExam()) {
                                addButtonView(title: "SINAVA GİT")
                            }



                            addButtonView(title: "SINAV OLUŞTUR")
                                .onTapGesture {
                                    withAnimation {
                                        selection = .showExamDetail
                                    }
                                    
                                }

                        }
                        .frame(height: 200)
                        .frame(maxHeight:.infinity)
                        .padding()
                    }
                    .matchedGeometryEffect(id: "animation", in: animation)
                    .customNavBarItems(title: "Soru ve Sınav", subtitle: "", backButtonHidden: true, color: .cyan, rightItemShow: false) {
                        VStack{

                        }
                    }
                }
            case .showAddQuestionDetail:
                AddQuestionDetailView(examOrQuestion: true, currentShowedView: $selection, VM: vm)
                

                    .matchedGeometryEffect(id: "animation", in: animation)
            case .showExamDetail:
                ExamAddDetail(currentShowedView: $selection, VM: exmVm)
                    .matchedGeometryEffect(id: "animation", in: animation)
            }
            
        }, popUpContent: {
            VStack {
                
            }
        }, showActivate: $showPopUp)
        
    }
    
    func addButtonView(title:String) -> some View {
        RoundedRectangle(cornerRadius: 10)
            .strokeBorder(lineWidth: 5, antialiased: true)
            .foregroundColor(.cyan)
            .overlay {
                ZStack{
                    
                    HStack{
                        Text(title)
                            .font(.title)
                        
                        Image(systemName: "plus")
                            .padding(8)
                            .background(Circle().stroke())
                    }
                }
            }
    }
    
    
}

struct ExamQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        ExamQuestionView()
            
    }
}




struct PopulerTechCell: View {
    @State var proxy:GeometryProxy
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 4)
            
                .foregroundStyle(.linearGradient(colors: [.cyan,.purple,.yellow], startPoint: .randomlyAnchor, endPoint: .randomlyAnchor))
                .padding(.vertical,4)
                .padding(.horizontal,4)
                .frame(width: proxy.size.width/1.25 - 15, height: proxy.size.height, alignment: .top)
                .background {
                    ZStack{
                        VStack (alignment:.leading){
                            Text("REDİS")
                            Spacer()
                        }
                        .padding()
                    }
                    
                }
            
        }
    }
}
