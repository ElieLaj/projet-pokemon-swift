import SwiftUI
import Combine

class PokemonViewModel: ObservableObject {
    @Published var pokemon: Pokemon?
    private var cancellable: AnyCancellable?
    
    func fetchPokemon() {
        guard let url = URL(string: "https://pokebuildapi.fr/api/v1/pokemon/1") else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Pokemon.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { pokemon in
                self.pokemon = pokemon
            })
    }
}
