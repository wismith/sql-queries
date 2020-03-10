
SELECT tracks.id, tracks.name, albums.title, quantity,
       AVG(quantity) OVER (PARTITION BY tracks.album_id),
       RANK () OVER (
         PARTITION BY tracks.album_id
         ORDER BY milliseconds DESC
        )
FROM tracks
JOIN albums
  ON (albums.id = tracks.album_id)
JOIN invoice_lines
  ON (invoice_lines.track_id = tracks.id)
JOIN genres
  ON (genres.id = tracks.genre_id)
WHERE genres.name = 'Rock';

SELECT tracks.id, tracks.name AS track_name, albums.title AS album, milliseconds AS track_length,
       RANK () OVER (
         PARTITION BY tracks.album_id
         ORDER BY milliseconds
       ) AS length_rank
FROM tracks
JOIN albums ON (albums.id = tracks.album_id)
JOIN genres ON (genres.id = tracks.genre_id)
WHERE genres.name = 'Rock';
