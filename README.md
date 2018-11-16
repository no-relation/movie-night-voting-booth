# Movie Night Voting Booth
Imagine you and a group of friends want to gather for a movie night. You could talk over what you want to watch for hours, and that can be fun, but what if there was another way?

<a href='https://www.youtube.com/watch?v=IW968KKUFVg' target=_blank><img src='https://media.giphy.com/media/407ExqfEGikpJj1IQK/giphy.gif' 
alt="video demonstration" width="500" border="10" /></a>
###### *click for full demo video*

**Movie Night Voting Booth** allows a group of users to nominate films to watch and then vote on them. A user can submit as many movies as they like, and up- or downvote any movie that's been submitted. When the votes are in, click the tally link, and you see how many net votes each movie received.

Movie Night Voting Booth is powered by [The Movie Database API.](https://www.themoviedb.org/?language=en-US) Community built since 2008, the Movie Database has information in 39 languages on over 424,000 movies and 1.4 million episodes of television, and hosts over 2 million photos, posters and other images.

This webapp also would not have been possible without [Bootstrap](https://getbootstrap.com/) for styling, [AccessGranted](https://github.com/chaps-io/access-granted) for user authorizations, and [HTTParty](https://github.com/jnunemaker/httparty) for API parsing.

A visitor can sign up as a user or admin; users have the authorization to add as many movies as they wish, and can either upvote or downvote any movie submitted. A movie can only have one vote per user, either up or down; a user can change their vote, but not upvote or downvote more than once.

Admins can remove movies or other users. They can also reset the vote count or remove all movies from the tallied vote page.

[Up Arrow and Down Arrow designed by Digital Pharm](http://icongal.com/gallery/iconset/540/must_have/2) and used under [Creative Commons Attribute Non-Commercial license](https://creativecommons.org/licenses/by-nd/3.0/)

<!-- 
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

~~* have an admin or superuser, one who decides when the votes are tallied and can pick limitations, delete movie suggestions, etc. (Alex) (google rails multi role users?)~~
~~* pull movie show page info from API call: title, release year,~~ genres(?), ~~movie poster, overview~~
* Validations:

  ~~* A user must have a unique name~~
  * A movie must have a title and a submitter
  * A vote must have a user_id, movie_id, and a boolean value for :up
* limiting movie submissions by genre or MPAA rating or Rotten Tomatoes rating
~~* implement API search ~~
* votes are secret until list is returned
* clean up: remove routes and methods we don't want in final product

-->
