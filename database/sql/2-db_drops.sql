#THIS SQL MUST BE USED AFTER 'db_database.sql'
#NEXT SQL 'db_shopupdate.sql' IS OPTIONAL

USE `cosmic`;

  CREATE TABLE IF NOT EXISTS `drop_data` (
    `id` bigint(20) NOT NULL AUTO_INCREMENT,
    `dropperid` int(11) NOT NULL,
    `itemid` int(11) NOT NULL DEFAULT '0',
    `minimum_quantity` int(11) NOT NULL DEFAULT '1',
    `maximum_quantity` int(11) NOT NULL DEFAULT '1',
    `questid` int(11) NOT NULL DEFAULT '0',
    `chance` int(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY (`dropperid`, `itemid`),
    KEY `mobid` (`dropperid`),
    INDEX (dropperid, itemid)
  ) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

  #pass (sorted) data from one table to another
  INSERT INTO drop_data (dropperid, itemid, minimum_quantity, maximum_quantity, questid, chance)
  (
    SELECT dropperid, itemid, minimum_quantity, maximum_quantity, questid, chance
    FROM temp_data
  );
  DROP TABLE temp_data;

 -- Copying drops from some mobs to other versions of them

 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 9300342, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 1210102;

 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 6300001, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 6300000;

 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 6300002, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 6300000;

 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 6400001, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 6400000;

 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 6130102, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 6130103;

 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 6230201, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 6230200;

 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 3000002, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 3000001;

 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 3000003, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 3000001;

 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 3000004, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 3000001;

 -- Thanks to DietStory v1.02 dev team
 -- There are two Jr. Boogies mob ids for some unknown reason. 3230301 had no drops, but 3230300 had all the correct drops.
 -- Just copying the drops from the one with the correct drop data.
 INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`)
 SELECT 3230301, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance` FROM drop_data WHERE dropperid = 3230300;

  # delete all unused content on drop data
  DELETE FROM `drop_data` WHERE itemid=400000;
  DELETE FROM `drop_data` WHERE itemid=400001;
  DELETE FROM `drop_data` WHERE itemid=400002;
  DELETE FROM `drop_data` WHERE itemid=400003;
  DELETE FROM `drop_data` WHERE itemid=400004;
  DELETE FROM `drop_data` WHERE itemid=400005;
  DELETE FROM `drop_data` WHERE itemid=400006;
  DELETE FROM `drop_data` WHERE itemid=400009;
  DELETE FROM `drop_data` WHERE itemid=400010;
  DELETE FROM `drop_data` WHERE itemid=400011;
  DELETE FROM `drop_data` WHERE itemid=401000;
  DELETE FROM `drop_data` WHERE itemid=404000;
  DELETE FROM `drop_data` WHERE itemid=1002926;
  DELETE FROM `drop_data` WHERE itemid=1002927;
  DELETE FROM `drop_data` WHERE itemid=1027090;
  DELETE FROM `drop_data` WHERE itemid=1302096;
  DELETE FROM `drop_data` WHERE itemid=2002205;
  DELETE FROM `drop_data` WHERE itemid=2040033;
  DELETE FROM `drop_data` WHERE itemid=2040536;
  DELETE FROM `drop_data` WHERE itemid=2040827;
  DELETE FROM `drop_data` WHERE itemid=2040913;
  DELETE FROM `drop_data` WHERE itemid=2040935;
  DELETE FROM `drop_data` WHERE itemid=2043109;
  DELETE FROM `drop_data` WHERE itemid=2043309;
  DELETE FROM `drop_data` WHERE itemid=2043709;
  DELETE FROM `drop_data` WHERE itemid=2044009;
  DELETE FROM `drop_data` WHERE itemid=2044209;
  DELETE FROM `drop_data` WHERE itemid=2044309;
  DELETE FROM `drop_data` WHERE itemid=2044609;
  DELETE FROM `drop_data` WHERE itemid=2049212;
  DELETE FROM `drop_data` WHERE itemid=2049214;
  DELETE FROM `drop_data` WHERE itemid=4000306;
  DELETE FROM `drop_data` WHERE itemid=4000343;
  DELETE FROM `drop_data` WHERE itemid=4000420;
  DELETE FROM `drop_data` WHERE itemid=4000429;
  DELETE FROM `drop_data` WHERE itemid=4000430;
  DELETE FROM `drop_data` WHERE itemid=4000431;
  DELETE FROM `drop_data` WHERE itemid=4000432;
  DELETE FROM `drop_data` WHERE itemid=4000433;
  DELETE FROM `drop_data` WHERE itemid=4000434;
  DELETE FROM `drop_data` WHERE itemid=4000435;
  DELETE FROM `drop_data` WHERE itemid=4032192;
  DELETE FROM `drop_data` WHERE itemid=8143000;
  DELETE FROM `drop_data` WHERE itemid=2094101;

  # MapleMesoFetcher ftw! Set meso drop for remaining mobs which drops more than 4 items.
  INSERT IGNORE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`) VALUES
(100122, 0, 35, 52, 0, 400000),
(100123, 0, 38, 55, 0, 400000),
(100124, 0, 40, 59, 0, 400000),
(100130, 0, 31, 45, 0, 400000),
(100131, 0, 33, 49, 0, 400000),
(100132, 0, 35, 52, 0, 400000),
(100133, 0, 38, 55, 0, 400000),
(100134, 0, 40, 59, 0, 400000),
(1110130, 0, 49, 72, 0, 400000),
(1140130, 0, 56, 83, 0, 400000),
(2100100, 0, 58, 85, 0, 400000),
(2100101, 0, 60, 88, 0, 400000),
(2100106, 0, 66, 97, 0, 400000),
(2100107, 0, 73, 108, 0, 400000),
(2100108, 0, 78, 115, 0, 400000),
(2110300, 0, 66, 97, 0, 400000),
(2110301, 0, 78, 115, 0, 400000),
(2230105, 0, 64, 94, 0, 400000),
(2230107, 0, 66, 97, 0, 400000),
(2230110, 0, 64, 94, 0, 400000),
(2230111, 0, 66, 97, 0, 400000),
(2230131, 0, 66, 97, 0, 400000),
(3000005, 0, 81, 119, 0, 400000),
(3100101, 0, 86, 127, 0, 400000),
(3100102, 0, 81, 119, 0, 400000),
(3110301, 0, 86, 127, 0, 400000),
(3110302, 0, 95, 140, 0, 400000),
(3110303, 0, 105, 155, 0, 400000),
(3220000, 0, 285, 1400, 0, 400000),
(3220001, 0, 315, 1550, 0, 400000),
(3300000, 0, 81, 119, 0, 400000),
(3300001, 0, 81, 119, 0, 400000),
(3300002, 0, 83, 123, 0, 400000),
(3300003, 0, 86, 127, 0, 400000),
(3300004, 0, 89, 131, 0, 400000),
(3300005, 0, 95, 140, 0, 400000),
(3300006, 0, 95, 140, 0, 400000),
(3300007, 0, 95, 140, 0, 400000),
(3300008, 0, 315, 1550, 0, 400000),
(4110300, 0, 120, 177, 0, 400000),
(4110301, 0, 132, 195, 0, 400000),
(4130103, 0, 423, 2080, 0, 400000),
(4220000, 0, 396, 1950, 0, 400000),
(4230122, 0, 120, 177, 0, 400000),
(4230125, 0, 128, 189, 0, 400000),
(4230400, 0, 132, 195, 0, 400000),
(4230502, 0, 124, 182, 0, 400000),
(4230503, 0, 132, 195, 0, 400000),
(4230504, 0, 132, 195, 0, 400000),
(4230600, 0, 112, 165, 0, 400000),
(4240000, 0, 151, 222, 0, 400000),
(4250000, 0, 120, 177, 0, 400000),
(4250001, 0, 137, 201, 0, 400000),
(5110300, 0, 156, 230, 0, 400000),
(5120500, 0, 190, 280, 0, 400000),
(5120501, 0, 172, 254, 0, 400000),
(5120502, 0, 178, 262, 0, 400000),
(5120505, 0, 203, 299, 0, 400000),
(5120506, 0, 184, 271, 0, 400000),
(5130105, 0, 190, 280, 0, 400000),
(5130108, 0, 196, 289, 0, 400000),
(5220000, 0, 552, 2710, 0, 400000),
(5220002, 0, 468, 2300, 0, 400000),
(5220003, 0, 630, 3090, 0, 400000),
(5220004, 0, 468, 2300, 0, 400000),
(5250000, 0, 184, 271, 0, 400000),
(5250001, 0, 161, 237, 0, 400000),
(5250002, 0, 196, 289, 0, 400000),
(6110300, 0, 255, 377, 0, 400000),
(6130102, 0, 217, 320, 0, 400000),
(6130103, 0, 217, 320, 0, 400000),
(6130203, 0, 217, 320, 0, 400000),
(6130207, 0, 231, 341, 0, 400000),
(6130209, 0, 264, 389, 0, 400000),
(6220000, 0, 765, 3770, 0, 400000),
(6220001, 0, 765, 3770, 0, 400000),
(6230100, 0, 231, 341, 0, 400000),
(6230401, 0, 239, 353, 0, 400000),
(6300005, 0, 765, 3770, 0, 400000),
(6400006, 0, 384, 1890, 0, 400000),
(6400008, 0, 552, 2710, 0, 400000),
(6400009, 0, 552, 2710, 0, 400000),
(7110300, 0, 355, 524, 0, 400000),
(7110301, 0, 332, 490, 0, 400000),
(7120103, 0, 301, 444, 0, 400000),
(7120104, 0, 311, 459, 0, 400000),
(7120106, 0, 355, 524, 0, 400000),
(7120107, 0, 355, 524, 0, 400000),
(7120108, 0, 379, 559, 0, 400000),
(7120109, 0, 405, 597, 0, 400000),
(7130000, 0, 332, 490, 0, 400000),
(7130002, 0, 321, 474, 0, 400000),
(7130003, 0, 367, 541, 0, 400000),
(7130004, 0, 391, 578, 0, 400000),
(7130102, 0, 391, 578, 0, 400000),
(7130103, 0, 332, 490, 0, 400000),
(7130400, 0, 903, 4440, 0, 400000),
(7130401, 0, 903, 4440, 0, 400000),
(7130402, 0, 903, 4440, 0, 400000),
(7130601, 0, 367, 541, 0, 400000),
(7220000, 0, 933, 4590, 0, 400000),
(7220001, 0, 903, 4440, 0, 400000),
(7220002, 0, 1137, 5590, 0, 400000),
(8110300, 0, 418, 617, 0, 400000),
(8120102, 0, 446, 659, 0, 400000),
(8120103, 0, 477, 704, 0, 400000),
(8120104, 0, 509, 752, 0, 400000),
(8120105, 0, 544, 803, 0, 400000),
(8120106, 0, 562, 830, 0, 400000),
(8120107, 0, 562, 830, 0, 400000),
(8140000, 0, 418, 617, 0, 400000),
(8140100, 0, 446, 659, 0, 400000),
(8140511, 0, 581, 871, 0, 400000),
(8140512, 0, 608, 908, 0, 400000),
(8140600, 0, 594, 889, 0, 400000),
(8140702, 0, 637, 946, 0, 400000),
(8140703, 0, 666, 986, 0, 400000),
(8141300, 0, 622, 927, 0, 400000),
(8150000, 0, 2142, 10490, 0, 400000),
(8150100, 0, 714, 1049, 0, 400000),
(8150101, 0, 747, 1093, 0, 400000),
(8150200, 0, 714, 1049, 0, 400000),
(8150201, 0, 800, 1162, 0, 400000),
(8150300, 0, 666, 986, 0, 400000),
(8150301, 0, 730, 1070, 0, 400000),
(8150302, 0, 764, 1115, 0, 400000),
(8220003, 0, 3381, 15830, 0, 400000),
(8220005, 0, 4350, 19860, 0, 400000),
(8220006, 0, 5466, 24400, 0, 400000),
(8220007, 0, 1704, 8530, 0, 400000),
(8220009, 0, 1479, 7280, 0, 400000),
(8830000, 0, 2400, 11620, 0, 400000),
(8830007, 0, 2400, 11620, 0, 400000),
(9200016, 0, 81, 119, 0, 400000),
(9200019, 0, 203, 299, 0, 400000),
(9300011, 0, 109, 160, 0, 400000),
(9300058, 0, 38, 55, 0, 400000),
(9300059, 0, 42, 61, 0, 400000),
(9300060, 0, 120, 177, 0, 400000),
(9300078, 0, 800, 1162, 0, 400000),
(9300080, 0, 282, 416, 0, 400000),
(9300096, 0, 544, 803, 0, 400000),
(9300105, 0, 717, 3530, 0, 400000),
(9300106, 0, 846, 4160, 0, 400000),
(9300127, 0, 81, 119, 0, 400000),
(9300129, 0, 81, 119, 0, 400000),
(9300131, 0, 109, 160, 0, 400000),
(9300132, 0, 81, 119, 0, 400000),
(9300133, 0, 81, 119, 0, 400000),
(9300134, 0, 81, 119, 0, 400000),
(9300136, 0, 243, 1190, 0, 400000),
(9300139, 0, 1296, 6380, 0, 400000),
(9300155, 0, 38, 55, 0, 400000),
(9300160, 0, 396, 1950, 0, 400000),
(9300161, 0, 396, 1950, 0, 400000),
(9300163, 0, 1127, 1583, 0, 400000),
(9300164, 0, 1127, 1583, 0, 400000),
(9300165, 0, 1127, 1583, 0, 400000),
(9300182, 0, 1479, 7280, 0, 400000),
(9300184, 0, 174, 850, 0, 400000),
(9300185, 0, 285, 1400, 0, 400000),
(9300186, 0, 315, 1550, 0, 400000),
(9300187, 0, 336, 1650, 0, 400000),
(9300188, 0, 468, 2300, 0, 400000),
(9300189, 0, 468, 2300, 0, 400000),
(9300190, 0, 552, 2710, 0, 400000),
(9300191, 0, 651, 3200, 0, 400000),
(9300192, 0, 570, 2800, 0, 400000),
(9300193, 0, 630, 3090, 0, 400000),
(9300194, 0, 765, 3770, 0, 400000),
(9300195, 0, 765, 3770, 0, 400000),
(9300196, 0, 765, 3770, 0, 400000),
(9300197, 0, 765, 3770, 0, 400000),
(9300198, 0, 651, 3200, 0, 400000),
(9300199, 0, 903, 4440, 0, 400000),
(9300200, 0, 933, 4590, 0, 400000),
(9300201, 0, 1479, 7280, 0, 400000),
(9300202, 0, 1137, 5590, 0, 400000),
(9300203, 0, 1254, 6170, 0, 400000),
(9300204, 0, 1383, 6810, 0, 400000),
(9300205, 0, 1296, 6380, 0, 400000),
(9300206, 0, 1479, 7280, 0, 400000),
(9300207, 0, 1479, 7280, 0, 400000),
(9300208, 0, 1704, 8530, 0, 400000),
(9300209, 0, 1704, 8530, 0, 400000),
(9300210, 0, 2142, 10490, 0, 400000),
(9300211, 0, 2400, 11620, 0, 400000),
(9300212, 0, 2400, 11620, 0, 400000),
(9300213, 0, 3381, 15830, 0, 400000),
(9300214, 0, 3792, 17550, 0, 400000),
(9300215, 0, 6714, 29370, 0, 400000),
(9300217, 0, 32, 47, 0, 400000),
(9300218, 0, 34, 50, 0, 400000),
(9300219, 0, 34, 50, 0, 400000),
(9300220, 0, 52, 77, 0, 400000),
(9300221, 0, 68, 101, 0, 400000),
(9300222, 0, 75, 111, 0, 400000),
(9300223, 0, 36, 54, 0, 400000),
(9300224, 0, 102, 150, 0, 400000),
(9300225, 0, 102, 150, 0, 400000),
(9300226, 0, 112, 165, 0, 400000),
(9300227, 0, 102, 150, 0, 400000),
(9300228, 0, 146, 215, 0, 400000),
(9300229, 0, 39, 57, 0, 400000),
(9300230, 0, 116, 171, 0, 400000),
(9300231, 0, 137, 201, 0, 400000),
(9300232, 0, 92, 136, 0, 400000),
(9300233, 0, 112, 165, 0, 400000),
(9300234, 0, 86, 127, 0, 400000),
(9300235, 0, 167, 245, 0, 400000),
(9300236, 0, 190, 280, 0, 400000),
(9300237, 0, 210, 309, 0, 400000),
(9300238, 0, 66, 97, 0, 400000),
(9300239, 0, 120, 177, 0, 400000),
(9300240, 0, 132, 195, 0, 400000),
(9300241, 0, 282, 416, 0, 400000),
(9300242, 0, 301, 444, 0, 400000),
(9300243, 0, 190, 280, 0, 400000),
(9300244, 0, 190, 280, 0, 400000),
(9300245, 0, 217, 320, 0, 400000),
(9300246, 0, 231, 341, 0, 400000),
(9300247, 0, 255, 377, 0, 400000),
(9300248, 0, 264, 389, 0, 400000),
(9300249, 0, 301, 444, 0, 400000),
(9300250, 0, 355, 524, 0, 400000),
(9300251, 0, 332, 490, 0, 400000),
(9300252, 0, 132, 195, 0, 400000),
(9300253, 0, 156, 230, 0, 400000),
(9300254, 0, 332, 490, 0, 400000),
(9300255, 0, 141, 208, 0, 400000),
(9300256, 0, 217, 320, 0, 400000),
(9300257, 0, 217, 320, 0, 400000),
(9300258, 0, 255, 377, 0, 400000),
(9300259, 0, 58, 85, 0, 400000),
(9300260, 0, 418, 617, 0, 400000),
(9300261, 0, 544, 803, 0, 400000),
(9300262, 0, 544, 803, 0, 400000),
(9300263, 0, 544, 803, 0, 400000),
(9300264, 0, 764, 1115, 0, 400000),
(9300265, 0, 730, 1070, 0, 400000),
(9300266, 0, 933, 4590, 0, 400000),
(9300267, 0, 1254, 6170, 0, 400000),
(9300268, 0, 933, 4590, 0, 400000),
(9300269, 0, 174, 850, 0, 400000),
(9300270, 0, 418, 617, 0, 400000),
(9300274, 0, 39, 57, 0, 400000),
(9300315, 0, 483, 2370, 0, 400000),	# thanks Vcoc for noticing some Cygnus questline bosses dropping mesos
(9300316, 0, 516, 2540, 0, 400000),
(9300317, 0, 552, 2710, 0, 400000),
(9300318, 0, 588, 2890, 0, 400000),
(9300319, 0, 630, 3090, 0, 400000),
(9300320, 0, 672, 3300, 0, 400000),
(9300321, 0, 717, 3530, 0, 400000),
(9300322, 0, 765, 3770, 0, 400000),
(9300332, 0, 112, 165, 0, 400000),
(9300334, 0, 151, 222, 0, 400000),
(9300335, 0, 116, 171, 0, 400000),
(9300336, 0, 137, 201, 0, 400000),
(9300337, 0, 137, 201, 0, 400000),
(9300367, 0, 126, 610, 0, 400000),
(9300368, 0, 174, 850, 0, 400000),
(9300369, 0, 243, 1190, 0, 400000),
(9300370, 0, 336, 1650, 0, 400000),
(9300371, 0, 468, 2300, 0, 400000),
(9300372, 0, 651, 3200, 0, 400000),
(9300373, 0, 903, 4440, 0, 400000),
(9300374, 0, 1254, 6170, 0, 400000),
(9300375, 0, 1704, 8530, 0, 400000),
(9300376, 0, 1704, 8530, 0, 400000),
(9300377, 0, 2691, 12890, 0, 400000),
(9303000, 0, 42, 61, 0, 400000),
(9303001, 0, 42, 61, 0, 400000),
(9303003, 0, 42, 61, 0, 400000),
(9303004, 0, 42, 61, 0, 400000),
(9303005, 0, 71, 104, 0, 400000),
(9303006, 0, 71, 104, 0, 400000),
(9303007, 0, 71, 104, 0, 400000),
(9303008, 0, 71, 104, 0, 400000),
(9303009, 0, 161, 237, 0, 400000),
(9303010, 0, 161, 237, 0, 400000),
(9303011, 0, 161, 237, 0, 400000),
(9303013, 0, 432, 638, 0, 400000),
(9303014, 0, 432, 638, 0, 400000),
(9303016, 0, 432, 638, 0, 400000),
(9400009, 0, 7014, 8225, 0, 400000),
(9400012, 0, 217, 320, 0, 400000),
(9400120, 0, 1911, 9460, 0, 400000),
(9400122, 0, 1911, 9460, 0, 400000),
(9400200, 0, 184, 271, 0, 400000),
(9400203, 0, 112, 165, 0, 400000),
(9400205, 0, 1704, 8530, 0, 400000),
(9400238, 0, 81, 119, 0, 400000),
(9400239, 0, 66, 97, 0, 400000),
(9400241, 0, 38, 55, 0, 400000),
(9400242, 0, 42, 61, 0, 400000),
(9400243, 0, 184, 271, 0, 400000),
(9400244, 0, 210, 309, 0, 400000),
(9400245, 0, 66, 97, 0, 400000),
(9400246, 0, 62, 91, 0, 400000),
(9400247, 0, 81, 119, 0, 400000),
(9400248, 0, 66, 97, 0, 400000),
(9400500, 0, 93, 450, 0, 400000),
(9400501, 0, 35, 52, 0, 400000),
(9400502, 0, 105, 520, 0, 400000),
(9400503, 0, 105, 520, 0, 400000),
(9400504, 0, 31, 45, 0, 400000),
(9400538, 0, 56, 83, 0, 400000),
(9400539, 0, 60, 88, 0, 400000),
(9400540, 0, 68, 101, 0, 400000),
(9400541, 0, 68, 101, 0, 400000),
(9400542, 0, 98, 145, 0, 400000),
(9400543, 0, 116, 171, 0, 400000),
(9400544, 0, 156, 230, 0, 400000),
(9400546, 0, 128, 189, 0, 400000),
(9400547, 0, 73, 108, 0, 400000),
(9400548, 0, 81, 119, 0, 400000),
(9400550, 0, 73, 108, 0, 400000),
(9400556, 0, 60, 88, 0, 400000),
(9400558, 0, 81, 119, 0, 400000),
(9400560, 0, 156, 230, 0, 400000),
(9400561, 0, 217, 320, 0, 400000),
(9400562, 0, 217, 320, 0, 400000),
(9400563, 0, 112, 165, 0, 400000),
(9400565, 0, 60, 88, 0, 400000),
(9400570, 0, 49, 72, 0, 400000),
(9400571, 0, 468, 2300, 0, 400000),
(9400573, 0, 112, 165, 0, 400000),
(9400574, 0, 714, 1049, 0, 400000),
(9400576, 0, 301, 444, 0, 400000),
(9400578, 0, 568, 853, 0, 400000),
(9400579, 0, 714, 1049, 0, 400000),
(9400580, 0, 637, 946, 0, 400000),
(9400581, 0, 418, 617, 0, 400000),
(9400582, 0, 1127, 1583, 0, 400000),
(9400609, 0, 204, 1010, 0, 400000),
(9400610, 0, 204, 1010, 0, 400000),
(9400611, 0, 204, 1010, 0, 400000),
(9400612, 0, 204, 1010, 0, 400000),
(9400613, 0, 204, 1010, 0, 400000),
(9400623, 0, 204, 1010, 0, 400000),
(9400633, 0, 258, 1270, 0, 400000),
(9400644, 0, 42, 61, 0, 400000),
(9410014, 0, 493, 728, 0, 400000),
(9410015, 0, 1479, 7280, 0, 400000),
(9420507, 0, 146, 215, 0, 400000),
(9420527, 0, 132, 195, 0, 400000),
(9420528, 0, 141, 208, 0, 400000),
(9420529, 0, 167, 245, 0, 400000),
(9420530, 0, 190, 280, 0, 400000),
(9420531, 0, 210, 309, 0, 400000),
(9420532, 0, 210, 309, 0, 400000),
(9420533, 0, 224, 330, 0, 400000),
(9420534, 0, 255, 377, 0, 400000),
(9420535, 0, 282, 416, 0, 400000),
(9420536, 0, 321, 474, 0, 400000),
(9420537, 0, 355, 524, 0, 400000),
(9420538, 0, 446, 659, 0, 400000),
(9420539, 0, 526, 777, 0, 400000),
(9420545, 0, 210, 309, 0, 400000),
(9420550, 0, 210, 309, 0, 400000),
(9500101, 0, 38, 55, 0, 400000),
(9500102, 0, 39, 57, 0, 400000),
(9500103, 0, 49, 72, 0, 400000),
(9500104, 0, 44, 65, 0, 400000),
(9500105, 0, 49, 72, 0, 400000),
(9500106, 0, 62, 91, 0, 400000),
(9500107, 0, 81, 119, 0, 400000),
(9500108, 0, 86, 127, 0, 400000),
(9500109, 0, 86, 127, 0, 400000),
(9500110, 0, 95, 140, 0, 400000),
(9500111, 0, 95, 140, 0, 400000),
(9500112, 0, 95, 140, 0, 400000),
(9500113, 0, 98, 145, 0, 400000),
(9500115, 0, 102, 150, 0, 400000),
(9500116, 0, 112, 165, 0, 400000),
(9500117, 0, 98, 145, 0, 400000),
(9500118, 0, 109, 160, 0, 400000),
(9500119, 0, 109, 160, 0, 400000),
(9500120, 0, 132, 195, 0, 400000),
(9500121, 0, 146, 215, 0, 400000),
(9500122, 0, 151, 222, 0, 400000),
(9500123, 0, 210, 309, 0, 400000),
(9500124, 0, 651, 3200, 0, 400000),
(9500125, 0, 217, 320, 0, 400000),
(9500126, 0, 247, 365, 0, 400000),
(9500127, 0, 273, 402, 0, 400000),
(9500128, 0, 282, 416, 0, 400000),
(9500129, 0, 301, 444, 0, 400000),
(9500130, 0, 903, 4440, 0, 400000),
(9500131, 0, 332, 490, 0, 400000),
(9500132, 0, 355, 524, 0, 400000),
(9500134, 0, 418, 617, 0, 400000),
(9500135, 0, 493, 728, 0, 400000),
(9500136, 0, 682, 1006, 0, 400000),
(9500137, 0, 637, 946, 0, 400000),
(9500138, 0, 568, 853, 0, 400000),
(9500139, 0, 1254, 6170, 0, 400000),
(9500140, 0, 2142, 10490, 0, 400000),
(9500156, 0, 146, 215, 0, 400000),
(9500157, 0, 95, 140, 0, 400000),
(9500158, 0, 903, 4440, 0, 400000),
(9500159, 0, 903, 4440, 0, 400000),
(9500160, 0, 903, 4440, 0, 400000),
(9500161, 0, 418, 617, 0, 400000),
(9500162, 0, 418, 617, 0, 400000),
(9500163, 0, 461, 681, 0, 400000),
(9500164, 0, 544, 803, 0, 400000),
(9500165, 0, 544, 803, 0, 400000),
(9500166, 0, 544, 803, 0, 400000),
(9500178, 0, 112, 165, 0, 400000),
(9500180, 0, 1704, 8530, 0, 400000),
(9500181, 0, 1704, 8530, 0, 400000),
(9500306, 0, 174, 850, 0, 400000),
(9500307, 0, 285, 1400, 0, 400000),
(9500308, 0, 468, 2300, 0, 400000),
(9500309, 0, 552, 2710, 0, 400000),
(9500310, 0, 630, 3090, 0, 400000),
(9500311, 0, 765, 3770, 0, 400000),
(9500312, 0, 903, 4440, 0, 400000),
(9500313, 0, 933, 4590, 0, 400000),
(9500314, 0, 1137, 5590, 0, 400000),
(9500317, 0, 126, 610, 0, 400000),
(9500318, 0, 336, 1650, 0, 400000),
(9500319, 0, 903, 4440, 0, 400000),
(9500321, 0, 42, 61, 0, 400000),
(9500326, 0, 396, 1950, 0, 400000),
(9500327, 0, 243, 1190, 0, 400000),
(9500328, 0, 285, 1400, 0, 400000),
(9500331, 0, 552, 2710, 0, 400000),
(9500332, 0, 396, 1950, 0, 400000),
(9500333, 0, 468, 2300, 0, 400000),
(9500334, 0, 552, 2710, 0, 400000),
(9500335, 0, 468, 2300, 0, 400000),
(9500366, 0, 49, 72, 0, 400000),
(9500367, 0, 49, 72, 0, 400000),
(9500368, 0, 49, 72, 0, 400000),
(9500369, 0, 49, 72, 0, 400000),
(9500370, 0, 49, 72, 0, 400000),
(9500371, 0, 49, 72, 0, 400000),
(9500372, 0, 49, 72, 0, 400000);

  DELETE FROM drop_data WHERE dropperid >= 9300184 AND dropperid <= 9300215 AND itemid = 0;

  # MapleArrowFetcher! Set proper arrow quantity drop for the mobs.

UPDATE drop_data
SET minimum_quantity = CASE
                       WHEN dropperid = 100100 AND itemid = 2060000 THEN 1
                       WHEN dropperid = 100100 AND itemid = 2061000 THEN 1
                       WHEN dropperid = 100101 AND itemid = 2060000 THEN 2
                       WHEN dropperid = 100101 AND itemid = 2061000 THEN 2
                       WHEN dropperid = 100120 AND itemid = 2060000 THEN 1
                       WHEN dropperid = 100120 AND itemid = 2061000 THEN 1
                       WHEN dropperid = 100121 AND itemid = 2060000 THEN 4
                       WHEN dropperid = 100123 AND itemid = 2061000 THEN 9
                       WHEN dropperid = 100124 AND itemid = 2060000 THEN 11
                       WHEN dropperid = 100124 AND itemid = 2061000 THEN 11
                       WHEN dropperid = 120100 AND itemid = 2060000 THEN 2
                       WHEN dropperid = 120100 AND itemid = 2061000 THEN 2
                       WHEN dropperid = 130100 AND itemid = 2060000 THEN 5
                       WHEN dropperid = 130100 AND itemid = 2061000 THEN 5
                       WHEN dropperid = 130101 AND itemid = 2060000 THEN 5
                       WHEN dropperid = 130101 AND itemid = 2061000 THEN 5
                       WHEN dropperid = 210100 AND itemid = 2060000 THEN 7
                       WHEN dropperid = 210100 AND itemid = 2061000 THEN 7
                       WHEN dropperid = 1110100 AND itemid = 2060000 THEN 19
                       WHEN dropperid = 1110100 AND itemid = 2061000 THEN 19
                       WHEN dropperid = 1110101 AND itemid = 2060000 THEN 13
                       WHEN dropperid = 1110101 AND itemid = 2061000 THEN 13
                       WHEN dropperid = 1110130 AND itemid = 2060000 THEN 19
                       WHEN dropperid = 1110130 AND itemid = 2061000 THEN 19
                       WHEN dropperid = 1120100 AND itemid = 2060000 THEN 15
                       WHEN dropperid = 1120100 AND itemid = 2061000 THEN 15
                       WHEN dropperid = 1130100 AND itemid = 2060000 THEN 22
                       WHEN dropperid = 1130100 AND itemid = 2061000 THEN 22
                       WHEN dropperid = 1140100 AND itemid = 2060000 THEN 24
                       WHEN dropperid = 1140100 AND itemid = 2061000 THEN 24
                       WHEN dropperid = 1140130 AND itemid = 2060000 THEN 24
                       WHEN dropperid = 1140130 AND itemid = 2061000 THEN 24
                       WHEN dropperid = 1210100 AND itemid = 2060000 THEN 9
                       WHEN dropperid = 1210100 AND itemid = 2061000 THEN 9
                       WHEN dropperid = 1210101 AND itemid = 2060000 THEN 13
                       WHEN dropperid = 1210101 AND itemid = 2061000 THEN 13
                       WHEN dropperid = 1210102 AND itemid = 2060000 THEN 10
                       WHEN dropperid = 1210102 AND itemid = 2061000 THEN 10
                       WHEN dropperid = 1210103 AND itemid = 2060000 THEN 19
                       WHEN dropperid = 1210103 AND itemid = 2061000 THEN 19
                       WHEN dropperid = 2100100 AND itemid = 2060000 THEN 26
                       WHEN dropperid = 2100100 AND itemid = 2061000 THEN 26
                       WHEN dropperid = 2100101 AND itemid = 2060000 THEN 27
                       WHEN dropperid = 2100101 AND itemid = 2061000 THEN 27
                       WHEN dropperid = 2100102 AND itemid = 2060000 THEN 28
                       WHEN dropperid = 2100102 AND itemid = 2061000 THEN 28
                       WHEN dropperid = 2100103 AND itemid = 2060000 THEN 32
                       WHEN dropperid = 2100103 AND itemid = 2061000 THEN 32
                       WHEN dropperid = 2100104 AND itemid = 2060000 THEN 36
                       WHEN dropperid = 2100104 AND itemid = 2061000 THEN 36
                       WHEN dropperid = 2100105 AND itemid = 2060000 THEN 30
                       WHEN dropperid = 2100105 AND itemid = 2061000 THEN 30
                       WHEN dropperid = 2100106 AND itemid = 2060000 THEN 31
                       WHEN dropperid = 2100106 AND itemid = 2061000 THEN 31
                       WHEN dropperid = 2100107 AND itemid = 2060000 THEN 35
                       WHEN dropperid = 2100107 AND itemid = 2061000 THEN 35
                       WHEN dropperid = 2100108 AND itemid = 2060000 THEN 37
                       WHEN dropperid = 2100108 AND itemid = 2061000 THEN 37
                       WHEN dropperid = 2110200 AND itemid = 2060000 THEN 28
                       WHEN dropperid = 2110200 AND itemid = 2061000 THEN 28
                       WHEN dropperid = 2110300 AND itemid = 2060000 THEN 31
                       WHEN dropperid = 2110300 AND itemid = 2061000 THEN 31
                       WHEN dropperid = 2110301 AND itemid = 2060000 THEN 37
                       WHEN dropperid = 2110301 AND itemid = 2061000 THEN 37
                       WHEN dropperid = 2130100 AND itemid = 2060000 THEN 28
                       WHEN dropperid = 2130100 AND itemid = 2061000 THEN 28
                       WHEN dropperid = 2220000 AND itemid = 2060000 THEN 36
                       WHEN dropperid = 2220000 AND itemid = 2061000 THEN 36
                       WHEN dropperid = 2220100 AND itemid = 2060000 THEN 26
                       WHEN dropperid = 2220100 AND itemid = 2061000 THEN 26
                       WHEN dropperid = 2230100 AND itemid = 2060000 THEN 35
                       WHEN dropperid = 2230100 AND itemid = 2061000 THEN 35
                       WHEN dropperid = 2230101 AND itemid = 2060000 THEN 31
                       WHEN dropperid = 2230101 AND itemid = 2061000 THEN 31
                       WHEN dropperid = 2230102 AND itemid = 2060000 THEN 32
                       WHEN dropperid = 2230102 AND itemid = 2061000 THEN 32
                       WHEN dropperid = 2230103 AND itemid = 2060000 THEN 30
                       WHEN dropperid = 2230103 AND itemid = 2061000 THEN 30
                       WHEN dropperid = 2230104 AND itemid = 2060000 THEN 36
                       WHEN dropperid = 2230104 AND itemid = 2061000 THEN 36
                       WHEN dropperid = 2230105 AND itemid = 2060000 THEN 30
                       WHEN dropperid = 2230105 AND itemid = 2061000 THEN 30
                       WHEN dropperid = 2230106 AND itemid = 2060000 THEN 32
                       WHEN dropperid = 2230106 AND itemid = 2061000 THEN 32
                       WHEN dropperid = 2230107 AND itemid = 2060000 THEN 31
                       WHEN dropperid = 2230107 AND itemid = 2061000 THEN 31
                       WHEN dropperid = 2230108 AND itemid = 2060000 THEN 28
                       WHEN dropperid = 2230108 AND itemid = 2061000 THEN 28
                       WHEN dropperid = 2230109 AND itemid = 2060000 THEN 36
                       WHEN dropperid = 2230109 AND itemid = 2061000 THEN 36
                       WHEN dropperid = 2230110 AND itemid = 2060000 THEN 30
                       WHEN dropperid = 2230110 AND itemid = 2061000 THEN 30
                       WHEN dropperid = 2230111 AND itemid = 2060000 THEN 31
                       WHEN dropperid = 2230111 AND itemid = 2061000 THEN 31
                       WHEN dropperid = 2230131 AND itemid = 2060000 THEN 31
                       WHEN dropperid = 2230131 AND itemid = 2061000 THEN 31
                       WHEN dropperid = 2230200 AND itemid = 2060000 THEN 37
                       WHEN dropperid = 2230200 AND itemid = 2061000 THEN 37
                       WHEN dropperid = 2300100 AND itemid = 2060000 THEN 26
                       WHEN dropperid = 2300100 AND itemid = 2061000 THEN 26
                       WHEN dropperid = 3000000 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 3000000 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 3000005 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 3000005 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 3000006 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 3000006 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 3100101 AND itemid = 2060000 THEN 41
                       WHEN dropperid = 3100101 AND itemid = 2061000 THEN 41
                       WHEN dropperid = 3100102 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 3100102 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 3110101 AND itemid = 2060000 THEN 41
                       WHEN dropperid = 3110101 AND itemid = 2061000 THEN 41
                       WHEN dropperid = 3110102 AND itemid = 2060000 THEN 41
                       WHEN dropperid = 3110102 AND itemid = 2061000 THEN 41
                       WHEN dropperid = 3110300 AND itemid = 2060000 THEN 41
                       WHEN dropperid = 3110300 AND itemid = 2061000 THEN 41
                       WHEN dropperid = 3110301 AND itemid = 2060000 THEN 41
                       WHEN dropperid = 3110301 AND itemid = 2061000 THEN 41
                       WHEN dropperid = 3110302 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 3110302 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 3110303 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3110303 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3210100 AND itemid = 2060005 THEN 6
                       WHEN dropperid = 3210203 AND itemid = 2060000 THEN 47
                       WHEN dropperid = 3210203 AND itemid = 2061000 THEN 47
                       WHEN dropperid = 3210204 AND itemid = 2060000 THEN 44
                       WHEN dropperid = 3210204 AND itemid = 2061000 THEN 44
                       WHEN dropperid = 3210205 AND itemid = 2060000 THEN 44
                       WHEN dropperid = 3210205 AND itemid = 2061000 THEN 44
                       WHEN dropperid = 3210206 AND itemid = 2060000 THEN 47
                       WHEN dropperid = 3210206 AND itemid = 2061000 THEN 47
                       WHEN dropperid = 3210207 AND itemid = 2060000 THEN 44
                       WHEN dropperid = 3210207 AND itemid = 2060005 THEN 7
                       WHEN dropperid = 3210207 AND itemid = 2061000 THEN 44
                       WHEN dropperid = 3210208 AND itemid = 2060000 THEN 47
                       WHEN dropperid = 3210208 AND itemid = 2061000 THEN 47
                       WHEN dropperid = 3210450 AND itemid = 2060000 THEN 47
                       WHEN dropperid = 3210450 AND itemid = 2061000 THEN 47
                       WHEN dropperid = 3210800 AND itemid = 2060005 THEN 8
                       WHEN dropperid = 3220000 AND itemid = 2060000 THEN 63
                       WHEN dropperid = 3220000 AND itemid = 2061000 THEN 63
                       WHEN dropperid = 3230100 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 3230100 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 3230103 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3230103 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3230200 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 3230200 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 3230302 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 3230302 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 3230303 AND itemid = 2060000 THEN 48
                       WHEN dropperid = 3230303 AND itemid = 2061000 THEN 48
                       WHEN dropperid = 3230304 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3230304 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3230305 AND itemid = 2060000 THEN 51
                       WHEN dropperid = 3230305 AND itemid = 2061000 THEN 51
                       WHEN dropperid = 3230306 AND itemid = 2060000 THEN 48
                       WHEN dropperid = 3230306 AND itemid = 2061000 THEN 48
                       WHEN dropperid = 3230307 AND itemid = 2060000 THEN 40
                       WHEN dropperid = 3230307 AND itemid = 2061000 THEN 40
                       WHEN dropperid = 3230308 AND itemid = 2060000 THEN 51
                       WHEN dropperid = 3230308 AND itemid = 2061000 THEN 51
                       WHEN dropperid = 3230400 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 3230400 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 3230405 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3230405 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3300000 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 3300000 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 3300001 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 3300001 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 3300002 AND itemid = 2060000 THEN 40
                       WHEN dropperid = 3300002 AND itemid = 2061000 THEN 40
                       WHEN dropperid = 3300003 AND itemid = 2060000 THEN 41
                       WHEN dropperid = 3300003 AND itemid = 2061000 THEN 41
                       WHEN dropperid = 3300004 AND itemid = 2060000 THEN 43
                       WHEN dropperid = 3300004 AND itemid = 2061000 THEN 43
                       WHEN dropperid = 3300006 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 3300006 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 3300007 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 3300007 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 3300008 AND itemid = 2060000 THEN 69
                       WHEN dropperid = 3300008 AND itemid = 2061000 THEN 69
                       WHEN dropperid = 4110300 AND itemid = 2060000 THEN 54
                       WHEN dropperid = 4110300 AND itemid = 2061000 THEN 54
                       WHEN dropperid = 4110301 AND itemid = 2060000 THEN 58
                       WHEN dropperid = 4110301 AND itemid = 2061000 THEN 58
                       WHEN dropperid = 4130103 AND itemid = 2060000 THEN 85
                       WHEN dropperid = 4130103 AND itemid = 2061000 THEN 85
                       WHEN dropperid = 4230103 AND itemid = 2060000 THEN 54
                       WHEN dropperid = 4230103 AND itemid = 2061000 THEN 54
                       WHEN dropperid = 4230106 AND itemid = 2060000 THEN 58
                       WHEN dropperid = 4230106 AND itemid = 2061000 THEN 58
                       WHEN dropperid = 4230108 AND itemid = 2060000 THEN 56
                       WHEN dropperid = 4230108 AND itemid = 2061000 THEN 56
                       WHEN dropperid = 4230109 AND itemid = 2060000 THEN 54
                       WHEN dropperid = 4230109 AND itemid = 2061000 THEN 54
                       WHEN dropperid = 4230110 AND itemid = 2060000 THEN 58
                       WHEN dropperid = 4230110 AND itemid = 2061000 THEN 58
                       WHEN dropperid = 4230111 AND itemid = 2060000 THEN 53
                       WHEN dropperid = 4230111 AND itemid = 2061000 THEN 53
                       WHEN dropperid = 4230112 AND itemid = 2060000 THEN 57
                       WHEN dropperid = 4230112 AND itemid = 2061000 THEN 57
                       WHEN dropperid = 4230113 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 4230113 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 4230114 AND itemid = 2060000 THEN 53
                       WHEN dropperid = 4230114 AND itemid = 2061000 THEN 53
                       WHEN dropperid = 4230115 AND itemid = 2060000 THEN 60
                       WHEN dropperid = 4230115 AND itemid = 2061000 THEN 60
                       WHEN dropperid = 4230116 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 4230116 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 4230117 AND itemid = 2060000 THEN 54
                       WHEN dropperid = 4230117 AND itemid = 2061000 THEN 54
                       WHEN dropperid = 4230118 AND itemid = 2060000 THEN 58
                       WHEN dropperid = 4230118 AND itemid = 2061000 THEN 58
                       WHEN dropperid = 4230119 AND itemid = 2060000 THEN 53
                       WHEN dropperid = 4230119 AND itemid = 2061000 THEN 53
                       WHEN dropperid = 4230120 AND itemid = 2060000 THEN 57
                       WHEN dropperid = 4230120 AND itemid = 2061000 THEN 57
                       WHEN dropperid = 4230121 AND itemid = 2060000 THEN 60
                       WHEN dropperid = 4230121 AND itemid = 2061000 THEN 60
                       WHEN dropperid = 4230123 AND itemid = 2060000 THEN 56
                       WHEN dropperid = 4230123 AND itemid = 2061000 THEN 56
                       WHEN dropperid = 4230124 AND itemid = 2060000 THEN 54
                       WHEN dropperid = 4230124 AND itemid = 2061000 THEN 54
                       WHEN dropperid = 4230125 AND itemid = 2060000 THEN 57
                       WHEN dropperid = 4230125 AND itemid = 2061000 THEN 57
                       WHEN dropperid = 4230126 AND itemid = 2060000 THEN 61
                       WHEN dropperid = 4230126 AND itemid = 2061000 THEN 61
                       WHEN dropperid = 4230201 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 4230201 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 4230300 AND itemid = 2060000 THEN 58
                       WHEN dropperid = 4230300 AND itemid = 2061000 THEN 58
                       WHEN dropperid = 4230400 AND itemid = 2060000 THEN 58
                       WHEN dropperid = 4230400 AND itemid = 2061000 THEN 58
                       WHEN dropperid = 4230500 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 4230500 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 4230501 AND itemid = 2060000 THEN 53
                       WHEN dropperid = 4230501 AND itemid = 2061000 THEN 53
                       WHEN dropperid = 4230502 AND itemid = 2060000 THEN 56
                       WHEN dropperid = 4230502 AND itemid = 2061000 THEN 56
                       WHEN dropperid = 4230503 AND itemid = 2060000 THEN 58
                       WHEN dropperid = 4230503 AND itemid = 2061000 THEN 58
                       WHEN dropperid = 4230504 AND itemid = 2060000 THEN 58
                       WHEN dropperid = 4230504 AND itemid = 2061000 THEN 58
                       WHEN dropperid = 4230600 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 4230600 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 4240000 AND itemid = 2060000 THEN 64
                       WHEN dropperid = 4240000 AND itemid = 2061000 THEN 64
                       WHEN dropperid = 5120100 AND itemid = 2060000 THEN 98
                       WHEN dropperid = 5120100 AND itemid = 2061000 THEN 98
                       WHEN dropperid = 5130104 AND itemid = 2060000 THEN 71
                       WHEN dropperid = 5130104 AND itemid = 2061000 THEN 71
                       WHEN dropperid = 5140000 AND itemid = 2060000 THEN 75
                       WHEN dropperid = 5140000 AND itemid = 2061000 THEN 75
                       WHEN dropperid = 5150000 AND itemid = 2060000 THEN 77
                       WHEN dropperid = 5150000 AND itemid = 2061000 THEN 77
                       WHEN dropperid = 5200000 AND itemid = 2060001 THEN 15
                       WHEN dropperid = 5200000 AND itemid = 2061001 THEN 15
                       WHEN dropperid = 5200001 AND itemid = 2060001 THEN 19
                       WHEN dropperid = 5200001 AND itemid = 2061001 THEN 19
                       WHEN dropperid = 5200002 AND itemid = 2060001 THEN 19
                       WHEN dropperid = 5200002 AND itemid = 2061001 THEN 19
                       WHEN dropperid = 5220000 AND itemid = 2060000 THEN 100
                       WHEN dropperid = 5220000 AND itemid = 2061000 THEN 100
                       WHEN dropperid = 5220002 AND itemid = 2060000 THEN 91
                       WHEN dropperid = 5220002 AND itemid = 2061000 THEN 91
                       WHEN dropperid = 5220003 AND itemid = 2060000 THEN 107
                       WHEN dropperid = 5220003 AND itemid = 2061000 THEN 107
                       WHEN dropperid = 5400000 AND itemid = 2060001 THEN 22
                       WHEN dropperid = 5400000 AND itemid = 2061001 THEN 22
                       WHEN dropperid = 6220000 AND itemid = 2060000 THEN 118
                       WHEN dropperid = 6220000 AND itemid = 2061000 THEN 118
                       WHEN dropperid = 7120103 AND itemid = 2060003 THEN 22
                       WHEN dropperid = 7220000 AND itemid = 2060001 THEN 64
                       WHEN dropperid = 7220000 AND itemid = 2061001 THEN 64
                       WHEN dropperid = 7220001 AND itemid = 2060001 THEN 63
                       WHEN dropperid = 7220001 AND itemid = 2061001 THEN 63
                       WHEN dropperid = 7220002 AND itemid = 2060001 THEN 70
                       WHEN dropperid = 7220002 AND itemid = 2061001 THEN 70
                       WHEN dropperid = 8220000 AND itemid = 2060001 THEN 75
                       WHEN dropperid = 8220000 AND itemid = 2061001 THEN 75
                       WHEN dropperid = 8220001 AND itemid = 2060001 THEN 82
                       WHEN dropperid = 8220001 AND itemid = 2061001 THEN 82
                       WHEN dropperid = 9300011 AND itemid = 2060000 THEN 51
                       WHEN dropperid = 9300011 AND itemid = 2061000 THEN 51
                       WHEN dropperid = 9300060 AND itemid = 2060000 THEN 54
                       WHEN dropperid = 9300060 AND itemid = 2061000 THEN 54
                       WHEN dropperid = 9300131 AND itemid = 2060000 THEN 51
                       WHEN dropperid = 9300131 AND itemid = 2061000 THEN 51
                       WHEN dropperid = 9300132 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 9300132 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 9300133 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 9300160 AND itemid = 2060000 THEN 82
                       WHEN dropperid = 9300160 AND itemid = 2061000 THEN 82
                       WHEN dropperid = 9300161 AND itemid = 2060000 THEN 82
                       WHEN dropperid = 9300161 AND itemid = 2061000 THEN 82
                       WHEN dropperid = 9300274 AND itemid = 2060000 THEN 10
                       WHEN dropperid = 9300274 AND itemid = 2061000 THEN 10
                       WHEN dropperid = 9300332 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 9300334 AND itemid = 2060000 THEN 64
                       WHEN dropperid = 9300341 AND itemid = 2060000 THEN 7
                       WHEN dropperid = 9300341 AND itemid = 2061000 THEN 7
                       WHEN dropperid = 9300342 AND itemid = 2060000 THEN 10
                       WHEN dropperid = 9300342 AND itemid = 2061000 THEN 10
                       WHEN dropperid = 9300343 AND itemid = 2060000 THEN 9
                       WHEN dropperid = 9300343 AND itemid = 2061000 THEN 9
                       WHEN dropperid = 9303005 AND itemid = 2060001 THEN 17
                       WHEN dropperid = 9303005 AND itemid = 2061001 THEN 17
                       WHEN dropperid = 9303008 AND itemid = 2060001 THEN 17
                       WHEN dropperid = 9303008 AND itemid = 2061001 THEN 17
                       WHEN dropperid = 9303009 AND itemid = 2060001 THEN 33
                       WHEN dropperid = 9303009 AND itemid = 2061001 THEN 33
                       WHEN dropperid = 9400000 AND itemid = 2060001 THEN 16
                       WHEN dropperid = 9400009 AND itemid = 2060001 THEN 130
                       WHEN dropperid = 9400011 AND itemid = 2060002 THEN 17
                       WHEN dropperid = 9400100 AND itemid = 2060003 THEN 14
                       WHEN dropperid = 9400101 AND itemid = 2061003 THEN 15
                       WHEN dropperid = 9400204 AND itemid = 2060003 THEN 17
                       WHEN dropperid = 9400239 AND itemid = 2060000 THEN 31
                       WHEN dropperid = 9400239 AND itemid = 2061000 THEN 31
                       WHEN dropperid = 9400244 AND itemid = 2060000 THEN 77
                       WHEN dropperid = 9400244 AND itemid = 2061000 THEN 77
                       WHEN dropperid = 9400248 AND itemid = 2060000 THEN 31
                       WHEN dropperid = 9400248 AND itemid = 2061000 THEN 31
                       WHEN dropperid = 9400540 AND itemid = 2060004 THEN 6
                       WHEN dropperid = 9400540 AND itemid = 2061004 THEN 6
                       WHEN dropperid = 9400541 AND itemid = 2060004 THEN 6
                       WHEN dropperid = 9400541 AND itemid = 2061004 THEN 6
                       WHEN dropperid = 9400542 AND itemid = 2060004 THEN 9
                       WHEN dropperid = 9400542 AND itemid = 2061004 THEN 9
                       WHEN dropperid = 9400543 AND itemid = 2060004 THEN 10
                       WHEN dropperid = 9400543 AND itemid = 2061004 THEN 10
                       WHEN dropperid = 9400547 AND itemid = 2060000 THEN 35
                       WHEN dropperid = 9400547 AND itemid = 2061000 THEN 35
                       WHEN dropperid = 9400548 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 9400548 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 9400550 AND itemid = 2060000 THEN 35
                       WHEN dropperid = 9400550 AND itemid = 2061000 THEN 35
                       WHEN dropperid = 9400558 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 9400558 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 9400563 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 9400563 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 9400638 AND itemid = 2060000 THEN 26
                       WHEN dropperid = 9400638 AND itemid = 2061000 THEN 26
                       WHEN dropperid = 9420500 AND itemid = 2060000 THEN 36
                       WHEN dropperid = 9420500 AND itemid = 2061000 THEN 36
                       WHEN dropperid = 9420502 AND itemid = 2060000 THEN 23
                       WHEN dropperid = 9420502 AND itemid = 2061000 THEN 23
                       WHEN dropperid = 9420506 AND itemid = 2060000 THEN 30
                       WHEN dropperid = 9420506 AND itemid = 2061000 THEN 30
                       WHEN dropperid = 9420508 AND itemid = 2060000 THEN 56
                       WHEN dropperid = 9420508 AND itemid = 2061000 THEN 56
                       WHEN dropperid = 9420527 AND itemid = 2060001 THEN 29
                       WHEN dropperid = 9420527 AND itemid = 2061001 THEN 29
                       WHEN dropperid = 9420531 AND itemid = 2060001 THEN 38
                       WHEN dropperid = 9420531 AND itemid = 2061001 THEN 38
                       WHEN dropperid = 9500112 AND itemid = 2060001 THEN 22
                       WHEN dropperid = 9500112 AND itemid = 2061001 THEN 22
                       WHEN dropperid = 9500119 AND itemid = 2060000 THEN 51
                       WHEN dropperid = 9500119 AND itemid = 2061000 THEN 51
                       WHEN dropperid = 9500120 AND itemid = 2060000 THEN 58
                       WHEN dropperid = 9500120 AND itemid = 2061000 THEN 58
                       WHEN dropperid = 9500122 AND itemid = 2060000 THEN 64
                       WHEN dropperid = 9500123 AND itemid = 2060000 THEN 77
                       WHEN dropperid = 9500123 AND itemid = 2061000 THEN 77
                       WHEN dropperid = 9500308 AND itemid = 2060000 THEN 91
                       WHEN dropperid = 9500308 AND itemid = 2061000 THEN 91
                       WHEN dropperid = 9500310 AND itemid = 2060000 THEN 107
                       WHEN dropperid = 9500310 AND itemid = 2061000 THEN 107
                       WHEN dropperid = 9500312 AND itemid = 2060001 THEN 63
                       WHEN dropperid = 9500312 AND itemid = 2061001 THEN 63
                       WHEN dropperid = 9500313 AND itemid = 2060001 THEN 64
                       WHEN dropperid = 9500313 AND itemid = 2061001 THEN 64
                       WHEN dropperid = 9500314 AND itemid = 2060001 THEN 70
                       WHEN dropperid = 9500314 AND itemid = 2061001 THEN 70
                       WHEN dropperid = 9500321 AND itemid = 2060001 THEN 6
                       WHEN dropperid = 9500321 AND itemid = 2061001 THEN 6
                       WHEN dropperid = 9500366 AND itemid = 2060000 THEN 19
                       WHEN dropperid = 9500369 AND itemid = 2060000 THEN 19
  ELSE minimum_quantity END,
    maximum_quantity = CASE
                       WHEN dropperid = 100100 AND itemid = 2060000 THEN 2
                       WHEN dropperid = 100100 AND itemid = 2061000 THEN 2
                       WHEN dropperid = 100101 AND itemid = 2060000 THEN 3
                       WHEN dropperid = 100101 AND itemid = 2061000 THEN 3
                       WHEN dropperid = 100120 AND itemid = 2060000 THEN 2
                       WHEN dropperid = 100120 AND itemid = 2061000 THEN 2
                       WHEN dropperid = 100121 AND itemid = 2060000 THEN 5
                       WHEN dropperid = 100123 AND itemid = 2061000 THEN 12
                       WHEN dropperid = 100124 AND itemid = 2060000 THEN 14
                       WHEN dropperid = 100124 AND itemid = 2061000 THEN 14
                       WHEN dropperid = 120100 AND itemid = 2060000 THEN 3
                       WHEN dropperid = 120100 AND itemid = 2061000 THEN 3
                       WHEN dropperid = 130100 AND itemid = 2060000 THEN 7
                       WHEN dropperid = 130100 AND itemid = 2061000 THEN 7
                       WHEN dropperid = 130101 AND itemid = 2060000 THEN 7
                       WHEN dropperid = 130101 AND itemid = 2061000 THEN 7
                       WHEN dropperid = 210100 AND itemid = 2060000 THEN 9
                       WHEN dropperid = 210100 AND itemid = 2061000 THEN 9
                       WHEN dropperid = 1110100 AND itemid = 2060000 THEN 24
                       WHEN dropperid = 1110100 AND itemid = 2061000 THEN 24
                       WHEN dropperid = 1110101 AND itemid = 2060000 THEN 17
                       WHEN dropperid = 1110101 AND itemid = 2061000 THEN 17
                       WHEN dropperid = 1110130 AND itemid = 2060000 THEN 24
                       WHEN dropperid = 1110130 AND itemid = 2061000 THEN 24
                       WHEN dropperid = 1120100 AND itemid = 2060000 THEN 19
                       WHEN dropperid = 1120100 AND itemid = 2061000 THEN 19
                       WHEN dropperid = 1130100 AND itemid = 2060000 THEN 28
                       WHEN dropperid = 1130100 AND itemid = 2061000 THEN 28
                       WHEN dropperid = 1140100 AND itemid = 2060000 THEN 30
                       WHEN dropperid = 1140100 AND itemid = 2061000 THEN 30
                       WHEN dropperid = 1140130 AND itemid = 2060000 THEN 30
                       WHEN dropperid = 1140130 AND itemid = 2061000 THEN 30
                       WHEN dropperid = 1210100 AND itemid = 2060000 THEN 12
                       WHEN dropperid = 1210100 AND itemid = 2061000 THEN 12
                       WHEN dropperid = 1210101 AND itemid = 2060000 THEN 17
                       WHEN dropperid = 1210101 AND itemid = 2061000 THEN 17
                       WHEN dropperid = 1210102 AND itemid = 2060000 THEN 13
                       WHEN dropperid = 1210102 AND itemid = 2061000 THEN 13
                       WHEN dropperid = 1210103 AND itemid = 2060000 THEN 24
                       WHEN dropperid = 1210103 AND itemid = 2061000 THEN 24
                       WHEN dropperid = 2100100 AND itemid = 2060000 THEN 33
                       WHEN dropperid = 2100100 AND itemid = 2061000 THEN 33
                       WHEN dropperid = 2100101 AND itemid = 2060000 THEN 34
                       WHEN dropperid = 2100101 AND itemid = 2061000 THEN 34
                       WHEN dropperid = 2100102 AND itemid = 2060000 THEN 35
                       WHEN dropperid = 2100102 AND itemid = 2061000 THEN 35
                       WHEN dropperid = 2100103 AND itemid = 2060000 THEN 40
                       WHEN dropperid = 2100103 AND itemid = 2061000 THEN 40
                       WHEN dropperid = 2100104 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 2100104 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 2100105 AND itemid = 2060000 THEN 38
                       WHEN dropperid = 2100105 AND itemid = 2061000 THEN 38
                       WHEN dropperid = 2100106 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 2100106 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 2100107 AND itemid = 2060000 THEN 44
                       WHEN dropperid = 2100107 AND itemid = 2061000 THEN 44
                       WHEN dropperid = 2100108 AND itemid = 2060000 THEN 47
                       WHEN dropperid = 2100108 AND itemid = 2061000 THEN 47
                       WHEN dropperid = 2110200 AND itemid = 2060000 THEN 35
                       WHEN dropperid = 2110200 AND itemid = 2061000 THEN 35
                       WHEN dropperid = 2110300 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 2110300 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 2110301 AND itemid = 2060000 THEN 47
                       WHEN dropperid = 2110301 AND itemid = 2061000 THEN 47
                       WHEN dropperid = 2130100 AND itemid = 2060000 THEN 35
                       WHEN dropperid = 2130100 AND itemid = 2061000 THEN 35
                       WHEN dropperid = 2220000 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 2220000 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 2220100 AND itemid = 2060000 THEN 33
                       WHEN dropperid = 2220100 AND itemid = 2061000 THEN 33
                       WHEN dropperid = 2230100 AND itemid = 2060000 THEN 44
                       WHEN dropperid = 2230100 AND itemid = 2061000 THEN 44
                       WHEN dropperid = 2230101 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 2230101 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 2230102 AND itemid = 2060000 THEN 40
                       WHEN dropperid = 2230102 AND itemid = 2061000 THEN 40
                       WHEN dropperid = 2230103 AND itemid = 2060000 THEN 38
                       WHEN dropperid = 2230103 AND itemid = 2061000 THEN 38
                       WHEN dropperid = 2230104 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 2230104 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 2230105 AND itemid = 2060000 THEN 38
                       WHEN dropperid = 2230105 AND itemid = 2061000 THEN 38
                       WHEN dropperid = 2230106 AND itemid = 2060000 THEN 40
                       WHEN dropperid = 2230106 AND itemid = 2061000 THEN 40
                       WHEN dropperid = 2230107 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 2230107 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 2230108 AND itemid = 2060000 THEN 35
                       WHEN dropperid = 2230108 AND itemid = 2061000 THEN 35
                       WHEN dropperid = 2230109 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 2230109 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 2230110 AND itemid = 2060000 THEN 38
                       WHEN dropperid = 2230110 AND itemid = 2061000 THEN 38
                       WHEN dropperid = 2230111 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 2230111 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 2230131 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 2230131 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 2230200 AND itemid = 2060000 THEN 47
                       WHEN dropperid = 2230200 AND itemid = 2061000 THEN 47
                       WHEN dropperid = 2300100 AND itemid = 2060000 THEN 33
                       WHEN dropperid = 2300100 AND itemid = 2061000 THEN 33
                       WHEN dropperid = 3000000 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3000000 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3000005 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3000005 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3000006 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3000006 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3100101 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 3100101 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 3100102 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3100102 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3110101 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 3110101 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 3110102 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 3110102 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 3110300 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 3110300 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 3110301 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 3110301 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 3110302 AND itemid = 2060000 THEN 57
                       WHEN dropperid = 3110302 AND itemid = 2061000 THEN 57
                       WHEN dropperid = 3110303 AND itemid = 2060000 THEN 62
                       WHEN dropperid = 3110303 AND itemid = 2061000 THEN 62
                       WHEN dropperid = 3210100 AND itemid = 2060005 THEN 8
                       WHEN dropperid = 3210203 AND itemid = 2060000 THEN 59
                       WHEN dropperid = 3210203 AND itemid = 2061000 THEN 59
                       WHEN dropperid = 3210204 AND itemid = 2060000 THEN 55
                       WHEN dropperid = 3210204 AND itemid = 2061000 THEN 55
                       WHEN dropperid = 3210205 AND itemid = 2060000 THEN 55
                       WHEN dropperid = 3210205 AND itemid = 2061000 THEN 55
                       WHEN dropperid = 3210206 AND itemid = 2060000 THEN 59
                       WHEN dropperid = 3210206 AND itemid = 2061000 THEN 59
                       WHEN dropperid = 3210207 AND itemid = 2060000 THEN 55
                       WHEN dropperid = 3210207 AND itemid = 2060005 THEN 9
                       WHEN dropperid = 3210207 AND itemid = 2061000 THEN 55
                       WHEN dropperid = 3210208 AND itemid = 2060000 THEN 59
                       WHEN dropperid = 3210208 AND itemid = 2061000 THEN 59
                       WHEN dropperid = 3210450 AND itemid = 2060000 THEN 59
                       WHEN dropperid = 3210450 AND itemid = 2061000 THEN 59
                       WHEN dropperid = 3210800 AND itemid = 2060005 THEN 10
                       WHEN dropperid = 3220000 AND itemid = 2060000 THEN 79
                       WHEN dropperid = 3220000 AND itemid = 2061000 THEN 79
                       WHEN dropperid = 3230100 AND itemid = 2060000 THEN 57
                       WHEN dropperid = 3230100 AND itemid = 2061000 THEN 57
                       WHEN dropperid = 3230103 AND itemid = 2060000 THEN 62
                       WHEN dropperid = 3230103 AND itemid = 2061000 THEN 62
                       WHEN dropperid = 3230200 AND itemid = 2060000 THEN 57
                       WHEN dropperid = 3230200 AND itemid = 2061000 THEN 57
                       WHEN dropperid = 3230302 AND itemid = 2060000 THEN 57
                       WHEN dropperid = 3230302 AND itemid = 2061000 THEN 57
                       WHEN dropperid = 3230303 AND itemid = 2060000 THEN 60
                       WHEN dropperid = 3230303 AND itemid = 2061000 THEN 60
                       WHEN dropperid = 3230304 AND itemid = 2060000 THEN 62
                       WHEN dropperid = 3230304 AND itemid = 2061000 THEN 62
                       WHEN dropperid = 3230305 AND itemid = 2060000 THEN 64
                       WHEN dropperid = 3230305 AND itemid = 2061000 THEN 64
                       WHEN dropperid = 3230306 AND itemid = 2060000 THEN 60
                       WHEN dropperid = 3230306 AND itemid = 2061000 THEN 60
                       WHEN dropperid = 3230307 AND itemid = 2060000 THEN 50
                       WHEN dropperid = 3230307 AND itemid = 2061000 THEN 50
                       WHEN dropperid = 3230308 AND itemid = 2060000 THEN 64
                       WHEN dropperid = 3230308 AND itemid = 2061000 THEN 64
                       WHEN dropperid = 3230400 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3230400 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3230405 AND itemid = 2060000 THEN 62
                       WHEN dropperid = 3230405 AND itemid = 2061000 THEN 62
                       WHEN dropperid = 3300000 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3300000 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3300001 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 3300001 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 3300002 AND itemid = 2060000 THEN 50
                       WHEN dropperid = 3300002 AND itemid = 2061000 THEN 50
                       WHEN dropperid = 3300003 AND itemid = 2060000 THEN 52
                       WHEN dropperid = 3300003 AND itemid = 2061000 THEN 52
                       WHEN dropperid = 3300004 AND itemid = 2060000 THEN 54
                       WHEN dropperid = 3300004 AND itemid = 2061000 THEN 54
                       WHEN dropperid = 3300006 AND itemid = 2060000 THEN 57
                       WHEN dropperid = 3300006 AND itemid = 2061000 THEN 57
                       WHEN dropperid = 3300007 AND itemid = 2060000 THEN 57
                       WHEN dropperid = 3300007 AND itemid = 2061000 THEN 57
                       WHEN dropperid = 3300008 AND itemid = 2060000 THEN 87
                       WHEN dropperid = 3300008 AND itemid = 2061000 THEN 87
                       WHEN dropperid = 4110300 AND itemid = 2060000 THEN 68
                       WHEN dropperid = 4110300 AND itemid = 2061000 THEN 68
                       WHEN dropperid = 4110301 AND itemid = 2060000 THEN 73
                       WHEN dropperid = 4110301 AND itemid = 2061000 THEN 73
                       WHEN dropperid = 4130103 AND itemid = 2060000 THEN 107
                       WHEN dropperid = 4130103 AND itemid = 2061000 THEN 107
                       WHEN dropperid = 4230103 AND itemid = 2060000 THEN 68
                       WHEN dropperid = 4230103 AND itemid = 2061000 THEN 68
                       WHEN dropperid = 4230106 AND itemid = 2060000 THEN 73
                       WHEN dropperid = 4230106 AND itemid = 2061000 THEN 73
                       WHEN dropperid = 4230108 AND itemid = 2060000 THEN 70
                       WHEN dropperid = 4230108 AND itemid = 2061000 THEN 70
                       WHEN dropperid = 4230109 AND itemid = 2060000 THEN 68
                       WHEN dropperid = 4230109 AND itemid = 2061000 THEN 68
                       WHEN dropperid = 4230110 AND itemid = 2060000 THEN 73
                       WHEN dropperid = 4230110 AND itemid = 2061000 THEN 73
                       WHEN dropperid = 4230111 AND itemid = 2060000 THEN 67
                       WHEN dropperid = 4230111 AND itemid = 2061000 THEN 67
                       WHEN dropperid = 4230112 AND itemid = 2060000 THEN 72
                       WHEN dropperid = 4230112 AND itemid = 2061000 THEN 72
                       WHEN dropperid = 4230113 AND itemid = 2060000 THEN 65
                       WHEN dropperid = 4230113 AND itemid = 2061000 THEN 65
                       WHEN dropperid = 4230114 AND itemid = 2060000 THEN 67
                       WHEN dropperid = 4230114 AND itemid = 2061000 THEN 67
                       WHEN dropperid = 4230115 AND itemid = 2060000 THEN 75
                       WHEN dropperid = 4230115 AND itemid = 2061000 THEN 75
                       WHEN dropperid = 4230116 AND itemid = 2060000 THEN 65
                       WHEN dropperid = 4230116 AND itemid = 2061000 THEN 65
                       WHEN dropperid = 4230117 AND itemid = 2060000 THEN 68
                       WHEN dropperid = 4230117 AND itemid = 2061000 THEN 68
                       WHEN dropperid = 4230118 AND itemid = 2060000 THEN 73
                       WHEN dropperid = 4230118 AND itemid = 2061000 THEN 73
                       WHEN dropperid = 4230119 AND itemid = 2060000 THEN 67
                       WHEN dropperid = 4230119 AND itemid = 2061000 THEN 67
                       WHEN dropperid = 4230120 AND itemid = 2060000 THEN 72
                       WHEN dropperid = 4230120 AND itemid = 2061000 THEN 72
                       WHEN dropperid = 4230121 AND itemid = 2060000 THEN 75
                       WHEN dropperid = 4230121 AND itemid = 2061000 THEN 75
                       WHEN dropperid = 4230123 AND itemid = 2060000 THEN 70
                       WHEN dropperid = 4230123 AND itemid = 2061000 THEN 70
                       WHEN dropperid = 4230124 AND itemid = 2060000 THEN 68
                       WHEN dropperid = 4230124 AND itemid = 2061000 THEN 68
                       WHEN dropperid = 4230125 AND itemid = 2060000 THEN 72
                       WHEN dropperid = 4230125 AND itemid = 2061000 THEN 72
                       WHEN dropperid = 4230126 AND itemid = 2060000 THEN 77
                       WHEN dropperid = 4230126 AND itemid = 2061000 THEN 77
                       WHEN dropperid = 4230201 AND itemid = 2060000 THEN 65
                       WHEN dropperid = 4230201 AND itemid = 2061000 THEN 65
                       WHEN dropperid = 4230300 AND itemid = 2060000 THEN 73
                       WHEN dropperid = 4230300 AND itemid = 2061000 THEN 73
                       WHEN dropperid = 4230400 AND itemid = 2060000 THEN 73
                       WHEN dropperid = 4230400 AND itemid = 2061000 THEN 73
                       WHEN dropperid = 4230500 AND itemid = 2060000 THEN 65
                       WHEN dropperid = 4230500 AND itemid = 2061000 THEN 65
                       WHEN dropperid = 4230501 AND itemid = 2060000 THEN 67
                       WHEN dropperid = 4230501 AND itemid = 2061000 THEN 67
                       WHEN dropperid = 4230502 AND itemid = 2060000 THEN 70
                       WHEN dropperid = 4230502 AND itemid = 2061000 THEN 70
                       WHEN dropperid = 4230503 AND itemid = 2060000 THEN 73
                       WHEN dropperid = 4230503 AND itemid = 2061000 THEN 73
                       WHEN dropperid = 4230504 AND itemid = 2060000 THEN 73
                       WHEN dropperid = 4230504 AND itemid = 2061000 THEN 73
                       WHEN dropperid = 4230600 AND itemid = 2060000 THEN 65
                       WHEN dropperid = 4230600 AND itemid = 2061000 THEN 65
                       WHEN dropperid = 4240000 AND itemid = 2060000 THEN 80
                       WHEN dropperid = 4240000 AND itemid = 2061000 THEN 80
                       WHEN dropperid = 5120100 AND itemid = 2060000 THEN 123
                       WHEN dropperid = 5120100 AND itemid = 2061000 THEN 123
                       WHEN dropperid = 5130104 AND itemid = 2060000 THEN 89
                       WHEN dropperid = 5130104 AND itemid = 2061000 THEN 89
                       WHEN dropperid = 5140000 AND itemid = 2060000 THEN 94
                       WHEN dropperid = 5140000 AND itemid = 2061000 THEN 94
                       WHEN dropperid = 5150000 AND itemid = 2060000 THEN 97
                       WHEN dropperid = 5150000 AND itemid = 2061000 THEN 97
                       WHEN dropperid = 5200000 AND itemid = 2060001 THEN 19
                       WHEN dropperid = 5200000 AND itemid = 2061001 THEN 19
                       WHEN dropperid = 5200001 AND itemid = 2060001 THEN 24
                       WHEN dropperid = 5200001 AND itemid = 2061001 THEN 24
                       WHEN dropperid = 5200002 AND itemid = 2060001 THEN 24
                       WHEN dropperid = 5200002 AND itemid = 2061001 THEN 24
                       WHEN dropperid = 5220000 AND itemid = 2060000 THEN 125
                       WHEN dropperid = 5220000 AND itemid = 2061000 THEN 125
                       WHEN dropperid = 5220002 AND itemid = 2060000 THEN 114
                       WHEN dropperid = 5220002 AND itemid = 2061000 THEN 114
                       WHEN dropperid = 5220003 AND itemid = 2060000 THEN 134
                       WHEN dropperid = 5220003 AND itemid = 2061000 THEN 134
                       WHEN dropperid = 5400000 AND itemid = 2060001 THEN 28
                       WHEN dropperid = 5400000 AND itemid = 2061001 THEN 28
                       WHEN dropperid = 6220000 AND itemid = 2060000 THEN 148
                       WHEN dropperid = 6220000 AND itemid = 2061000 THEN 148
                       WHEN dropperid = 7120103 AND itemid = 2060003 THEN 28
                       WHEN dropperid = 7220000 AND itemid = 2060001 THEN 81
                       WHEN dropperid = 7220000 AND itemid = 2061001 THEN 81
                       WHEN dropperid = 7220001 AND itemid = 2060001 THEN 79
                       WHEN dropperid = 7220001 AND itemid = 2061001 THEN 79
                       WHEN dropperid = 7220002 AND itemid = 2060001 THEN 87
                       WHEN dropperid = 7220002 AND itemid = 2061001 THEN 87
                       WHEN dropperid = 8220000 AND itemid = 2060001 THEN 94
                       WHEN dropperid = 8220000 AND itemid = 2061001 THEN 94
                       WHEN dropperid = 8220001 AND itemid = 2060001 THEN 102
                       WHEN dropperid = 8220001 AND itemid = 2061001 THEN 102
                       WHEN dropperid = 9300011 AND itemid = 2060000 THEN 64
                       WHEN dropperid = 9300011 AND itemid = 2061000 THEN 64
                       WHEN dropperid = 9300060 AND itemid = 2060000 THEN 68
                       WHEN dropperid = 9300060 AND itemid = 2061000 THEN 68
                       WHEN dropperid = 9300131 AND itemid = 2060000 THEN 64
                       WHEN dropperid = 9300131 AND itemid = 2061000 THEN 64
                       WHEN dropperid = 9300132 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 9300132 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 9300133 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 9300160 AND itemid = 2060000 THEN 103
                       WHEN dropperid = 9300160 AND itemid = 2061000 THEN 103
                       WHEN dropperid = 9300161 AND itemid = 2060000 THEN 103
                       WHEN dropperid = 9300161 AND itemid = 2061000 THEN 103
                       WHEN dropperid = 9300274 AND itemid = 2060000 THEN 13
                       WHEN dropperid = 9300274 AND itemid = 2061000 THEN 13
                       WHEN dropperid = 9300332 AND itemid = 2060000 THEN 65
                       WHEN dropperid = 9300334 AND itemid = 2060000 THEN 80
                       WHEN dropperid = 9300341 AND itemid = 2060000 THEN 9
                       WHEN dropperid = 9300341 AND itemid = 2061000 THEN 9
                       WHEN dropperid = 9300342 AND itemid = 2060000 THEN 13
                       WHEN dropperid = 9300342 AND itemid = 2061000 THEN 13
                       WHEN dropperid = 9300343 AND itemid = 2060000 THEN 12
                       WHEN dropperid = 9300343 AND itemid = 2061000 THEN 12
                       WHEN dropperid = 9303005 AND itemid = 2060001 THEN 21
                       WHEN dropperid = 9303005 AND itemid = 2061001 THEN 21
                       WHEN dropperid = 9303008 AND itemid = 2060001 THEN 21
                       WHEN dropperid = 9303008 AND itemid = 2061001 THEN 21
                       WHEN dropperid = 9303009 AND itemid = 2060001 THEN 41
                       WHEN dropperid = 9303009 AND itemid = 2061001 THEN 41
                       WHEN dropperid = 9400000 AND itemid = 2060001 THEN 20
                       WHEN dropperid = 9400009 AND itemid = 2060001 THEN 163
                       WHEN dropperid = 9400011 AND itemid = 2060002 THEN 21
                       WHEN dropperid = 9400100 AND itemid = 2060003 THEN 18
                       WHEN dropperid = 9400101 AND itemid = 2061003 THEN 19
                       WHEN dropperid = 9400204 AND itemid = 2060003 THEN 22
                       WHEN dropperid = 9400239 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 9400239 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 9400244 AND itemid = 2060000 THEN 97
                       WHEN dropperid = 9400244 AND itemid = 2061000 THEN 97
                       WHEN dropperid = 9400248 AND itemid = 2060000 THEN 39
                       WHEN dropperid = 9400248 AND itemid = 2061000 THEN 39
                       WHEN dropperid = 9400540 AND itemid = 2060004 THEN 8
                       WHEN dropperid = 9400540 AND itemid = 2061004 THEN 8
                       WHEN dropperid = 9400541 AND itemid = 2060004 THEN 8
                       WHEN dropperid = 9400541 AND itemid = 2061004 THEN 8
                       WHEN dropperid = 9400542 AND itemid = 2060004 THEN 11
                       WHEN dropperid = 9400542 AND itemid = 2061004 THEN 11
                       WHEN dropperid = 9400543 AND itemid = 2060004 THEN 13
                       WHEN dropperid = 9400543 AND itemid = 2061004 THEN 13
                       WHEN dropperid = 9400547 AND itemid = 2060000 THEN 44
                       WHEN dropperid = 9400547 AND itemid = 2061000 THEN 44
                       WHEN dropperid = 9400548 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 9400548 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 9400550 AND itemid = 2060000 THEN 44
                       WHEN dropperid = 9400550 AND itemid = 2061000 THEN 44
                       WHEN dropperid = 9400558 AND itemid = 2060000 THEN 49
                       WHEN dropperid = 9400558 AND itemid = 2061000 THEN 49
                       WHEN dropperid = 9400563 AND itemid = 2060000 THEN 65
                       WHEN dropperid = 9400563 AND itemid = 2061000 THEN 65
                       WHEN dropperid = 9400638 AND itemid = 2060000 THEN 33
                       WHEN dropperid = 9400638 AND itemid = 2061000 THEN 33
                       WHEN dropperid = 9420500 AND itemid = 2060000 THEN 45
                       WHEN dropperid = 9420500 AND itemid = 2061000 THEN 45
                       WHEN dropperid = 9420502 AND itemid = 2060000 THEN 29
                       WHEN dropperid = 9420502 AND itemid = 2061000 THEN 29
                       WHEN dropperid = 9420506 AND itemid = 2060000 THEN 38
                       WHEN dropperid = 9420506 AND itemid = 2061000 THEN 38
                       WHEN dropperid = 9420508 AND itemid = 2060000 THEN 70
                       WHEN dropperid = 9420508 AND itemid = 2061000 THEN 70
                       WHEN dropperid = 9420527 AND itemid = 2060001 THEN 36
                       WHEN dropperid = 9420527 AND itemid = 2061001 THEN 36
                       WHEN dropperid = 9420531 AND itemid = 2060001 THEN 48
                       WHEN dropperid = 9420531 AND itemid = 2061001 THEN 48
                       WHEN dropperid = 9500112 AND itemid = 2060001 THEN 28
                       WHEN dropperid = 9500112 AND itemid = 2061001 THEN 28
                       WHEN dropperid = 9500119 AND itemid = 2060000 THEN 64
                       WHEN dropperid = 9500119 AND itemid = 2061000 THEN 64
                       WHEN dropperid = 9500120 AND itemid = 2060000 THEN 73
                       WHEN dropperid = 9500120 AND itemid = 2061000 THEN 73
                       WHEN dropperid = 9500122 AND itemid = 2060000 THEN 80
                       WHEN dropperid = 9500123 AND itemid = 2060000 THEN 97
                       WHEN dropperid = 9500123 AND itemid = 2061000 THEN 97
                       WHEN dropperid = 9500308 AND itemid = 2060000 THEN 114
                       WHEN dropperid = 9500308 AND itemid = 2061000 THEN 114
                       WHEN dropperid = 9500310 AND itemid = 2060000 THEN 134
                       WHEN dropperid = 9500310 AND itemid = 2061000 THEN 134
                       WHEN dropperid = 9500312 AND itemid = 2060001 THEN 79
                       WHEN dropperid = 9500312 AND itemid = 2061001 THEN 79
                       WHEN dropperid = 9500313 AND itemid = 2060001 THEN 81
                       WHEN dropperid = 9500313 AND itemid = 2061001 THEN 81
                       WHEN dropperid = 9500314 AND itemid = 2060001 THEN 87
                       WHEN dropperid = 9500314 AND itemid = 2061001 THEN 87
                       WHEN dropperid = 9500321 AND itemid = 2060001 THEN 8
                       WHEN dropperid = 9500321 AND itemid = 2061001 THEN 8
                       WHEN dropperid = 9500366 AND itemid = 2060000 THEN 24
                       WHEN dropperid = 9500369 AND itemid = 2060000 THEN 24
  ELSE maximum_quantity END
;

  UPDATE drop_data SET `chance`=1287 WHERE `chance`=1500;

  # MapleSkillbookChanceFetcher! Tuning up some skillbook drop chances in order to fit their dropper's availability (whether's a boss or not) and level.
  # thanks unnqca for reporting some skillbooks having unusually high drop chances.
  REPLACE INTO drop_data (`dropperid`, `itemid`, `minimum_quantity`, `maximum_quantity`, `questid`, `chance`) VALUES
(851000, 2290132, 1, 1, 0, 3861),
(7090000, 2290087, 1, 1, 0, 10000),
(8090000, 2290045, 1, 1, 0, 10000),
(8140103, 2290044, 1, 1, 0, 500),
(8140511, 2290009, 1, 1, 0, 500),
(8140511, 2290050, 1, 1, 0, 500),
(8140511, 2290083, 1, 1, 0, 500),
(8140511, 2290134, 1, 1, 0, 1500),
(8140512, 2290013, 1, 1, 0, 500),
(8140512, 2290067, 1, 1, 0, 500),
(8140512, 2290082, 1, 1, 0, 500),
(8140512, 2290097, 1, 1, 0, 500),
(8140512, 2290116, 1, 1, 0, 500),
(8140512, 2290131, 1, 1, 0, 1500),
(8140600, 2290132, 1, 1, 0, 1500),
(8140700, 2290106, 1, 1, 0, 500),
(8140700, 2290126, 1, 1, 0, 1500),
(8140701, 2290122, 1, 1, 0, 500),
(8140702, 2290112, 1, 1, 0, 500),
(8140703, 2290088, 1, 1, 0, 500),
(8140703, 2290099, 1, 1, 0, 500),
(8141000, 2290082, 1, 1, 0, 500),
(8141000, 2290097, 1, 1, 0, 500),
(8141100, 2280005, 1, 1, 0, 500),
(8141300, 2290098, 1, 1, 0, 500),
(8142100, 2290032, 1, 1, 0, 500),
(8142100, 2290082, 1, 1, 0, 500),
(8142100, 2290114, 1, 1, 0, 500),
(8143000, 2280004, 1, 1, 0, 500),
(8150000, 2280013, 1, 1, 0, 30000),
(8150000, 2290070, 1, 1, 0, 10000),
(8150000, 2290091, 1, 1, 0, 10000),
(8150100, 2290042, 1, 1, 0, 500),
(8150100, 2290053, 1, 1, 0, 500),
(8150100, 2290073, 1, 1, 0, 500),
(8150100, 2290102, 1, 1, 0, 500),
(8150100, 2290118, 1, 1, 0, 500),
(8150101, 2290017, 1, 1, 0, 500),
(8150101, 2290021, 1, 1, 0, 500),
(8150101, 2290035, 1, 1, 0, 500),
(8150101, 2290042, 1, 1, 0, 500),
(8150101, 2290052, 1, 1, 0, 500),
(8150101, 2290102, 1, 1, 0, 500),
(8150200, 2290024, 1, 1, 0, 500),
(8150200, 2290100, 1, 1, 0, 500),
(8150200, 2290135, 1, 1, 0, 1500),
(8150201, 2290004, 1, 1, 0, 500),
(8150201, 2290006, 1, 1, 0, 500),
(8150201, 2290024, 1, 1, 0, 500),
(8150201, 2290036, 1, 1, 0, 500),
(8150201, 2290056, 1, 1, 0, 500),
(8150201, 2290072, 1, 1, 0, 500),
(8150201, 2290078, 1, 1, 0, 500),
(8150201, 2290117, 1, 1, 0, 500),
(8150300, 2290003, 1, 1, 0, 500),
(8150300, 2290033, 1, 1, 0, 500),
(8150300, 2290111, 1, 1, 0, 500),
(8150300, 2290120, 1, 1, 0, 500),
(8150300, 2290127, 1, 1, 0, 1500),
(8150301, 2290023, 1, 1, 0, 500),
(8150301, 2290029, 1, 1, 0, 500),
(8150301, 2290101, 1, 1, 0, 500),
(8150301, 2290107, 1, 1, 0, 500),
(8150302, 2290010, 1, 1, 0, 500),
(8150302, 2290019, 1, 1, 0, 500),
(8150302, 2290026, 1, 1, 0, 500),
(8150302, 2290076, 1, 1, 0, 500),
(8150302, 2290085, 1, 1, 0, 500),
(8150302, 2290096, 1, 1, 0, 500),
(8150302, 2290113, 1, 1, 0, 500),
(8150302, 2290119, 1, 1, 0, 500),
(8150302, 2290128, 1, 1, 0, 1500),
(8160000, 2290017, 1, 1, 0, 500),
(8160000, 2290045, 1, 1, 0, 500),
(8160000, 2290065, 1, 1, 0, 500),
(8160000, 2290067, 1, 1, 0, 500),
(8160000, 2290081, 1, 1, 0, 500),
(8170000, 2290012, 1, 1, 0, 500),
(8170000, 2290086, 1, 1, 0, 500),
(8170000, 2290087, 1, 1, 0, 500),
(8170000, 2290134, 1, 1, 0, 1500),
(8180000, 2290002, 1, 1, 0, 10000),
(8180000, 2290003, 1, 1, 0, 10000),
(8180000, 2290014, 1, 1, 0, 10000),
(8180000, 2290015, 1, 1, 0, 10000),
(8180000, 2290030, 1, 1, 0, 10000),
(8180000, 2290035, 1, 1, 0, 10000),
(8180000, 2290036, 1, 1, 0, 10000),
(8180000, 2290063, 1, 1, 0, 10000),
(8180000, 2290080, 1, 1, 0, 10000),
(8180000, 2290098, 1, 1, 0, 10000),
(8180000, 2290101, 1, 1, 0, 10000),
(8180000, 2290117, 1, 1, 0, 10000),
(8180000, 2290130, 1, 1, 0, 30000),
(8180001, 2290018, 1, 1, 0, 10000),
(8180001, 2290019, 1, 1, 0, 10000),
(8180001, 2290032, 1, 1, 0, 10000),
(8180001, 2290042, 1, 1, 0, 10000),
(8180001, 2290058, 1, 1, 0, 10000),
(8180001, 2290059, 1, 1, 0, 10000),
(8180001, 2290068, 1, 1, 0, 10000),
(8180001, 2290069, 1, 1, 0, 10000),
(8180001, 2290072, 1, 1, 0, 10000),
(8180001, 2290092, 1, 1, 0, 10000),
(8180001, 2290099, 1, 1, 0, 10000),
(8180001, 2290100, 1, 1, 0, 10000),
(8180001, 2290102, 1, 1, 0, 10000),
(8180001, 2290119, 1, 1, 0, 10000),
(8180001, 2290128, 1, 1, 0, 30000),
(8190000, 2280016, 1, 1, 0, 1500),
(8190000, 2290030, 1, 1, 0, 500),
(8190000, 2290044, 1, 1, 0, 500),
(8190000, 2290054, 1, 1, 0, 500),
(8190000, 2290066, 1, 1, 0, 500),
(8190000, 2290075, 1, 1, 0, 500),
(8190000, 2290092, 1, 1, 0, 500),
(8190000, 2290103, 1, 1, 0, 500),
(8190002, 2290000, 1, 1, 0, 500),
(8190002, 2290008, 1, 1, 0, 500),
(8190002, 2290018, 1, 1, 0, 500),
(8190002, 2290038, 1, 1, 0, 500),
(8190002, 2290060, 1, 1, 0, 500),
(8190002, 2290080, 1, 1, 0, 500),
(8190002, 2290124, 1, 1, 0, 500),
(8190003, 2280013, 1, 1, 0, 1500),
(8190003, 2290007, 1, 1, 0, 500),
(8190003, 2290012, 1, 1, 0, 500),
(8190003, 2290014, 1, 1, 0, 500),
(8190003, 2290033, 1, 1, 0, 500),
(8190003, 2290045, 1, 1, 0, 500),
(8190003, 2290050, 1, 1, 0, 500),
(8190003, 2290055, 1, 1, 0, 500),
(8190003, 2290062, 1, 1, 0, 500),
(8190003, 2290063, 1, 1, 0, 500),
(8190003, 2290070, 1, 1, 0, 500),
(8190003, 2290086, 1, 1, 0, 500),
(8190003, 2290108, 1, 1, 0, 500),
(8190003, 2290133, 1, 1, 0, 1500),
(8190004, 2290002, 1, 1, 0, 500),
(8190004, 2290009, 1, 1, 0, 500),
(8190004, 2290021, 1, 1, 0, 500),
(8190004, 2290034, 1, 1, 0, 500),
(8190004, 2290041, 1, 1, 0, 500),
(8190004, 2290052, 1, 1, 0, 500),
(8190004, 2290053, 1, 1, 0, 500),
(8190004, 2290058, 1, 1, 0, 500),
(8190004, 2290068, 1, 1, 0, 500),
(8190004, 2290071, 1, 1, 0, 500),
(8190004, 2290073, 1, 1, 0, 500),
(8190004, 2290090, 1, 1, 0, 500),
(8190004, 2290112, 1, 1, 0, 500),
(8190004, 2290121, 1, 1, 0, 500),
(8190004, 2290130, 1, 1, 0, 1500),
(8190005, 2290000, 1, 1, 0, 500),
(8190005, 2290008, 1, 1, 0, 500),
(8190005, 2290018, 1, 1, 0, 500),
(8190005, 2290038, 1, 1, 0, 500),
(8190005, 2290060, 1, 1, 0, 500),
(8190005, 2290080, 1, 1, 0, 500),
(8190005, 2290124, 1, 1, 0, 500),
(8200000, 2290005, 1, 1, 0, 500),
(8200000, 2290011, 1, 1, 0, 500),
(8200000, 2290114, 1, 1, 0, 500),
(8200001, 2280015, 1, 1, 0, 1500),
(8200001, 2290050, 1, 1, 0, 500),
(8200001, 2290059, 1, 1, 0, 500),
(8200001, 2290065, 1, 1, 0, 500),
(8200001, 2290129, 1, 1, 0, 1500),
(8200002, 2290062, 1, 1, 0, 500),
(8200002, 2290066, 1, 1, 0, 500),
(8200002, 2290070, 1, 1, 0, 500),
(8200002, 2290131, 1, 1, 0, 1500),
(8200002, 2290139, 1, 1, 0, 1500),
(8200003, 2290012, 1, 1, 0, 500),
(8200003, 2290056, 1, 1, 0, 500),
(8200003, 2290071, 1, 1, 0, 500),
(8200003, 2290101, 1, 1, 0, 500),
(8200003, 2290136, 1, 1, 0, 1500),
(8200004, 2280016, 1, 1, 0, 1500),
(8200004, 2290069, 1, 1, 0, 500),
(8200004, 2290072, 1, 1, 0, 500),
(8200004, 2290073, 1, 1, 0, 500),
(8200004, 2290127, 1, 1, 0, 1500),
(8200004, 2290134, 1, 1, 0, 1500),
(8200005, 2280014, 1, 1, 0, 1500),
(8200005, 2290078, 1, 1, 0, 500),
(8200005, 2290079, 1, 1, 0, 500),
(8200005, 2290095, 1, 1, 0, 500),
(8200006, 2290003, 1, 1, 0, 500),
(8200006, 2290064, 1, 1, 0, 500),
(8200006, 2290076, 1, 1, 0, 500),
(8200006, 2290077, 1, 1, 0, 500),
(8200006, 2290129, 1, 1, 0, 1500),
(8200006, 2290138, 1, 1, 0, 1500),
(8200007, 2290006, 1, 1, 0, 500),
(8200007, 2290007, 1, 1, 0, 500),
(8200007, 2290011, 1, 1, 0, 500),
(8200007, 2290016, 1, 1, 0, 500),
(8200007, 2290125, 1, 1, 0, 500),
(8200007, 2290136, 1, 1, 0, 1500),
(8200008, 2290006, 1, 1, 0, 500),
(8200008, 2290051, 1, 1, 0, 500),
(8200008, 2290121, 1, 1, 0, 500),
(8200008, 2290122, 1, 1, 0, 500),
(8200008, 2290133, 1, 1, 0, 1500),
(8200009, 2290013, 1, 1, 0, 500),
(8200009, 2290016, 1, 1, 0, 500),
(8200009, 2290031, 1, 1, 0, 500),
(8200009, 2290039, 1, 1, 0, 500),
(8200010, 2290026, 1, 1, 0, 500),
(8200010, 2290059, 1, 1, 0, 500),
(8200010, 2290088, 1, 1, 0, 500),
(8200010, 2290089, 1, 1, 0, 500),
(8200010, 2290127, 1, 1, 0, 1500),
(8200011, 2290001, 1, 1, 0, 750),
(8200011, 2290040, 1, 1, 0, 750),
(8200011, 2290046, 1, 1, 0, 750),
(8200011, 2290048, 1, 1, 0, 750),
(8200011, 2290049, 1, 1, 0, 750),
(8200011, 2290114, 1, 1, 0, 750),
(8200011, 2290137, 1, 1, 0, 2250),
(8200012, 2290041, 1, 1, 0, 750),
(8200012, 2290092, 1, 1, 0, 750),
(8200012, 2290093, 1, 1, 0, 750),
(8200012, 2290115, 1, 1, 0, 750),
(8200012, 2290137, 1, 1, 0, 2250),
(8200012, 2290139, 1, 1, 0, 2250),
(8220002, 2290020, 1, 1, 0, 10000),
(8220002, 2290081, 1, 1, 0, 10000),
(8220002, 2290085, 1, 1, 0, 10000),
(8220002, 2290133, 1, 1, 0, 30000),
(8220003, 2290006, 1, 1, 0, 10000),
(8220003, 2290030, 1, 1, 0, 10000),
(8220003, 2290031, 1, 1, 0, 10000),
(8220003, 2290032, 1, 1, 0, 10000),
(8220003, 2290033, 1, 1, 0, 10000),
(8220003, 2290060, 1, 1, 0, 10000),
(8220003, 2290061, 1, 1, 0, 10000),
(8220003, 2290076, 1, 1, 0, 10000),
(8220003, 2290077, 1, 1, 0, 10000),
(8220003, 2290104, 1, 1, 0, 10000),
(8220003, 2290105, 1, 1, 0, 10000),
(8220003, 2290117, 1, 1, 0, 10000),
(8220003, 2290118, 1, 1, 0, 10000),
(8220004, 2290018, 1, 1, 0, 10000),
(8220004, 2290019, 1, 1, 0, 10000),
(8220004, 2290024, 1, 1, 0, 10000),
(8220004, 2290025, 1, 1, 0, 10000),
(8220004, 2290058, 1, 1, 0, 10000),
(8220004, 2290059, 1, 1, 0, 10000),
(8220004, 2290076, 1, 1, 0, 10000),
(8220004, 2290077, 1, 1, 0, 10000),
(8220004, 2290106, 1, 1, 0, 10000),
(8220004, 2290127, 1, 1, 0, 30000),
(8220004, 2290134, 1, 1, 0, 30000),
(8220005, 2290002, 1, 1, 0, 15000),
(8220005, 2290003, 1, 1, 0, 15000),
(8220005, 2290036, 1, 1, 0, 15000),
(8220005, 2290037, 1, 1, 0, 15000),
(8220005, 2290055, 1, 1, 0, 15000),
(8220005, 2290080, 1, 1, 0, 15000),
(8220005, 2290099, 1, 1, 0, 15000),
(8220005, 2290131, 1, 1, 0, 45000),
(8220005, 2290136, 1, 1, 0, 45000),
(8220006, 2290012, 1, 1, 0, 20000),
(8220006, 2290013, 1, 1, 0, 20000),
(8220006, 2290042, 1, 1, 0, 20000),
(8220006, 2290043, 1, 1, 0, 20000),
(8220006, 2290060, 1, 1, 0, 20000),
(8220006, 2290061, 1, 1, 0, 20000),
(8220006, 2290090, 1, 1, 0, 20000),
(8220006, 2290119, 1, 1, 0, 20000),
(8220006, 2290120, 1, 1, 0, 20000),
(8220006, 2290135, 1, 1, 0, 60000),
(8220006, 2290138, 1, 1, 0, 60000),
(8220007, 2290035, 1, 1, 0, 10000),
(8220007, 2290091, 1, 1, 0, 10000),
(8220007, 2290108, 1, 1, 0, 10000),
(8220009, 2290031, 1, 1, 0, 10000),
(8220009, 2290129, 1, 1, 0, 30000),
(8220015, 2280004, 1, 1, 0, 10000),
(8220015, 2280005, 1, 1, 0, 10000),
(8220015, 2280006, 1, 1, 0, 10000),
(8500002, 2280007, 1, 1, 0, 15000),
(8500002, 2280008, 1, 1, 0, 15000),
(8500002, 2280009, 1, 1, 0, 15000),
(8500002, 2280010, 1, 1, 0, 15000),
(8500002, 2290006, 1, 1, 0, 15000),
(8500002, 2290010, 1, 1, 0, 15000),
(8500002, 2290011, 1, 1, 0, 15000),
(8500002, 2290013, 1, 1, 0, 15000),
(8500002, 2290028, 1, 1, 0, 15000),
(8500002, 2290037, 1, 1, 0, 15000),
(8500002, 2290043, 1, 1, 0, 15000),
(8500002, 2290051, 1, 1, 0, 15000),
(8500002, 2290056, 1, 1, 0, 15000),
(8500002, 2290061, 1, 1, 0, 15000),
(8500002, 2290066, 1, 1, 0, 15000),
(8500002, 2290071, 1, 1, 0, 15000),
(8500002, 2290078, 1, 1, 0, 15000),
(8500002, 2290089, 1, 1, 0, 15000),
(8500002, 2290091, 1, 1, 0, 15000),
(8500002, 2290104, 1, 1, 0, 15000),
(8500002, 2290107, 1, 1, 0, 15000),
(8500002, 2290121, 1, 1, 0, 15000),
(8500002, 2290123, 1, 1, 0, 15000),
(8500002, 2290126, 1, 1, 0, 45000),
(8500002, 2290129, 1, 1, 0, 45000),
(8510000, 2280007, 1, 1, 0, 10000),
(8510000, 2280008, 1, 1, 0, 10000),
(8510000, 2280009, 1, 1, 0, 10000),
(8510000, 2280010, 1, 1, 0, 10000),
(8510000, 2290000, 1, 1, 0, 10000),
(8510000, 2290001, 1, 1, 0, 10000),
(8510000, 2290004, 1, 1, 0, 10000),
(8510000, 2290005, 1, 1, 0, 10000),
(8510000, 2290024, 1, 1, 0, 10000),
(8510000, 2290025, 1, 1, 0, 10000),
(8510000, 2290026, 1, 1, 0, 10000),
(8510000, 2290027, 1, 1, 0, 10000),
(8510000, 2290052, 1, 1, 0, 10000),
(8510000, 2290053, 1, 1, 0, 10000),
(8510000, 2290054, 1, 1, 0, 10000),
(8510000, 2290055, 1, 1, 0, 10000),
(8510000, 2290076, 1, 1, 0, 10000),
(8510000, 2290077, 1, 1, 0, 10000),
(8510000, 2290082, 1, 1, 0, 10000),
(8510000, 2290083, 1, 1, 0, 10000),
(8510000, 2290097, 1, 1, 0, 10000),
(8510000, 2290099, 1, 1, 0, 10000),
(8510000, 2290106, 1, 1, 0, 10000),
(8510000, 2290108, 1, 1, 0, 10000),
(8510000, 2290112, 1, 1, 0, 10000),
(8510000, 2290114, 1, 1, 0, 10000),
(8510000, 2290122, 1, 1, 0, 10000),
(8510000, 2290124, 1, 1, 0, 10000),
(8510000, 2290132, 1, 1, 0, 30000),
(8520000, 2280007, 1, 1, 0, 10000),
(8520000, 2280008, 1, 1, 0, 10000),
(8520000, 2280009, 1, 1, 0, 10000),
(8520000, 2280010, 1, 1, 0, 10000),
(8520000, 2290000, 1, 1, 0, 10000),
(8520000, 2290001, 1, 1, 0, 10000),
(8520000, 2290004, 1, 1, 0, 10000),
(8520000, 2290005, 1, 1, 0, 10000),
(8520000, 2290024, 1, 1, 0, 10000),
(8520000, 2290025, 1, 1, 0, 10000),
(8520000, 2290026, 1, 1, 0, 10000),
(8520000, 2290027, 1, 1, 0, 10000),
(8520000, 2290052, 1, 1, 0, 10000),
(8520000, 2290053, 1, 1, 0, 10000),
(8520000, 2290054, 1, 1, 0, 10000),
(8520000, 2290055, 1, 1, 0, 10000),
(8520000, 2290076, 1, 1, 0, 10000),
(8520000, 2290077, 1, 1, 0, 10000),
(8520000, 2290082, 1, 1, 0, 10000),
(8520000, 2290083, 1, 1, 0, 10000),
(8520000, 2290097, 1, 1, 0, 10000),
(8520000, 2290099, 1, 1, 0, 10000),
(8520000, 2290106, 1, 1, 0, 10000),
(8520000, 2290108, 1, 1, 0, 10000),
(8520000, 2290112, 1, 1, 0, 10000),
(8520000, 2290114, 1, 1, 0, 10000),
(8520000, 2290122, 1, 1, 0, 10000),
(8520000, 2290124, 1, 1, 0, 10000),
(8520000, 2290132, 1, 1, 0, 30000),
(8800002, 2280007, 1, 1, 0, 20000),
(8800002, 2280008, 1, 1, 0, 20000),
(8800002, 2280009, 1, 1, 0, 20000),
(8800002, 2280010, 1, 1, 0, 20000),
(8800002, 2280013, 1, 1, 0, 60000),
(8800002, 2280014, 1, 1, 0, 60000),
(8800002, 2280015, 1, 1, 0, 60000),
(8800002, 2280016, 1, 1, 0, 60000),
(8800002, 2290006, 1, 1, 0, 20000),
(8800002, 2290007, 1, 1, 0, 20000),
(8800002, 2290016, 1, 1, 0, 20000),
(8800002, 2290020, 1, 1, 0, 20000),
(8800002, 2290022, 1, 1, 0, 20000),
(8800002, 2290024, 1, 1, 0, 20000),
(8800002, 2290028, 1, 1, 0, 20000),
(8800002, 2290029, 1, 1, 0, 20000),
(8800002, 2290040, 1, 1, 0, 20000),
(8800002, 2290046, 1, 1, 0, 20000),
(8800002, 2290048, 1, 1, 0, 20000),
(8800002, 2290056, 1, 1, 0, 20000),
(8800002, 2290057, 1, 1, 0, 20000),
(8800002, 2290058, 1, 1, 0, 20000),
(8800002, 2290064, 1, 1, 0, 20000),
(8800002, 2290067, 1, 1, 0, 20000),
(8800002, 2290074, 1, 1, 0, 20000),
(8800002, 2290079, 1, 1, 0, 20000),
(8800002, 2290084, 1, 1, 0, 20000),
(8800002, 2290094, 1, 1, 0, 20000),
(8800002, 2290110, 1, 1, 0, 20000),
(8800002, 2290115, 1, 1, 0, 20000),
(8810018, 2290017, 1, 1, 0, 25000),
(8810018, 2290021, 1, 1, 0, 25000),
(8810018, 2290023, 1, 1, 0, 25000),
(8810018, 2290041, 1, 1, 0, 25000),
(8810018, 2290047, 1, 1, 0, 25000),
(8810018, 2290049, 1, 1, 0, 25000),
(8810018, 2290065, 1, 1, 0, 25000),
(8810018, 2290075, 1, 1, 0, 25000),
(8810018, 2290085, 1, 1, 0, 25000),
(8810018, 2290095, 1, 1, 0, 25000),
(8810018, 2290096, 1, 1, 0, 25000),
(8810018, 2290111, 1, 1, 0, 25000),
(8810018, 2290116, 1, 1, 0, 25000),
(8810018, 2290125, 1, 1, 0, 25000),
(8810018, 2290133, 1, 1, 0, 75000),
(8810018, 2290137, 1, 1, 0, 75000),
(8810018, 2290139, 1, 1, 0, 75000),
(8820000, 2290010, 1, 1, 0, 30000),
(8820000, 2290022, 1, 1, 0, 30000),
(8820000, 2290040, 1, 1, 0, 30000),
(8820000, 2290046, 1, 1, 0, 30000),
(8820000, 2290048, 1, 1, 0, 30000),
(8820000, 2290052, 1, 1, 0, 30000),
(8820000, 2290084, 1, 1, 0, 30000),
(8820000, 2290090, 1, 1, 0, 30000),
(8820000, 2290106, 1, 1, 0, 30000),
(8820000, 2290119, 1, 1, 0, 30000),
(8820001, 2290010, 1, 1, 0, 30000),
(8820001, 2290022, 1, 1, 0, 30000),
(8820001, 2290040, 1, 1, 0, 30000),
(8820001, 2290046, 1, 1, 0, 30000),
(8820001, 2290048, 1, 1, 0, 30000),
(8820001, 2290052, 1, 1, 0, 30000),
(8820001, 2290084, 1, 1, 0, 30000),
(8820001, 2290090, 1, 1, 0, 30000),
(8820001, 2290106, 1, 1, 0, 30000),
(8820001, 2290119, 1, 1, 0, 30000),
(9300028, 2280015, 1, 1, 0, 30000),
(9300028, 2290026, 1, 1, 0, 10000),
(9300028, 2290064, 1, 1, 0, 10000),
(9300028, 2290075, 1, 1, 0, 10000),
(9300028, 2290093, 1, 1, 0, 10000),
(9300028, 2290111, 1, 1, 0, 10000),
(9300094, 2280004, 1, 1, 0, 10000),
(9300094, 2280005, 1, 1, 0, 10000),
(9300094, 2280006, 1, 1, 0, 10000),
(9300095, 2280004, 1, 1, 0, 500),
(9300095, 2280005, 1, 1, 0, 500),
(9300095, 2280006, 1, 1, 0, 500),
(9303016, 2290006, 1, 1, 0, 500),
(9303016, 2290030, 1, 1, 0, 500),
(9303016, 2290032, 1, 1, 0, 500),
(9303016, 2290060, 1, 1, 0, 500),
(9303016, 2290076, 1, 1, 0, 500),
(9303016, 2290104, 1, 1, 0, 500),
(9303016, 2290117, 1, 1, 0, 500),
(9400014, 2290053, 1, 1, 0, 10000),
(9400014, 2290087, 1, 1, 0, 10000),
(9400014, 2290112, 1, 1, 0, 10000),
(9400014, 2290122, 1, 1, 0, 10000),
(9400120, 2290045, 1, 1, 0, 10000),
(9400121, 2280014, 1, 1, 0, 45000),
(9400121, 2290081, 1, 1, 0, 15000),
(9400121, 2290087, 1, 1, 0, 15000),
(9400121, 2290101, 1, 1, 0, 15000),
(9400121, 2290103, 1, 1, 0, 15000),
(9400122, 2290007, 1, 1, 0, 10000),
(9400122, 2290062, 1, 1, 0, 10000),
(9400122, 2290116, 1, 1, 0, 10000),
(9400300, 2290045, 1, 1, 0, 30000),
(9400300, 2290055, 1, 1, 0, 30000),
(9400300, 2290063, 1, 1, 0, 30000),
(9400300, 2290079, 1, 1, 0, 30000),
(9400300, 2290081, 1, 1, 0, 30000),
(9400300, 2290096, 1, 1, 0, 30000),
(9400514, 2290023, 1, 1, 0, 10000),
(9400514, 2290057, 1, 1, 0, 10000),
(9400514, 2290088, 1, 1, 0, 10000),
(9400514, 2290095, 1, 1, 0, 10000),
(9400514, 2290115, 1, 1, 0, 10000),
(9400514, 2290139, 1, 1, 0, 30000),
(9400549, 2290001, 1, 1, 0, 10000),
(9400549, 2290020, 1, 1, 0, 10000),
(9400549, 2290045, 1, 1, 0, 10000),
(9400549, 2290057, 1, 1, 0, 10000),
(9400549, 2290086, 1, 1, 0, 10000),
(9400575, 2290009, 1, 1, 0, 10000),
(9400575, 2290051, 1, 1, 0, 10000),
(9400575, 2290081, 1, 1, 0, 10000),
(9400575, 2290087, 1, 1, 0, 10000),
(9400575, 2290107, 1, 1, 0, 10000),
(9400575, 2290123, 1, 1, 0, 10000),
(9400580, 2290004, 1, 1, 0, 500),
(9400580, 2290024, 1, 1, 0, 500),
(9400580, 2290083, 1, 1, 0, 500),
(9400580, 2290087, 1, 1, 0, 500),
(9400580, 2290103, 1, 1, 0, 500),
(9400580, 2290121, 1, 1, 0, 500),
(9400582, 2290005, 1, 1, 0, 500),
(9400582, 2290010, 1, 1, 0, 500),
(9400582, 2290029, 1, 1, 0, 500),
(9400582, 2290047, 1, 1, 0, 500),
(9400582, 2290049, 1, 1, 0, 500),
(9400582, 2290074, 1, 1, 0, 500),
(9400582, 2290079, 1, 1, 0, 500),
(9400582, 2290081, 1, 1, 0, 500),
(9400582, 2290135, 1, 1, 0, 1500),
(9400590, 2290088, 1, 1, 0, 15000),
(9400590, 2290125, 1, 1, 0, 15000),
(9400590, 2290135, 1, 1, 0, 45000),
(9400591, 2290039, 1, 1, 0, 15000),
(9400591, 2290074, 1, 1, 0, 15000),
(9400591, 2290113, 1, 1, 0, 15000),
(9400592, 2290047, 1, 1, 0, 15000),
(9400592, 2290123, 1, 1, 0, 15000),
(9400592, 2290131, 1, 1, 0, 45000),
(9400593, 2290069, 1, 1, 0, 15000),
(9400593, 2290093, 1, 1, 0, 15000),
(9400593, 2290138, 1, 1, 0, 45000),
(9420513, 2290039, 1, 1, 0, 10000),
(9420513, 2290100, 1, 1, 0, 10000),
(9420513, 2290108, 1, 1, 0, 10000),
(9420513, 2290118, 1, 1, 0, 10000),
(9420513, 2290138, 1, 1, 0, 30000),
(9420514, 2290099, 1, 1, 0, 1287),
(9420517, 2290000, 1, 1, 0, 1287),
(9420517, 2290008, 1, 1, 0, 1287),
(9420517, 2290018, 1, 1, 0, 1287),
(9420517, 2290038, 1, 1, 0, 1287),
(9420517, 2290060, 1, 1, 0, 1287),
(9420517, 2290080, 1, 1, 0, 1287),
(9420517, 2290103, 1, 1, 0, 1287),
(9420518, 2290123, 1, 1, 0, 1287),
(9420519, 2290113, 1, 1, 0, 1287),
(9420522, 2290000, 1, 1, 0, 1287),
(9420522, 2290001, 1, 1, 0, 1287),
(9420522, 2290011, 1, 1, 0, 1287),
(9420522, 2290025, 1, 1, 0, 1287),
(9420522, 2290028, 1, 1, 0, 1287),
(9420522, 2290037, 1, 1, 0, 1287),
(9420522, 2290043, 1, 1, 0, 1287),
(9420522, 2290066, 1, 1, 0, 1287),
(9420522, 2290082, 1, 1, 0, 1287),
(9420522, 2290083, 1, 1, 0, 1287),
(9420522, 2290089, 1, 1, 0, 1287),
(9420522, 2290091, 1, 1, 0, 1287),
(9420522, 2290107, 1, 1, 0, 1287),
(9420540, 2280006, 1, 1, 0, 500),
(9420540, 2290119, 1, 1, 0, 500),
(9420540, 2290120, 1, 1, 0, 500),
(9420544, 2280007, 1, 1, 0, 20000),
(9420544, 2280008, 1, 1, 0, 20000),
(9420544, 2280009, 1, 1, 0, 20000),
(9420544, 2280010, 1, 1, 0, 20000),
(9420544, 2290002, 1, 1, 0, 20000),
(9420544, 2290015, 1, 1, 0, 20000),
(9420544, 2290022, 1, 1, 0, 20000),
(9420544, 2290027, 1, 1, 0, 20000),
(9420544, 2290034, 1, 1, 0, 20000),
(9420544, 2290052, 1, 1, 0, 20000),
(9420544, 2290054, 1, 1, 0, 20000),
(9420544, 2290089, 1, 1, 0, 20000),
(9420544, 2290094, 1, 1, 0, 20000),
(9420544, 2290098, 1, 1, 0, 20000),
(9420544, 2290105, 1, 1, 0, 20000),
(9420544, 2290110, 1, 1, 0, 20000),
(9420544, 2290119, 1, 1, 0, 20000),
(9420549, 2280007, 1, 1, 0, 20000),
(9420549, 2280008, 1, 1, 0, 20000),
(9420549, 2280009, 1, 1, 0, 20000),
(9420549, 2280010, 1, 1, 0, 20000),
(9420549, 2290002, 1, 1, 0, 20000),
(9420549, 2290015, 1, 1, 0, 20000),
(9420549, 2290022, 1, 1, 0, 20000),
(9420549, 2290027, 1, 1, 0, 20000),
(9420549, 2290034, 1, 1, 0, 20000),
(9420549, 2290052, 1, 1, 0, 20000),
(9420549, 2290054, 1, 1, 0, 20000),
(9420549, 2290089, 1, 1, 0, 20000),
(9420549, 2290094, 1, 1, 0, 20000),
(9420549, 2290098, 1, 1, 0, 20000),
(9420549, 2290105, 1, 1, 0, 20000),
(9420549, 2290110, 1, 1, 0, 20000),
(9420549, 2290119, 1, 1, 0, 20000),
(9500166, 2290044, 1, 1, 0, 500),
(9500173, 2290018, 1, 1, 0, 10000),
(9500173, 2290019, 1, 1, 0, 10000),
(9500173, 2290032, 1, 1, 0, 10000),
(9500173, 2290042, 1, 1, 0, 10000),
(9500173, 2290058, 1, 1, 0, 10000),
(9500173, 2290068, 1, 1, 0, 10000),
(9500173, 2290072, 1, 1, 0, 10000),
(9500173, 2290092, 1, 1, 0, 10000),
(9500173, 2290099, 1, 1, 0, 10000),
(9500173, 2290102, 1, 1, 0, 10000),
(9500173, 2290119, 1, 1, 0, 10000),
(9500173, 2290128, 1, 1, 0, 30000),
(9500174, 2290002, 1, 1, 0, 10000),
(9500174, 2290014, 1, 1, 0, 10000),
(9500174, 2290030, 1, 1, 0, 10000),
(9500174, 2290080, 1, 1, 0, 10000),
(9500174, 2290130, 1, 1, 0, 30000),
(9500180, 2290010, 1, 1, 0, 10000),
(9500180, 2290028, 1, 1, 0, 10000),
(9500180, 2290126, 1, 1, 0, 30000),
(9500181, 2290010, 1, 1, 0, 10000),
(9500181, 2290028, 1, 1, 0, 10000),
(9500181, 2290126, 1, 1, 0, 30000),
(9500331, 2290010, 1, 1, 0, 10000),
(9500331, 2290028, 1, 1, 0, 10000),
(9500331, 2290126, 1, 1, 0, 30000),
(9500332, 2290132, 1, 1, 0, 30000),
(9500333, 2290006, 1, 1, 0, 10000),
(9500333, 2290030, 1, 1, 0, 10000),
(9500333, 2290032, 1, 1, 0, 10000),
(9500333, 2290060, 1, 1, 0, 10000),
(9500333, 2290076, 1, 1, 0, 10000),
(9500333, 2290104, 1, 1, 0, 10000),
(9500333, 2290117, 1, 1, 0, 10000);