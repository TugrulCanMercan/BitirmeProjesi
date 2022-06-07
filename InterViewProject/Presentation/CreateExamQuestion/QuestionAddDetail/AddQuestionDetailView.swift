//
//  AddQuestionDetail.swift
//  InterViewProject
//
//  Created by Tuğrul Can MERCAN (Dijital Kanallar Uygulama Geliştirme Müdürlüğü) on 28.04.2022.
//

import SwiftUI
import TTComponents




enum QuestionOptions:Hashable{
    
    case options(Int)
    
    
    var result:String{
        switch self {
        case .options(let count):
            switch count{
            case 0: return "A"
            case 1: return "B"
            case 2: return "C"
            case 3: return "D"
            case 4: return "E"
            default:
                return "Hatalı"
            }
        }
    }
    
}




struct AddQuestionDetailView: View {
    
    @Binding var currentShowedView:Selection
    
    
    
    @ObservedObject var VM: AddQuestionViewModel
    @State private var offset = CGFloat.zero
    
    @State private var titleOffset = CGFloat.zero
    @State var examOrQuestion :Bool
    
    init(examOrQuestion :Bool,
         currentShowedView:Binding<Selection>,
         VM: AddQuestionViewModel
         
         
         
    ){
        self.examOrQuestion = examOrQuestion
        self._currentShowedView = currentShowedView
        self._VM = .init(wrappedValue: VM)
    }
    var body: some View {
        
        
        ZStack{
            QuestionView(questionContent: $VM.ttQuestion.questionContent)
                .environmentObject(VM)
            
            if VM.showPicker{
                picker()
            }
        }
        .background(Color(UIColor.systemGray6))
        
    }
    
    func picker() -> some View {
        TTPicker(backGroundColor: .secondary, content: {
            ForEach(VM.ttQuestion.category,id:\.self) { itm in
                Text(itm)
            }
        }, select: $VM.ttQuestion.selectedPicker)
        .onTapGesture {
            withAnimation {
                VM.showPicker.toggle()
            }
        }
    }
    
    
    
    
    
    
}

struct AddQuestionDetail_Previews: PreviewProvider {
    static var previews: some View {
        AddQuestionDetailView(examOrQuestion: false, currentShowedView: .constant(.showAddQuestionDetail), VM: AddQuestionViewModel())
        
    }
}

struct CategorySection: View {
    
    @Binding var showPicker:Bool
    let selectedPickerName:String
    
    var body: some View {
        Section {
            Button {
                withAnimation {
                    showPicker.toggle()
                }
            } label: {
                Text(selectedPickerName.isEmpty ? "Kategori" : selectedPickerName)
                    .foregroundColor(.black)
            }
            
        }
    }
}






struct QuestionContentSection: View {
    @Binding var questionContent:String
    @EnvironmentObject var VM:AddQuestionViewModel
    var body: some View {
        Section {
            TextEditor(text: $VM.ttQuestion.questionContent)
                .onChange(of: questionContent, perform: { newValue in
                    VM.ttQuestion.questionContent = newValue
                })
            
        } header: {
            
            Text("Soru İçeriği")
                .font(.callout)
        }
    }
}

struct QuestionSelectionSection: View {
    @EnvironmentObject var VM:AddQuestionViewModel
    var body: some View {
        Section{
            
            questionList()
            
            
        } header: {
            Text("Şıklar")
                .font(.callout)
            
            Button {
                if VM.ttQuestion.quesitons.count < 5 {
                    VM.questions.append("")
                }
            } label: {
                HStack{
                    Text("Ekle")
                    Image(systemName: "plus")
                } .frame(maxWidth: .infinity,alignment: .trailing)
                
            }
        }
    }
    
    @ViewBuilder
    func questionList() -> some View{
        
        ForEach(VM.questions.indices,id:\.self) { val in
            if (val <= 4) {
                VStack{
                    HStack{
                        Text("\(QuestionOptions.options(val).result)) Şıkkı")
                            .foregroundColor(VM.ttQuestion.questionAnswer == QuestionOptions.options(val).result ? .blue : .black)
                            .onTapGesture {
                                VM.ttQuestion.questionAnswer = QuestionOptions.options(val).result
                            }
                        
                        TextEditor(text:  $VM.questions[val])
                    }
                }
            }
        }
        .onDelete(perform: delete)

        
        
    }
    // BU VİEW MODELDE OLACAK
    func delete(at offsets: IndexSet) {
        VM.questions.remove(atOffsets: offsets)
    }
}

struct QuestionView: View {
    @EnvironmentObject var VM:AddQuestionViewModel
    @Binding var questionContent:String
    
    @State var showImagePicker:Bool = false
    var body: some View {
        VStack{
            
            
            
            List{
                
                CategorySection(showPicker: $VM.showPicker, selectedPickerName: VM.ttQuestion.selectedPicker)
                
                Section {
                    
                    VStack {
                        if let image = VM.image {
                            Image(uiImage: image)
                                .resizable()
                                .frame(maxHeight: 250)
                        }else {
                            Button {
                                showImagePicker.toggle()
                            } label: {
                                Text("resimleri göster")
                            }
                        }

                    }
                   
                    
                } header: {
                    Text("Resim Ekle")
                }

                
                QuestionContentSection(questionContent: $questionContent)
                
                QuestionSelectionSection()
                
            }
            .fullScreenCover(isPresented: $showImagePicker, onDismiss: nil, content: {
                TTImagePicker(image: $VM.image)
            })
            
            
        }
    }
}
