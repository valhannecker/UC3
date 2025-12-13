/* LógicoLOL: */

CREATE TABLE Team (
    Team_ID VARCHAR PRIMARY KEY,
    Name VARCHAR,
    fk_Match_Match_ID NUMERIC
);

CREATE TABLE Player (
    Player_ID NUMERIC PRIMARY KEY,
    Level VARCHAR,
    Score NUMERIC,
    Region VARCHAR,
    User_name VARCHAR,
    fk_Team_Team_ID VARCHAR
);

CREATE TABLE Champion (
    ID_champion NUMERIC PRIMARY KEY,
    Name VARCHAR,
    Ability VARCHAR,
    Damage_type VARCHAR,
    Function VARCHAR,
    fk_Player_Player_ID NUMERIC
);

CREATE TABLE Match (
    Match_ID NUMERIC PRIMARY KEY,
    Results VARCHAR,
    Duration TIME,
    Date_time DATE,
    fk_Champion_ID_champion NUMERIC
);

CREATE TABLE Player_match_Game (
    Player_points NUMERIC,
    Team_points NUMERIC,
    fk_Player_Player_ID NUMERIC,
    fk_Match_Match_ID NUMERIC
);

CREATE TABLE Item (
    Item_ID NUMERIC PRIMARY KEY,
    Cost NUMERIC,
    Description VARCHAR,
    Effect VARCHAR,
    Name VARCHAR,
    fk_Match_Match_ID NUMERIC
);

CREATE TABLE Offensive_item (
    Physic_damage VARCHAR,
    Magic_damage VARCHAR,
    fk_Item_Item_ID NUMERIC PRIMARY KEY
);

CREATE TABLE Consumable (
    fk_Item_Item_ID NUMERIC PRIMARY KEY
);

CREATE TABLE Deffensive_item (
    Armor VARCHAR,
    Res_magic VARCHAR,
    fk_Item_Item_ID NUMERIC PRIMARY KEY
);
 
ALTER TABLE Team ADD CONSTRAINT FK_Team_2
    FOREIGN KEY (fk_Match_Match_ID)
    REFERENCES Match (Match_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Player ADD CONSTRAINT FK_Player_2
    FOREIGN KEY (fk_Team_Team_ID)
    REFERENCES Team (Team_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Champion ADD CONSTRAINT FK_Champion_2
    FOREIGN KEY (fk_Player_Player_ID)
    REFERENCES Player (Player_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Match ADD CONSTRAINT FK_Match_2
    FOREIGN KEY (fk_Champion_ID_champion)
    REFERENCES Champion (ID_champion)
    ON DELETE RESTRICT;
 
ALTER TABLE Player_match_Game ADD CONSTRAINT FK_Player_match_Game_1
    FOREIGN KEY (fk_Player_Player_ID)
    REFERENCES Player (Player_ID);
 
ALTER TABLE Player_match_Game ADD CONSTRAINT FK_Player_match_Game_2
    FOREIGN KEY (fk_Match_Match_ID)
    REFERENCES Match (Match_ID);
 
ALTER TABLE Item ADD CONSTRAINT FK_Item_2
    FOREIGN KEY (fk_Match_Match_ID)
    REFERENCES Match (Match_ID)
    ON DELETE RESTRICT;
 
ALTER TABLE Offensive_item ADD CONSTRAINT FK_Offensive_item_2
    FOREIGN KEY (fk_Item_Item_ID)
    REFERENCES Item (Item_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Consumable ADD CONSTRAINT FK_Consumable_2
    FOREIGN KEY (fk_Item_Item_ID)
    REFERENCES Item (Item_ID)
    ON DELETE CASCADE;
 
ALTER TABLE Deffensive_item ADD CONSTRAINT FK_Deffensive_item_2
    FOREIGN KEY (fk_Item_Item_ID)
    REFERENCES Item (Item_ID)
    ON DELETE CASCADE;