-- -- -- -- -- -- -- -- --
-- -- -- -Joins-- -- -- --
select * from invoice i
join invoice_line il on il.invoice_id = i.invoice_id
where il.unit_price > 0.99

select i.invoice_date, c.first_name, c.last_name, i.total
from invoice i
join customer c on i.customer_id = c.customer_id

select c.first_name, c.last_name, e.first_name, e.last_name
from customer c
join employee e on c.support_rep_id = e.employee_id

select ar.name, al.title
from artist ar
join album al on ar.artist_id = al.artist_id

select pt.track_id
from playlist_track pt
join playlist pl on pt.playlist_id = pl.playlist_id
where pl.name = 'Music'

select t.name
from playlist_track pt
join track t on t.track_id = pt.track_id
where pt.playlist_id = 5

select t.name, pl.name
from track t
join playlist_track pt on t.track_id = pt.track_id
join playlist pl on pl.playlist_id = pt.playlist_id;

select t.name, a.title
from album a
join track t on t.album_id = a.album_id
join genre g on g.genre_id = t.genre_id
where g.name = 'Alternative & Punk'

-- diamond
select t.name, ar.name, al.title, g.name
from playlist_track pt
join playlist p on p.playlist_id = pt.playlist_id
join track t on t.track_id = pt.track_id
join genre g on g.genre_id = t.genre_id
join album al on al.album_id = t.album_id
join artist ar on ar.artist_id = al.artist_id
where p.name = 'Music'

-- -- -- -- -- -- -- -- --
-- -- Nested Queries -- --
select * from invoice
where invoice_id in (
  select invoice_id from invoice_line
  where unit_price > 0.99
)

select * from playlist_track
where playlist_id in (
  select playlist_id from playlist
  where name = 'Music'
)
  
select name from track
where track_id in (
  select track_id from playlist_track
  where playlist_id = 5
)

select * from track
where genre_id in (
  select genre_id from genre
  where name = 'Comedy'
)

select * from track
where album_id in (
  select album_id from album
  where title = 'Fireball'
)

select * from track
where album_id in (
  select album_id from album
  where artist_id in (
    select artist_id from artist
    where name = 'Queen'
    )
)

-- -- -- -- -- -- -- -- --
-- -- Updating Rows- -- --


-- -- -- -- -- -- -- -- --
-- -- -- Group By -- -- --


-- -- -- -- -- -- -- -- --
-- -- -Use Distinct- -- --


-- -- -- -- -- -- -- -- --
-- -- --Delete Rows- -- --


-- -- -- -- -- -- -- -- --
-- eCommerce Simulation --