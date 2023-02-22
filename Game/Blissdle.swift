//
//  Blissdle.swift
//  Blissdle
//
//  Created by Ben Schwartz on 5/8/22.
//

import Foundation


class Blissdle {
    
    var _words: Set<String> = []
    var _known: [Int:Character] = [:]
    var _partial: [Int:Set<Character>] = [0:[], 1:[], 2:[], 3:[], 4:[]]
    var _good: Set<Character> = []
    var _bad: Set<Character> = []
    var num_removed: Int = 0
    
    init() {
        load_words()
        
    }
    func load_words() {
        var arrayOfStrings: [String]?
        do {
            // This solution assumes  you've got the file in your bundle
            if let path = Bundle.main.path(forResource: "words", ofType: "txt"){
                let data = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
                arrayOfStrings = data.components(separatedBy: "\n")
            }
        } catch let err as NSError {
            // do something with Error
            print(err)
        }
        _words.removeAll()
        for word in arrayOfStrings! {
            _words.insert(word)
        }
    }
    func print_pips() {
        print(_words)
    }
    
    
}

extension Blissdle {
    
    func reset() {
        load_words()
        _known.removeAll()
        _partial.removeAll()
        _good.removeAll()
        _bad.removeAll()
        num_removed = 0
    }
    
    func process(word: String, state: [Int]) {
        
        
        
    }
    func update_sets(word: String, state: [Int]) -> Bool {
        
        var results: [Int:[Int]] = [0:[], 1:[], 2:[]]
        
        for (i, val) in state.enumerated() {
            switch val {
            case 0:
                results[0]!.append(i)
                break
            case 1:
                results[1]!.append(i)
                break
            case 2:
                results[2]!.append(i)
                break
            default:
                print("error 301")
            }
        }
        if let greens = results[2] {
            if greens.count > 0 {
                for i in greens {
                    let c: Character = at(word: word, pos: i)
                    _known[i] = c
                    _good.insert(c)
                }
            }
        }
        
        if let yellows = results[1] {
            if yellows.count > 0 {
                for i in yellows {
                    // FIXME: FIGURE OUT HOW TO CHeck for yellows already marked as green and other discrepencies
                }
            }
        }
        
        return true
    }
}

extension Blissdle {
    
    func at(word: String, pos: Int) -> Character {
        return word[word.index(word.startIndex, offsetBy: pos)]
    }
}

