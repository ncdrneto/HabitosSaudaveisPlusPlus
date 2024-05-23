//
//  ContentView.swift
//  HabitosSaudaveisPlusPlusCode
//
//  Created by Newton Cardoso da Rocha Neto on 15/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var areaDaSaudeSelecionada: AreaDaSaude?
    @State var perguntasSaudeBucal: Bool = false
    @State var perguntasSaudeFio: Bool = false
    @State var escovaDentes: EscovarDentes?
    @State var fioDental: EscovarDentes?
    @State var cliquei: Bool = false
    @State var calculado: Bool = false
    @State var result: Double = 0.0
    
    var cor: Color {
        if areaDaSaudeSelecionada != .saudeBucal && areaDaSaudeSelecionada != .saudeDoCoracao {
            .verde
        } else if (escovaDentes == nil || fioDental == nil) && nomeBotao == "CALCULAR" {
            .verde
        }
        else {
            .azulEscuro
        }
    }
    
    var nomeBotao: String {
        if cliquei != true{
            "ESCOLHER"
        }
        else {
            "CALCULAR"
        }
    }
    
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
                        Text(areaDaSaudeSelecionada?.rawValue ?? "Selecione")
                            .frame(maxHeight: 50)
                            .frame(maxWidth: 250)
                            .foregroundStyle(.azulEscuro)
                            .background(Color.branco)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    if perguntasSaudeBucal {
                        
                        Text("1 - Quantas vezes você escova os dentes por dia?")
                        
                        Menu {
                            Picker("Escovar Dentes", selection: $escovaDentes) {
                                ForEach(EscovarDentes.allCases, id: \.self) { escovaDentes in
                                    Text(escovaDentes.rawValue)
                                        .tag(escovaDentes as EscovarDentes?)
                                }
                            }
                        } label: {
                            Text(escovaDentes?.rawValue ?? "Selecione")
                                .frame(maxHeight: 50)
                                .frame(maxWidth: 250)
                                .foregroundStyle(.azulEscuro)
                                .background(Color.branco)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Text("2 - Quantas vezes você usa o fio dental por dia?")
                        
                        Menu {
                            Picker("Fio Dental", selection: $fioDental) {
                                ForEach(EscovarDentes.allCases, id: \.self) { fioDental in
                                    Text(fioDental.rawValue)
                                        .tag(fioDental as EscovarDentes?)
                                }
                            }
                        } label: {
                            Text(fioDental?.rawValue ?? "Selecione")
                                .frame(maxHeight: 50)
                                .frame(maxWidth: 250)
                                .foregroundStyle(.azulEscuro)
                                .background(Color.branco)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Spacer()
                        
                    }
                    
                    if perguntasSaudeFio {
                        
                        Text("1 - Quantas dias por semana você se exercita?")
                        
                        Menu {
                            Picker("Escovar Dentes", selection: $escovaDentes) {
                                ForEach(EscovarDentes.allCases, id: \.self) { escovaDentes in
                                    Text(escovaDentes.rawValue)
                                        .tag(escovaDentes as EscovarDentes?)
                                }
                            }
                        } label: {
                            Text(escovaDentes?.rawValue ?? "Selecione")
                                .frame(maxHeight: 50)
                                .frame(maxWidth: 250)
                                .foregroundStyle(.azulEscuro)
                                .background(Color.branco)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                    }
                    
                    Spacer()
                    
                    Button(nomeBotao){
                        if areaDaSaudeSelecionada == .saudeBucal {
                            perguntasBucal()
                            cliquei = true
                        }
                        if areaDaSaudeSelecionada == .saudeDoCoracao {
                            perguntaFio()
                            cliquei = true
                        }
                        if areaDaSaudeSelecionada == .saudeBucal && escovaDentes?.rawValue != nil && fioDental != nil{
                            result = calcularPreco(resposta1: Double(escovaDentes!.rawValue)!, resposta2: Double(fioDental!.rawValue)!)
                            calculado = true
                            
                        }
                    }
                    .frame(maxWidth: 120)
                    .frame(height: 50)
                    .background(cor)
                    .foregroundStyle(.branco)
                    .clipShape(.rect(cornerRadius: 10))
                    .bold()
                }
                .padding()
                .containerRelativeFrame(.vertical)
            }
            .alert("\(mensagemFinal(resultado: result))", isPresented: $calculado, actions: {
                Button("OK", role: .cancel, action: {})
            })
            .frame(maxWidth: .infinity)
            .background(Color("amarelo"))
            .navigationTitle("Hábitos Saudáveis Plus +")
            .toolbarBackground(.azulEscuro, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
    }
}

extension ContentView {
    
    func perguntasBucal() {
        perguntasSaudeBucal = true
    }
    
    func perguntaFio() {
        perguntasSaudeFio = true
    }
    
    func mensagemFinal(resultado: Double) -> String {
        if resultado > 1500 {
            return "Tua boca tá podre! \n Deve tá cheia de cárie e tártaro! \n Vai ter que gastar: \n R$ \(resultado.rounded())"
        } else if resultado <= 1500 && resultado >= 900 {
            return "Tá precisando cuidar melhor dessa dentadura, hein! \n Vai ter que gastar: \n R$\(resultado.rounded())"
        }
        else {
            return "Continue assim! Só precisa fazer uma limpeza anualmente! \n Vai ter que gastar: \n R$\(resultado.rounded())"
        }
    }
    
    func calcularPreco(resposta1: Double, resposta2: Double) -> Double {
        let result: Double
        
        if resposta1 == 0 && resposta2 == 0{
            result = 278.14 * 5 + 139.07 * 5
        }
        else if resposta1 == 0 && resposta2 >= 1 {
            result = 278.14 * 5 + 139.07 * (4 / resposta2)
        }
        else if resposta1 >= 1 && resposta2 == 0 {
            result = 278.14 * (4 / resposta1) + 139.07 * 5
        }
        else {
            result = 278.14 * (3 / resposta1) + 139.07 * (3 / resposta2)
        }
         
        return result
    }
    
}

#Preview {
    ContentView()
}

