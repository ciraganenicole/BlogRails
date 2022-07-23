# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create([
    {id:1, name: 'Candy', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', postsCounter: 7},
    {id:2, name: 'Cynthia', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.', postsCounter: 0},
    {id:3, name: 'josue ambargo', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from USA.', postsCounter: 4}])
Post.create(
    [{title: 'Hello', text: 'This is my first post',commentsCounter: 0, likesCounter: 0, user_id: 1},
    {title: 'Hello', text: 'This is my first post',commentsCounter: 0, likesCounter: 0, user_id: 2},
    {title: 'Hello', text: 'This is my first post',commentsCounter: 0, likesCounter: 0, user_id: 3},
    {title: 'Hello', text: 'This is my first post',commentsCounter: 0, likesCounter: 0, user_id: 2}])