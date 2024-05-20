//
//  ContentView.swift
//  HabitosSaudaveisPlusPlusCode
//
//  Created by Newton Cardoso da Rocha Neto on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var areaDaSaudeSelecionada: AreaDaSaude?
    @State var pergunta: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Área da Saúde")
                        .foregroundColor(Color("azulEscuro"))
                    
                    Menu {
                        Picker("Área da Saúde", selection: $areaDaSaudeSelecionada) {
                            ForEach(AreaDaSaude.allCases, id: \.self) { areaDaSaude in
                                Text(areaDaSaude.rawValue)
                                    .tag(areaDaSaude as AreaDaSaude?)
                            }
                        }
                        
                    } label: {
                        Text(areaDaSaudeSelecionada?.rawValue ?? "--")
                            .frame(maxHeight: 50)
                            .frame(maxWidth: 250)
                            .foregroundStyle(.azulEscuro)
                            .background(Color.branco)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    if pergunta {
                        // Aqui adiciona as perguntas (se tiver tiver mto espaço, vai alterando com o Spacer
                        VStack {
                            Text("Hello World!")
                        }
                    }
                    else {
                        // Aqui vai ser o espaço em branco
                        Spacer()
                    }
                    
                    if let areaDaSaudeSelecionada {
                        Button("ESCOLHER"){
                            self.pergunta.toggle()
                            print("picker: \(areaDaSaudeSelecionada)")
                        }
                        .frame(maxWidth: 120)
                        .frame(height: 50)
                        .background(.azulEscuro)
                        .foregroundStyle(Color("branco"))
                        .clipShape(.rect(cornerRadius: 10))
                        .bold()
                    }
                    else {
                        Button("ESCOLHER"){
                            print("picker: \(areaDaSaudeSelecionada?.rawValue ?? "jj")")
                        }
                        .frame(maxWidth: 120)
                        .frame(height: 50)
                        .background(.verde)
                        .foregroundStyle(Color("branco"))
                        .clipShape(.rect(cornerRadius: 10))
                        .bold()
                    }
                }
                .padding()
                .containerRelativeFrame(.vertical)
                
                
            }
            .frame(maxWidth: .infinity)
            .background(Color("amarelo"))
            .navigationTitle("Hábitos Saudáveis Plus +")
            .toolbarBackground(.azulEscuro, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}


