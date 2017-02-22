CREATE TABLE locations (
  id TINYINT PRIMARY KEY,
  latitude DOUBLE NOT NULL,
  longitude DOUBLE NOT NULL,
  image  VARCHAR(30) NOT NULL
);
INSERT INTO locations VALUES ( 1, 52.090576, 5.141817, '../images/image1.jpg');
INSERT INTO locations VALUES ( 2, 52.093147, 5.118656, '../images/image2.jpg');
INSERT INTO locations VALUES ( 3, 52.090556, 5.121711, '../images/image3.jpg');