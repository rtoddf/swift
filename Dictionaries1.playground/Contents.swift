import UIKit


var movieRatings = [
    "Donnie Darko": 4,
    "Cloud Atlas": 1,
    "Raiders of the Lost Ark": 1
]

print("I have rated \(movieRatings.count) movies")

let darkoRating = movieRatings["Donnie Darko"]

movieRatings

movieRatings["Donnie Darko"] = 3

movieRatings

movieRatings["8 mile"] = 5

movieRatings

//movieRatings.removeValueForKey("8 mile")
movieRatings["8 mile"] = nil

movieRatings

for (key, value) in movieRatings {
    print("The movie \(key) has a rating of \(value)")
}

for movies in movieRatings.keys {
    print("\(movies)")
}

let watchedMovies = Array(movieRatings.keys)

print(watchedMovies)
