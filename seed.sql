INSERT INTO chefs ('first_name', 'last_name', 'mentor')
VALUES  ('sam', 'smith', NULL),
        ('rachael', 'gray', 1 ),
        ('bob', 'cohen', NULL ),
        ('nick', 'Miller', 1 );

INSERT INTO restaurants ('name', 'neighborhood', 'cuisine')
VALUES  ('cafe bean', 'local', 'simple'),
        ('fannnncy', 'downtown', 'complex'),
        ('pizza everyday', 'local', 'Italian');


INSERT INTO chef_tenures ('chef_id', 'restaurant_id', 'start_time', 'end_time', 'head_chef')
VALUES  (1, 2,'1999-08-16', '2003-08-16', 1),
        (3, 2,'1993-08-16', '2003-08-16', 0),
        (2, 3,'1994-08-16', '2003-08-16', 1),
        (1, 3,'2000-08-16', '2003-08-16', 0),
        (2, 1,'2001-08-16', '2003-08-16', 0);

INSERT INTO critics ('name')
VALUES  ('Mr not-so-nice'),
        ('food-lover');

INSERT INTO restaurant_reviews ('critic_id', 'restaurant_id', 'review', 'score', 'date_time')
VALUES  (1, 1, "Just terrible", 2,  '1998-08-16'),
        (1, 3, "Just awfull",   3,  '2000-03-16'),
        (2, 1, "Just terrible", 20, '2000-04-16'),
        (2, 2, "Just terrible", 19, '2000-10-16');

