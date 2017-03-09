CREATE TABLE locations (
  id TINYINT PRIMARY KEY,
  latitude DOUBLE NOT NULL,
  longitude DOUBLE NOT NULL,
  image  VARCHAR(30) NOT NULL
);
INSERT INTO locations VALUES ( 0, 52.090576, 5.141817, '/images/image1.jpg');
INSERT INTO locations VALUES ( 1, 52.090576, 5.141817, '/images/image2.jpg');
INSERT INTO locations VALUES ( 2, 52.1132667, 5.1091262, '/images/image3.jpg');
INSERT INTO locations VALUES ( 3, 52.090576, 5.141817, '/images/image1.jpg');
INSERT INTO locations VALUES ( 4, 52.090576, 5.141817, '/images/image2.jpg');
INSERT INTO locations VALUES ( 5, 52.1132667, 5.1091262, '/images/image3.jpg');
INSERT INTO locations VALUES ( 6, 52.090576, 5.141817, '/images/image1.jpg');
INSERT INTO locations VALUES ( 7, 52.090576, 5.141817, '/images/image2.jpg');
INSERT INTO locations VALUES ( 8, 52.1132667, 5.1091262, '/images/image3.jpg');
INSERT INTO locations VALUES ( 9, 52.090576, 5.141817, '/images/image1.jpg');

CREATE TABLE scores (
  id TINYINT PRIMARY KEY,
  distance DOUBLE NOT NULL,
  points INT NOT NULL
);
INSERT INTO scores VALUES ( 0, 0, 0);
INSERT INTO scores VALUES ( 1, 0, 1);
INSERT INTO scores VALUES ( 2, 0, 2);
INSERT INTO scores VALUES ( 3, 0, 0);
INSERT INTO scores VALUES ( 4, 0, 0);
INSERT INTO scores VALUES ( 5, 0, 0);
INSERT INTO scores VALUES ( 6, 0, 0);
INSERT INTO scores VALUES ( 7, 0, 0);
INSERT INTO scores VALUES ( 8, 0, 0);
INSERT INTO scores VALUES ( 9, 0, 0);
