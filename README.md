# Movie Night Voting Booth
### Work in progress
A collection of users can submit what they want to watch for a movie night. Votes will be tallied for each movie, eventually returning the top movie.

Domain model:
users --< votes >-- movies

MVP: 
~~1. User will be able to submit as many movies as they wish.~~
  ~~* movies return user who submitted it~~
~~2. User will be able to up- or downvote a movie~~
~~3. votes will be tallied~~
~~4. List of movies returned, descending order of votes~~
~~5. can vote from movie show page (Eddie)~~

Stretch goals: 

~~* Movie knows which user submitted it~~  

~~* Created movies start with an upvote (Eddie)~~ 

~~* one vote per user per movie (Alex)~~ 

~~* movies aren't repeated: if another user submits a movie that's already on the list, it's an upvote for the existing movie (Eddie)~~

* have an admin or superuser, one who decides when the votes are tallied and can pick limitations, delete movie suggestions, etc. (Alex) (google rails multi role users?)
* pull movie show page info from API call: title, release year, genres(?), movie poster, overview
* Validations:

  * A user must have a unique name
  * A movie must have a title and a submitter
  * A vote must have a user_id, movie_id, and a boolean value for :up
* limiting movie submissions by genre or MPAA rating or Rotten Tomatoes rating
* implement API search 
* votes are secret until list is returned
* clean up: remove routes and methods we don't want in final product

