CREATE TABLE locations (
  id TINYINT PRIMARY KEY,
  latitude DOUBLE NOT NULL,
  longitude DOUBLE NOT NULL,
  image  VARCHAR(30) NOT NULL,
  remark VARCHAR(50) NOT NULL
);
INSERT INTO locations VALUES ( 0, 52.0887366, 5.1395152, '/images/image0.jpg','Statue of Wilhelmina in Wilhelmina park');
INSERT INTO locations VALUES ( 1, 52.088285, 5.130384, '/images/image1.jpg','Jewish monument');
INSERT INTO locations VALUES ( 2, 52.0970745, 5.1252401, '/images/image2.jpg','Former jail on Wolvenplein');
INSERT INTO locations VALUES ( 3, 52.0908413, 5.1215773, '/images/image3.jpg','Domplein');
INSERT INTO locations VALUES ( 4, 52.0962154, 5.116570, '/images/image4.jpg','Nijntje plein');
INSERT INTO locations VALUES ( 5, 52.0993139, 5.1155443, '/images/image5.jpg','Mill on Adelaarstraat');
INSERT INTO locations VALUES ( 6, 52.0754956, 5.1207509, '/images/image6.jpg','Water tower');
INSERT INTO locations VALUES ( 7, 52.0925370, 5.1130481, '/images/image7.jpg','Vredenburg');
INSERT INTO locations VALUES ( 8, 52.083909, 5.125621, '/images/image8.jpg','Nijntje museum');
INSERT INTO locations VALUES ( 9, 52.097516, 5.077078, '/images/image9.jpg','Yellow bridge');
INSERT INTO locations VALUES ( 10, 52.0930758, 5.1273582, '/images/image10.jpg','Stadsschouwburg');
INSERT INTO locations VALUES ( 11, 52.065414, 5.090754, '/images/image11.jpg','WTC Papendorp, location of bol.com');
INSERT INTO locations VALUES ( 12, 52.0891554, 5.1095413, '/images/image12.jpg','Central Station');
INSERT INTO locations VALUES ( 13, 52.0890344, 5.121581, '/images/image13.jpg','Cafe Belgie');
INSERT INTO locations VALUES ( 14, 52.0919353, 5.118741, '/images/image14.jpg','Winkel van Sinkel');
INSERT INTO locations VALUES ( 15, 52.062974, 5.102429, '/images/image15.jpg','IKEA');
INSERT INTO locations VALUES ( 16, 52.0902424, 5.1223406, '/images/image16.jpg','University');
INSERT INTO locations VALUES ( 17, 52.093627, 5.118636, '/images/image17.jpg','Thinker on a rock');
INSERT INTO locations VALUES ( 18, 52.0931271, 5.118165, '/images/image18.jpg','old post office on Neude');
INSERT INTO locations VALUES ( 19, 52.0874317, 5.1155435, '/images/image19.jpg','de Inktpot');
INSERT INTO locations VALUES ( 20, 52.0861278, 5.1092909, '/images/image20.jpg','Rabo tower');
INSERT INTO locations VALUES ( 21, 52.0789238, 5.146244, '/images/image21.jpg','Stadion Galgenwaard');
INSERT INTO locations VALUES ( 22, 52.0817756, 5.1241617, '/images/image22.jpg','Louis Hartlooper Complex');
INSERT INTO locations VALUES ( 23, 52.09312, 5.114852, '/images/image23.jpg','Rainbow pedestrian crossing');
INSERT INTO locations VALUES ( 24, 52.086395, 5.167758, '/images/image24.jpg','Uithof');
INSERT INTO locations VALUES ( 25, 52.0975652, 5.1376791, '/images/image25.jpg','Paardenkathedraal');
INSERT INTO locations VALUES ( 26, 52.0928226, 5.116547, '/images/image26.jpg','Oudaen  city castle');
INSERT INTO locations VALUES ( 27, 52.0872889, 5.1239193, '/images/image27.jpg','Catherijneconvent');
INSERT INTO locations VALUES ( 28, 52.087198, 5.096407, '/images/image28.jpg','de Munt');
INSERT INTO locations VALUES ( 29, 52.0970745, 5.1252401, '/images/image29.jpg','Paushuize');


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
