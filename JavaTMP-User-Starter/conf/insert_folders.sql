/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  JavaTMP
 * Created: May 8, 2019
 */

INSERT INTO `document` (`documentId`, `documentName`, `documentSize`, `contentType`,
`documentContent`, `creationDate`, `randomHash`, `documentType`, `parentDocumentId`,
`status`, `createdByUserId`) VALUES
(3000,'Drive Root 1',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,NULL,1, 1),
(3001,'Drive Root 2',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,NULL,1, 1),
(3002,'Drive Root 3',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,NULL,1, 1),
(3003,'Folder 1',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3001,1, 1),
(3004,'Folder 2',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3000,1, 1),
(3005,'Folder 3',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3001,1, 1),
(3006,'Folder 4',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3000,1, 1),
(3007,'Folder 5',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3002,1, 1),
(3008,'Folder 6',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3000,1, 1),
(3009,'Folder 7',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3001,1, 1),
(3010,'Folder 8',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3000,1, 1),
(3011,'Folder 9',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3003,1, 1),
(3012,'Folder 10',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3004,1, 1),
(3013,'Folder 11',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3002,1, 1),
(3014,'Folder 12',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3003,1, 1),
(3015,'Folder 13',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3001,1, 1),
(3016,'Folder 14',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3004,1, 1),
(3017,'Folder 15',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3005,1, 1),
(3018,'Folder 16',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3000,1, 1),
(3019,'Folder 17',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3005,1, 1),
(3020,'Folder 18',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3002,1, 1),
(3021,'Folder 19',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3001,1, 1),
(3022,'Folder 20',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3006,1, 1),
(3023,'Folder 21',0,'document/directory',0x00,'2019-02-20 02:36:06',1406864873,2,3001,1, 1);

