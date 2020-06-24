//
//  ViewController.swift
//  Homework48
//
//  Created by Kato on 6/24/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class HorrorMovieViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var indexSet: IndexSet = []
    
    var movies = ["The Conjuring", "Train to Busan", "Us", "Get Out"]
    
    var storylines = [
        "In 1971, Carolyn and Roger Perron move their family into a dilapidated Rhode Island farm house and soon strange things start happening around it with escalating nightmarish terror. In desperation, Carolyn contacts the noted paranormal investigators, Ed and Lorraine Warren, to examine the house. What the Warrens discover is a whole area steeped in a satanic haunting that is now targeting the Perron family wherever they go. To stop this evil, the Warrens will have to call upon all their skills and spiritual strength to defeat this spectral menace at its source that threatens to destroy everyone involved.",
    
        "Sok-woo, a father with not much time for his daughter, Soo-ahn, are boarding the KTX, a fast train that shall bring them from Seoul to Busan. But during their journey, the apocalypse begins, and most of the earth's population become flesh craving zombies. While the KTX is shooting towards Busan, the passenger's fight for their families and lives against the zombies - and each other.",
        
        "In order to get away from their busy lives, the Wilson family takes a vacation to Santa Cruz, California with the plan of spending time with their friends, the Tyler family. On a day at the beach, their young son Jason almost wanders off, causing his mother Adelaide to become protective of her family. That night, four mysterious people break into Adelaide's childhood home where they're staying. The family is shocked to find out that the intruders look like them, only with grotesque appearances.",
        
        "Chris and his girlfriend Rose go upstate to visit her parents for the weekend. At first, Chris reads the family's overly accommodating behavior as nervous attempts to deal with their daughter's interracial relationship, but as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth that he never could have imagined."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 280.0
        
        //tableView.isPagingEnabled = true
    }
    
}

extension HorrorMovieViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "horror_movie_cell", for: indexPath) as! HorrorMovieCell
        
        cell.horrorMovieImageView.image = UIImage(named: movies[indexPath.row])
        cell.horrorMovieTitleLabel.text = movies[indexPath.row]
        cell.horrorMovieStorylineLabel.text = storylines[indexPath.row]
        
        if indexSet.contains(indexPath.row) {
            cell.horrorMovieStorylineLabel.numberOfLines = 0
            cell.horrorMovieStorylineLabel.textColor = .white
        }
        else {
            cell.horrorMovieStorylineLabel.numberOfLines = 1
            cell.horrorMovieStorylineLabel.textColor = .red
            cell.horrorMovieStorylineLabel.text = "Tap for info >"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //tableView.scrollToNearestSelectedRow(at: .top, animated: true)
    }
    
    
}
extension HorrorMovieViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexSet.contains(indexPath.row) {
            indexSet.remove(indexPath.row)
        }
        else {
            indexSet.insert(indexPath.row)
        }
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}

