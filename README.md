# movie-night-voting-booth
A collection of users can submit what they want to watch for a movie night. Votes will be tallied for each movie, eventually returning the top movie.

Domain model:
users --< votes >-- movies

MVP: 
~~1. User will be able to submit as many movies as they wish.~~
  * movies return user who submitted it
~~2. User will be able to up- or downvote a movie~~
~~3. votes will be tallied~~
~~4. List of movies returned, descending order of votes~~
5. can vote from movie show page (Eddie)

Stretch goals:
1. one vote per user per movie (Alex)
2. votes are secret until list is returned
3. movies aren't repeated: if another user submits a movie that's already on the list, it's an upvote for the existing movie
4. have an admin or superuser, one who decides when the votes are tallied and can pick limitations, delete movie suggestions, etc.
5. limiting movie submissions by genre or MPAA rating or Rotten Tomatoes rating
6. implement API search 
