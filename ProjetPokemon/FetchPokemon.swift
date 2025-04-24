import SwiftUI
import Combine

class PokemonViewModel: ObservableObject {
    @Published var pokemon: Pokemon?
    private var cancellable: AnyCancellable?
    
    func fetchPokemon(byId id: Int? = nil, orName name: String? = nil) {
        var urlString: String
            
        if let id = id {
            urlString = "https://pokebuildapi.fr/api/v1/pokemon/\(id)"
        } else if let name = name {
            urlString = "https://pokebuildapi.fr/api/v1/pokemon/\(name)"
        } else {
            return
        }

        guard let url = URL(string: urlString) else { return }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: Pokemon.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { pokemon in
                self.pokemon = pokemon
            })
    }
}
