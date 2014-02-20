SET GLOBAL max_allowed_packet = 3 * 1024 * 1024
GO
CREATE TABLE AddressBook (
 id_address_book INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
 id_client INT NOT NULL ,
 telephone_number CHAR (50) CHARACTER SET utf8 NOT NULL,
 nickname CHAR (20) CHARACTER SET utf8 NOT NULL,
 TYPE INT NOT NULL DEFAULT 1,
 speeddial CHAR (20) CHARACTER SET utf8 NOT NULL DEFAULT ''
)
GO
CREATE TABLE Calls (
 id_call INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_client INT NOT NULL,
 ip_number CHAR(33) NOT NULL,
 caller_id CHAR(40) NOT NULL,
 called_number CHAR(40) NOT NULL,
 call_start DATETIME NOT NULL,
 call_end DATETIME NOT NULL,
 route_type INT NOT NULL,
 id_tariff INT NOT NULL,
 cost DECIMAL(12, 4) NULL,
 duration INT NOT NULL,
 tariff_prefix CHAR (20) NOT NULL DEFAULT '',
 client_type INT NOT NULL,
 id_route INT NULL,
 pdd INT NOT NULL,
 costR1 DECIMAL(12,4) NOT NULL DEFAULT 0.0,
 costR2 DECIMAL(12,4) NOT NULL DEFAULT 0.0,
 costR3 DECIMAL(12,4) NOT NULL DEFAULT 0.0,
 costD DECIMAL(12,4) NOT NULL DEFAULT 0.0,
 id_reseller INT NOT NULL DEFAULT -1,
 tariffdesc CHAR(100)  NOT NULL DEFAULT '',
 id_cc INT NOT NULL DEFAULT 0,
 ratio DECIMAL(12,4) NOT NULL DEFAULT 1,
 client_pdd INT NOT NULL DEFAULT 0,
 orig_call_id VARCHAR(100) NOT NULL DEFAULT '',
 term_call_id VARCHAR(100) NOT NULL DEFAULT '',
 id_callback_call INT NOT NULL DEFAULT 0,
 id_cn INT NOT NULL DEFAULT 0,
 dialing_plan_prefix VARCHAR(50) NOT NULL DEFAULT '',
 call_rate NUMERIC(8, 4) NOT NULL DEFAULT 0.0,
 effective_duration INT NOT NULL DEFAULT 0,
 dtmf VARCHAR(255) NOT NULL DEFAULT '',
 call_data INT NOT NULL DEFAULT 0,
 tariff_data VARCHAR(255) NOT NULL DEFAULT ''
)
GO
CREATE TABLE CallsFailed (
 id_failed_call INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_client INT NOT NULL,
 ip_number CHAR(33) NOT NULL,
 caller_id CHAR(40) NOT NULL,
 called_number CHAR(40) NOT NULL,
 call_start DATETIME NOT NULL,
 route_type INT NOT NULL,
 IE_error_number INT NOT NULL,
 release_reason INT NOT NULL,
 client_type INT NOT NULL,
 id_route INT NOT NULL,
 pdd INT NOT NULL,
 TYPE INT NOT NULL,
 tariff_prefix CHAR (20) NOT NULL DEFAULT '',
 id_tariff INT NOT NULL DEFAULT 0,
 tariffdesc CHAR (100)  NOT NULL DEFAULT '',
 id_reseller INT NOT NULL DEFAULT -1,
 orig_call_id VARCHAR(100) NOT NULL DEFAULT '',
 term_call_id VARCHAR(100) NOT NULL DEFAULT '',
 id_cc INT NOT NULL DEFAULT 0,
 dialing_plan_prefix VARCHAR(50) NOT NULL DEFAULT '',
 id_cn INT NOT NULL DEFAULT 0,
 id_callback_call INT NOT NULL DEFAULT 0,
 dtmf VARCHAR(255) NOT NULL DEFAULT '',
 call_data INT NOT NULL DEFAULT 0
)
GO
CREATE TABLE CurrentCalls (
 id_call INT NOT NULL AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_active_call INT NOT NULL DEFAULT 0,
 id_client INT NOT NULL DEFAULT 0,
 dialed_number CHAR(40) NOT NULL DEFAULT '',
 call_start DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
 client_type INT NOT NULL DEFAULT 0,
 ani CHAR(40) NOT NULL DEFAULT '',
 id_route INT NOT NULL DEFAULT 0,
 route_type INT NOT NULL DEFAULT 0,
 id_reseller INT NOT NULL DEFAULT 0,
 tariffdesc CHAR (100)  NOT NULL DEFAULT '',
 id_cabin INT NOT NULL DEFAULT -1,
 cabin_type INT NOT NULL DEFAULT -1,
 id_cc INT NOT NULL DEFAULT 0,
 id_callback_call INT NOT NULL DEFAULT 0 ,
 call_rate NUMERIC(8,4) NOT NULL DEFAULT 0.0,
 id_voipswitch INT(11) NOT NULL DEFAULT '1',
 state INT(11) NOT NULL DEFAULT '3'
)
GO
CREATE TABLE clientinf (
 id_client INT(11) NOT NULL DEFAULT '0',
 client_type INT(11) NOT NULL DEFAULT '-1',
 id_lot INT(11) NOT NULL DEFAULT '0',
 SERIAL INT(11) DEFAULT NULL,
 serial2 VARCHAR(20) NOT NULL DEFAULT '',
 pin VARCHAR(20) DEFAULT NULL,
 activation_date DATETIME DEFAULT NULL,
 expiry_date DATETIME DEFAULT NULL,
 PRIMARY KEY (id_client, client_type, id_lot),
 UNIQUE KEY UQ_ClientInfPin (pin),
 KEY IC_ClientInfClientType (client_type),
 KEY IC_ClientInfLot (id_lot)
)
GO
CREATE TABLE ClientsE164 (
 id_client INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 login CHAR (20)  NOT NULL,
 PASSWORD CHAR (20)  NOT NULL,
 TYPE INT NOT NULL,
 id_tariff INT NOT NULL,
 account_state DECIMAL(12, 4) NOT NULL,
 tech_prefix TEXT NOT NULL,
 id_reseller INT NOT NULL DEFAULT -1,
 type2 INT NOT NULL DEFAULT 0,
 type3 INT NOT NULL DEFAULT 0,
 id_intrastate_tariff INT NOT NULL DEFAULT -1,
 id_currency INT NOT NULL DEFAULT '1',
 codecs INT  NOT NULL DEFAULT 0,
 primary_codec INT  NOT NULL DEFAULT 0
)
GO
CREATE TABLE ClientsHearLink (
 id_client INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 login CHAR(100) NOT NULL,
 PASSWORD CHAR(20)  NOT NULL,
 TYPE INT NOT NULL,
 id_tariff INT NOT NULL,
 account_state DECIMAL(12, 4) NOT NULL,
 tech_prefix TEXT NOT NULL,
 id_reseller INT NOT NULL DEFAULT -1,
 type2 INT NOT NULL DEFAULT 0,
 type3 INT NOT NULL DEFAULT 0,
 id_intrastate_tariff INT NOT NULL DEFAULT -1,
 id_currency INT NOT NULL DEFAULT '1'
)
GO
CREATE TABLE ClientsIP (
 id_client INT AUTO_INCREMENT NOT NULL,
 login CHAR(20) NOT NULL,
 PASSWORD CHAR(40) NOT NULL,
 TYPE INT NOT NULL,
 id_tariff INT NOT NULL,
 account_state DECIMAL(12, 4) NOT NULL,
 tech_prefix TEXT NOT NULL,
 id_reseller INT NOT NULL DEFAULT -1,
 type2 INT NOT NULL DEFAULT 0,
 type3 INT NOT NULL DEFAULT 0,
 id_intrastate_tariff INT NOT NULL DEFAULT -1,
 id_currency INT NOT NULL DEFAULT 1,
 codecs INT NOT NULL DEFAULT 0,
 primary_codec INT NOT NULL DEFAULT 0,
 limit_cps INT NOT NULL DEFAULT 0,
 PRIMARY KEY (id_client),
 UNIQUE KEY UQ_ClientsIPLogin (login),
 KEY IX_ClientsIPPassword (PASSWORD),
 KEY IX_ClientsIPReseller (id_reseller),
 KEY IX_ClientsIPTariffs (id_tariff),
 KEY IX_ClientsIPCurrency (id_currency)
)
GO
CREATE TABLE ClientsCallBack (
 id_client INT AUTO_INCREMENT NOT NULL,
 login CHAR(20) NOT NULL DEFAULT '',
 PASSWORD CHAR(40) NOT NULL DEFAULT '',
 TYPE INT NOT NULL DEFAULT 0,
 id_tariff INT NOT NULL DEFAULT 0,
 account_state DECIMAL(12,4) NOT NULL DEFAULT 0.0000,
 tech_prefix TEXT NOT NULL,
 id_reseller INT NOT NULL DEFAULT -1 ,
 type2 INT NOT NULL DEFAULT 0 ,
 type3 INT NOT NULL DEFAULT 0 ,
 id_intrastate_tariff INT NOT NULL DEFAULT -1 ,
 id_currency INT NOT NULL DEFAULT '1',
 PRIMARY KEY (id_client),
 UNIQUE KEY UQ_ClientsCallBackLogin (login),
 KEY IX_ClientsCallBackPassword (PASSWORD),
 KEY IX_ClientsCallBackReseller (id_reseller),
 KEY IX_ClientsCallBackTariffs (id_tariff),
 KEY IX_ClientsCallBackCurrency (id_currency)
)
GO
CREATE TABLE ClientsPin (
 id_client INT AUTO_INCREMENT NOT NULL,
 login CHAR(20) NOT NULL DEFAULT '',
 PASSWORD CHAR(40) NOT NULL DEFAULT '',
 web_password VARCHAR(40) NOT NULL DEFAULT '',
 TYPE INT NOT NULL DEFAULT 0,
 id_tariff INT NOT NULL DEFAULT 0,
 account_state DECIMAL(12,4) NOT NULL DEFAULT 0.0000,
 tech_prefix TEXT NOT NULL,
 id_reseller INT NOT NULL DEFAULT -1,
 type2 INT NOT NULL DEFAULT 0,
 type3 INT NOT NULL DEFAULT 0,
 id_intrastate_tariff INT NOT NULL DEFAULT -1,
 id_currency INT NOT NULL DEFAULT '1',
 PRIMARY KEY (id_client),
 UNIQUE KEY UQ_ClientsPinLogin (login),
 KEY IX_ClientsPinPassword (PASSWORD),
 KEY IX_ClientsPinReseller (id_reseller),
 KEY IX_ClientsPinTariffs (id_tariff),
 KEY IX_ClientsPinCurrency (id_currency)
)
GO
CREATE TABLE ClientsShared (
 id_client INT AUTO_INCREMENT NOT NULL,
 login CHAR(20) NOT NULL DEFAULT '',
 PASSWORD CHAR(40) NOT NULL DEFAULT '',
 web_password VARCHAR(40) NOT NULL DEFAULT '',
 TYPE INT NOT NULL DEFAULT 0,
 id_tariff INT NOT NULL DEFAULT 0,
 account_state DECIMAL(12,4) NOT NULL DEFAULT 0.0000,
 tech_prefix TEXT NOT NULL,
 id_reseller INT NOT NULL DEFAULT -1,
 type2 INT NOT NULL DEFAULT 0,
 type3 INT NOT NULL DEFAULT 0,
 id_intrastate_tariff INT NOT NULL DEFAULT -1,
 id_currency INT NOT NULL DEFAULT '1' ,
 codecs INT NOT NULL DEFAULT 0,
 primary_codec INT NOT NULL DEFAULT 0,
 id_tariff_vod INT NOT NULL DEFAULT 0,
 PRIMARY KEY (id_client),
 UNIQUE KEY UQ_ClientsSharedLogin (login),
 KEY IX_ClientsSharedPassword (PASSWORD),
 KEY IX_ClientsSharedReseller (id_reseller),
 KEY IX_ClientsSharedTariffs (id_tariff),
 KEY IX_ClientsSharedCurrency (id_currency),
 KEY IX_ClientsSharedWebPassword (web_password) 
)
GO
CREATE TABLE DialingPlan (
 id_dialplan INT(11) NOT NULL AUTO_INCREMENT,
 telephone_number VARCHAR(40) NOT NULL DEFAULT '',
 priority SMALLINT(6) NOT NULL,
 route_type INT(11) NOT NULL,
 tech_prefix TEXT NOT NULL,
 dial_as CHAR(40) NOT NULL DEFAULT '',
 id_route INT(11) NOT NULL,
 call_type INT(11) UNSIGNED NOT NULL,
 TYPE INT(11) NOT NULL,
 from_day SMALLINT(6) NOT NULL DEFAULT '0',
 to_day SMALLINT(6) NOT NULL DEFAULT '6',
 from_hour SMALLINT(6) NOT NULL DEFAULT '0',
 to_hour SMALLINT(6) NOT NULL DEFAULT '2400',
 balance_share INT(11) NOT NULL DEFAULT '100',
 FIELDS VARCHAR(1024) NOT NULL DEFAULT '',
 call_limit INT(11) NOT NULL DEFAULT '0',
 PRIMARY KEY (id_dialplan),
 KEY IX_DialingPlanNumber (telephone_number),
 KEY IX_DialingPlanPriority (priority)
)
GO
CREATE TABLE Gatekeepers (
 id_route INT(11) NOT NULL AUTO_INCREMENT,
 description CHAR(20) DEFAULT NULL,
 ip_number CHAR(255) NOT NULL,
 h323_id CHAR(100) NOT NULL DEFAULT '',
 e164_id CHAR(100) NOT NULL DEFAULT '',
 ttl INT(11) NOT NULL,
 token CHAR(10) NOT NULL DEFAULT '',
 TYPE INT(11) NOT NULL,
 gk_name CHAR(100) NOT NULL DEFAULT '',
 id_tariff INT(11) NOT NULL DEFAULT '-1',
 string1 CHAR(255) NOT NULL DEFAULT '',
 call_limit INT(11) NOT NULL DEFAULT '0',
 tech_prefix TEXT NOT NULL,
 codecs INT(11) NOT NULL DEFAULT '0',
 video_codecs INT(11) NOT NULL DEFAULT '0',
 fax_codecs INT(11) NOT NULL DEFAULT '0',
 authentication_name VARCHAR(100) NOT NULL DEFAULT '',
 authentication_password VARCHAR(100) NOT NULL DEFAULT '',
 id_intrastate_tariff INT(11) DEFAULT '0' NOT NULL,
 PRIMARY KEY (id_route)
)
GO
CREATE TABLE Gateways (
 id_route INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 description CHAR(20) NOT NULL,
 ip_number CHAR(255) NOT NULL,
 h323_id CHAR(100) NOT NULL,
 TYPE INT NOT NULL,
 call_limit INT NOT NULL DEFAULT 0,
 id_tariff INT NOT NULL DEFAULT -1,
 tech_prefix TEXT NOT NULL,
 codecs INT NOT NULL DEFAULT 0,
 video_codecs INT NOT NULL DEFAULT 0,
 fax_codecs INT NOT NULL DEFAULT 0,
 id_intrastate_tariff INT(11) DEFAULT '0' NOT NULL
)
GO
CREATE TABLE ipnumbers (
 id_ip INT(11) NOT NULL AUTO_INCREMENT,
 ip_number CHAR(16) NOT NULL,
 id_client INT(11) NOT NULL,
 tech_prefix TEXT NULL,
 PRIMARY KEY (id_ip),
 KEY IX_ClientsIPNumber (ip_number)
)
GO
CREATE TABLE Lots (
 id_lot INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 lot_desc CHAR(20) NOT NULL,
 creation_date DATETIME NOT NULL,
 client_type INT NOT NULL DEFAULT 1,
 expiry_date DATETIME DEFAULT '0000-00-00 00:00:00' NOT NULL,
 active_time INT(11) DEFAULT '-1' NOT NULL,
 active_period INT(11) DEFAULT '1' NOT NULL
)
GO
CREATE TABLE Tariffs (
 id_tariffs_key INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_tariff INT NOT NULL,
 prefix CHAR(20) NOT NULL,
 description CHAR(100) NOT NULL,
 voice_rate NUMERIC(8, 4) NOT NULL,
 from_day SMALLINT NOT NULL,
 to_day SMALLINT NOT NULL,
 from_hour SMALLINT NULL,
 to_hour SMALLINT NOT NULL,
 grace_period INT NOT NULL DEFAULT 0,
 minimal_time SMALLINT NOT NULL DEFAULT -1,
 resolution SMALLINT NOT NULL DEFAULT -1,
 rate_multiplier DOUBLE NOT NULL DEFAULT -1.0,
 rate_addition DOUBLE NOT NULL DEFAULT -1.0,
 surcharge_time SMALLINT NOT NULL DEFAULT -1,
 surcharge_amount DECIMAL(12,4) NOT NULL DEFAULT -1.0,
 free_seconds VARCHAR(255) NOT NULL DEFAULT '',
 country_code CHAR(2) NULL,
 INDEX IX_tariff__country_code (country_code)
)
GO
CREATE TABLE TariffsNames (
 id_tariff INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
 description VARCHAR(40) NOT NULL ,
 minimal_time SMALLINT NULL ,
 resolution SMALLINT NULL ,
 surcharge_time SMALLINT NOT NULL DEFAULT 0,
 surcharge_amount DECIMAL(12,4) NOT NULL DEFAULT 0.0 ,
 TYPE INT NOT NULL DEFAULT 0 ,
 rate_multiplier DOUBLE NOT NULL DEFAULT -1.0 ,
 rate_addition DOUBLE NOT NULL DEFAULT -1.0 ,
 id_currency INT NOT NULL DEFAULT 1,
 time_to_start DATETIME DEFAULT NULL,
 base_tariff_id INT NOT NULL DEFAULT -1,
 cost_threshold_resolution DOUBLE NOT NULL DEFAULT 0,
 cost_threshold DOUBLE NOT NULL DEFAULT 0
)
GO
CREATE TABLE ClientTypes (
 id_client_type INT PRIMARY KEY NOT NULL,
 client_type_name CHAR(50) NOT NULL
)
GO
CREATE TABLE RouteTypes (
 id_route_type INT PRIMARY KEY NOT NULL,
 route_type_name CHAR(50) NOT NULL
)
GO
CREATE TABLE smsmessages (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 phone CHAR(50) NULL,
 message CHAR(250) NULL
)
GO
CREATE TABLE smsMessagesResp (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_client INT NOT NULL,
 message CHAR(255) NOT NULL,
 phone CHAR(50)  NOT NULL,
 DATA DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
 cost DECIMAL(12,4) NOT NULL DEFAULT 0.0000,
 STATUS INT NOT NULL DEFAULT 1,
 client_type INT NOT NULL DEFAULT 4
)
GO
CREATE TABLE ClientsCallbackPhones (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 phone_number CHAR(50) NOT NULL,
 def SMALLINT(6) NOT NULL DEFAULT '0',
 client_type INT(11) NOT NULL DEFAULT '4',
 PRIMARY KEY (id),
 KEY IX_ClientCallBackPhone (phone_number),
 UNIQUE KEY UQ_ClientCallBackPhone (id_client,phone_number,client_type)
)
GO
CREATE TABLE VoipBox (
 id INT PRIMARY KEY NOT NULL,
 description CHAR(50) NOT NULL
)
GO
CREATE TABLE Noroutes (
 id_route INT PRIMARY KEY NOT NULL,
 description CHAR(50) NOT NULL
)
GO
CREATE TABLE activepc2phone (
 id_active_pc2phone INT NOT NULL DEFAULT '0',
 id_client INT DEFAULT NULL,
 login VARCHAR(20) DEFAULT NULL,
 login_time DATETIME DEFAULT NULL,
 ip_number VARCHAR(33) DEFAULT NULL,
 PRIMARY KEY (id_active_pc2phone)
)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsE ON ClientsE164(login)
GO
CREATE UNIQUE INDEX IX_ClientsLoginsH ON ClientsHearLink(login)
GO
CREATE UNIQUE INDEX IX_LotsDesc ON Lots(lot_desc)
GO
INSERT INTO TariffsNames(id_tariff,description,minimal_time,resolution,TYPE) VALUES (1,'TestTariff',1,6,0)
GO
INSERT INTO Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
VALUES (1,'1','',0.01,0,6,0,2400)
GO
INSERT INTO Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
VALUES (1,'2','',0.01,0,6,0,2400)
GO
INSERT INTO Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
VALUES (1,'3','',0.01,0,6,0,2400)
GO
INSERT INTO Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
VALUES (1,'4','',0.01,0,6,0,2400)
GO
INSERT INTO Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
VALUES (1,'5','',0.01,0,6,0,2400)
GO
INSERT INTO Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
VALUES (1,'6','',0.01,0,6,0,2400)
GO
INSERT INTO Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
VALUES (1,'7','',0.01,0,6,0,2400)
GO
INSERT INTO Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
VALUES (1,'8','',0.01,0,6,0,2400)
GO
INSERT INTO Tariffs(id_tariff,prefix,description,voice_rate,from_day,to_day,from_hour,to_hour)
VALUES (1,'9','',0.01,0,6,0,2400)
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(0,'GW/Proxy clients')
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(1, 'Client PC2Phone')
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(2, 'GK/Registrar clients')
GO
INSERT INTO ClientTypes(id_client_type, client_type_name)
VALUES(4, 'Client Callback')
GO
INSERT INTO ClientTypes (id_client_type,client_type_name)
VALUES (8,'Client IVR')
GO
INSERT INTO ClientTypes (id_client_type,client_type_name)
VALUES (16,'Client CallShop')
GO
INSERT INTO ClientTypes (id_client_type,client_type_name)
VALUES (32,'Client Common')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(0, 'External gateway')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(1, 'Internal gatekeeper')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(2, 'External gatekeeper')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(3, 'PC2Phone user')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(4, 'VoipBox')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(5, 'Common client')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(6, 'Enum route')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(7, 'Lookup')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(8, 'SMS')
GO
INSERT INTO RouteTypes(id_route_type, route_type_name)
VALUES(9, 'MMS')
GO
INSERT INTO VoipBox(id, description)
VALUES(0, 'Account state')
GO
INSERT INTO VoipBox(id, description)
VALUES(1, 'PIN')
GO
INSERT INTO VoipBox(id, description)
VALUES(2, 'PIN + time')
GO
INSERT INTO VoipBox(id, description)
VALUES(3, 'PIN + account')
GO
INSERT INTO VoipBox(id, description)
VALUES(4, 'PIN + account + time')
GO
INSERT INTO VoipBox(id, description)
VALUES(5, 'Ask for number')
GO
INSERT INTO VoipBox(id, description)
VALUES(6, 'Ask for number + time')
GO
INSERT INTO VoipBox(id, description)
VALUES(7, 'Select language')
GO
INSERT INTO VoipBox(id, description)
VALUES(8, 'Recharge')
GO
INSERT INTO VoipBox( id,description ) VALUES (9,'Select language + PIN')
GO
INSERT INTO VoipBox( id,description ) VALUES (10,'Select language + PIN + time')
GO
INSERT INTO VoipBox( id,description ) VALUES (11,'Select language + PIN + account')
GO
INSERT INTO VoipBox( id,description ) VALUES (12,'Select language + PIN + account + time')
GO
INSERT INTO VoipBox( id,description ) VALUES (13,'Select language + Ask for number')
GO
INSERT INTO VoipBox( id,description ) VALUES (14,'Select language + Ask for number + time')
GO
INSERT INTO VoipBox( id,description ) VALUES (15, 'PIN + Recharge')
GO
INSERT INTO Noroutes(id_route, description)
VALUES(-2, 'No Gateway')
GO
INSERT INTO Noroutes(id_route, description)
VALUES(-3, 'No Tariff')
GO
INSERT INTO Noroutes(id_route, description)
VALUES(-4, 'Number disabled')
GO
CREATE TABLE IF NOT EXISTS Companies (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 NAME CHAR(200) NULL,
 address CHAR(255) NULL,
 zip CHAR(50) NULL,
 city CHAR(100) NULL,
 country CHAR(100) NULL,
 email CHAR(255) NULL,
 phone CHAR(255) NULL,
 phone1 CHAR(255) NULL
)
GO
CREATE TABLE IF NOT EXISTS CompaniesClients (
 id_company INT NOT NULL,
 id_client INT NOT NULL,
 client_type INT NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS payment_tag (
 id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 tag_name VARCHAR(40) NOT NULL,
 PRIMARY KEY (id)
) AUTO_INCREMENT=1000
GO
INSERT INTO payment_tag (id,tag_name) VALUES (1,'Referral')
GO
CREATE TABLE IF NOT EXISTS payments (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 money DECIMAL(12,4) DEFAULT NULL,
 DATA DATETIME DEFAULT NULL,
 TYPE INT(11) DEFAULT NULL,
 description CHAR(255) NOT NULL DEFAULT '',
 invoice_id INT(11) NOT NULL DEFAULT '0',
 actual_value DECIMAL(12,4) DEFAULT '-1.0000',
 id_plan INT(11) DEFAULT '-1',
 id_payment_tag INT(11) UNSIGNED DEFAULT NULL,
 module ENUM('OS','VSM','VSC','VSR') DEFAULT 'OS' NOT NULL,
 id_module_user INT(11) UNSIGNED NULL,
 PRIMARY KEY (id),
 KEY IX_payment__id_client__client_type (id_client, client_type),
 KEY IX_payment__payment_tag (id_payment_tag),
 CONSTRAINT FK_payment__payment_tag FOREIGN KEY (id_payment_tag) REFERENCES payment_tag (id) ON DELETE SET NULL ON UPDATE CASCADE
)
GO
INSERT INTO ClientsIP (id_client, login, PASSWORD, tech_prefix, TYPE, id_tariff, account_state, codecs, primary_codec, id_currency) VALUES (1, 'smallgw', CONV(FLOOR(RAND() * 99999999999999), 20, 36), '', '15794690', '1', '10.0', '11', '4', '1')
GO
INSERT INTO Payments (id_client, client_type, money, DATA, TYPE, description) VALUES (1, 0, 10.0, NOW(), 1, 'initial payment')
GO
CREATE TABLE IF NOT EXISTS resellerspayments (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_reseller INT(11) DEFAULT NULL,
 resellerlevel INT(11) NOT NULL DEFAULT '0',
 money DECIMAL(12,4) DEFAULT NULL,
 DATA DATETIME DEFAULT NULL,
 TYPE INT(11) NOT NULL DEFAULT '0',
 actual_value DECIMAL(12,4) DEFAULT '-1.0000',
 id_plan INT(11) DEFAULT '-1',
 description VARCHAR(255) NOT NULL DEFAULT '',
 invoice_id INT(11) NOT NULL DEFAULT '-1',
 id_payment_tag INT(11) UNSIGNED DEFAULT NULL,
 module ENUM('OS','VSM','VSC','VSR') DEFAULT 'OS' NOT NULL,
 id_module_user INT(11) UNSIGNED NULL,
 PRIMARY KEY (id),
 KEY IX_reseller_payment__payment_tag (id_payment_tag),
 KEY IX_reseller_payment__id_reseller__reseller_level (id_reseller,resellerlevel),
 CONSTRAINT FK_resellerspayment__payment_tag FOREIGN KEY (id_payment_tag) REFERENCES payment_tag (id) ON DELETE SET NULL ON UPDATE CASCADE
)
GO

CREATE TABLE IF NOT EXISTS PaymentTypes (
 id INT PRIMARY KEY NOT NULL,
 NAME CHAR (40),
 show_on_invoice BIT NOT NULL DEFAULT 0
)
GO
CREATE TABLE IF NOT EXISTS CallShopUsers (
 id_callshopuser INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_callshop INT NOT NULL,
 id_client INT NOT NULL,
 client_type INT NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS ClientsCallShop (
 id_client INT AUTO_INCREMENT NOT NULL,
 login CHAR(20) NOT NULL ,
 PASSWORD CHAR(40) NOT NULL ,
 TYPE INT NOT NULL DEFAULT 1 ,
 id_tariff INT NOT NULL ,
 account_state DECIMAL(12, 4) NOT NULL DEFAULT 0.0,
 id_reseller INT NOT NULL DEFAULT -1 ,
 id_intrastate_tariff INT NOT NULL DEFAULT -1,
 tech_prefix TEXT NOT NULL,
 id_currency INT NOT NULL DEFAULT '1',
 template_id INTEGER NOT NULL DEFAULT -1,
 PRIMARY KEY (id_client),
 UNIQUE KEY UQ_ClientsCallshopLogin (login),
 KEY IX_ClientsCallshopPassword (PASSWORD),
 KEY IX_ClientsCallshopTariffs (id_tariff),
 KEY IX_ClientsCallshopReseller (id_reseller),
 KEY IX_ClientsCallshopCurrency (id_currency)
)
GO
ALTER TABLE CompaniesClients ADD PRIMARY KEY (id_company,id_client,client_type)
GO
INSERT INTO PaymentTypes(id, NAME, show_on_invoice) VALUES(1,'Payment',1)
GO
INSERT INTO PaymentTypes(id, NAME) VALUES(2,'Credit')
GO
INSERT INTO PaymentTypes(id, NAME, show_on_invoice) VALUES(3,'Return',1)
GO
INSERT INTO PaymentTypes(id, NAME) VALUES(4,'Return credit')
GO
INSERT INTO PaymentTypes(id, NAME) VALUES(5,'Plan')
GO
INSERT INTO PaymentTypes(id, NAME) VALUES(6,'Return plan')
GO
CREATE TABLE IF NOT EXISTS PinsLots (
 id INT(11) NOT NULL AUTO_INCREMENT,
 NAME CHAR(50) NOT NULL,
 dat DATETIME NOT NULL,
 id_currency INT(11) NOT NULL DEFAULT '-1',
 PRIMARY KEY (id),
 KEY IX_PlansLots_Currency (id_currency)
)
GO
CREATE TABLE IF NOT EXISTS Pins (
 NAME CHAR(100) NOT NULL,
 id_status INT(11) NOT NULL,
 SERIAL INT(11) NOT NULL,
 id_lot INT(11) NOT NULL,
 amount DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 PRIMARY KEY (NAME),
 KEY IX_PinsIdLot (id_lot),
 CONSTRAINT FK_PinsLot FOREIGN KEY (id_lot) REFERENCES pinslots (id)
)
GO
CREATE TABLE IF NOT EXISTS PinsStatus (
 id INT(11) NOT NULL AUTO_INCREMENT,
 NAME CHAR(50) NOT NULL DEFAULT '',
 PRIMARY KEY (id)
)
GO
INSERT INTO PinsStatus(id,NAME) VALUES(1,'Active')
GO
INSERT INTO PinsStatus(id,NAME) VALUES(2,'Inactive')
GO
INSERT INTO PinsStatus(id,NAME) VALUES(3,'Used')
GO
CREATE TABLE IF NOT EXISTS CallsCallshop (
 id_call INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
 id_client INT NOT NULL ,
 ip_number CHAR (33)  NOT NULL ,
 caller_id CHAR (40) NOT NULL ,
 called_number CHAR (40)  NOT NULL ,
 call_start DATETIME NOT NULL ,
 call_end DATETIME NOT NULL ,
 route_type INT NOT NULL ,
 id_tariff INT NOT NULL ,
 cost DECIMAL(12, 4) NULL ,
 duration INT NOT NULL ,
 tariff_prefix CHAR (20) NOT NULL DEFAULT '',
 client_type INT NOT NULL ,
 id_route INT NULL,
 pdd INT NOT NULL,
 costR1 DECIMAL (12,4) NOT NULL DEFAULT 0.0 ,
 costR2 DECIMAL (12,4) NOT NULL DEFAULT 0.0 ,
 costR3 DECIMAL (12,4) NOT NULL DEFAULT 0.0 ,
 costD DECIMAL (12,4) NOT NULL DEFAULT 0.0 ,
 id_reseller INT NOT NULL DEFAULT -1 ,
 tariffdesc CHAR (100) NOT NULL DEFAULT '',
 id_cc INT NOT NULL DEFAULT 0,
 ratio DECIMAL(12,4) NOT NULL DEFAULT 1,
 invoice_id INT NOT NULL DEFAULT -1 ,
 client_pdd INT NOT NULL DEFAULT 0 ,
 orig_call_id VARCHAR(100) NOT NULL DEFAULT '',
 term_call_id VARCHAR(100) NOT NULL DEFAULT '',
 id_callback_call INT NOT NULL DEFAULT 0 ,
 id_cn INT NOT NULL DEFAULT 0 ,
 dialing_plan_prefix VARCHAR(50) NOT NULL DEFAULT '',
 call_rate NUMERIC(8, 4) NOT NULL DEFAULT 0.0 ,
 effective_duration INT NOT NULL DEFAULT 0 ,
 call_data INT NOT NULL DEFAULT 0 ,
 dtmf VARCHAR(255) NOT NULL DEFAULT ''
)
GO
CREATE INDEX IX_CallsCallshop_Idcc ON CallsCallshop(id_cc)
GO
CREATE TABLE IF NOT EXISTS DIDCallback(
 didnumber CHAR (50) NOT NULL,
 clientnumber CHAR (50) NOT NULL,
 id_client INT NOT NULL,
 client_type INT NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS PrefixTariff (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 prefix CHAR (50) NOT NULL,
 id_tariff INT NOT NULL,
 TYPE INT NOT NULL DEFAULT 0
)
GO
CREATE TABLE IF NOT EXISTS ANITariff (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
 prefix CHAR (50) NOT NULL ,
 id_tariff INT NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS RoutesUsers (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 login CHAR(50) NOT NULL,
 PASSWORD CHAR(50) NOT NULL,
 id_route INT NOT NULL,
 route_type INT NOT NULL ,
 CostVisible INT NOT NULL DEFAULT 1
)
GO
CREATE TABLE IF NOT EXISTS Languages (
 id INT PRIMARY KEY NOT NULL,
 NAME CHAR (100) NOT NULL DEFAULT ''
)
GO
INSERT INTO Languages(id,NAME) VALUES (0,'English')
GO
INSERT INTO Languages(id,NAME) VALUES (1,'Chinese')
GO
INSERT INTO Languages(id,NAME) VALUES (2,'Vietnamese')
GO
INSERT INTO Languages(id,NAME) VALUES (3,'Albanian')
GO
INSERT INTO Languages(id,NAME) VALUES (4,'French')
GO
INSERT INTO Languages(id,NAME) VALUES (5,'Polish')
GO
INSERT INTO Languages(id,NAME) VALUES (6,'Spanish')
GO
INSERT INTO Languages(id,NAME) VALUES (7,'Portugese')
GO
INSERT INTO Languages(id,NAME) VALUES (8,'BenGOli')
GO
INSERT INTO Languages(id,NAME) VALUES (9,'Romanian')
GO
INSERT INTO Languages(id,NAME) VALUES (10,'Russian')
GO
INSERT INTO Languages(id,NAME) VALUES (11,'Arabic')
GO
INSERT INTO Languages(id,NAME) VALUES (12,'Turkish')
GO
INSERT INTO Languages(id,NAME) VALUES (13,'Hebrew')
GO
INSERT INTO Languages(id,NAME) VALUES (14,'Thai')
GO
INSERT INTO Languages(id,NAME) VALUES (15,'English2')
GO
INSERT INTO Languages(id,NAME) VALUES (16,'Bulgarian')
GO
INSERT INTO Languages(id,NAME) VALUES (17,'German')
GO
CREATE TABLE IF NOT EXISTS Resellers1 (
 id INT NOT NULL AUTO_INCREMENT,
 idReseller INT NULL,
 login CHAR(20) NOT NULL,
 PASSWORD CHAR(40) NOT NULL,
 TYPE INT NOT NULL,
 id_tariff INT NOT NULL,
 callsLimit DECIMAL(12,4) DEFAULT 0.0000 NOT NULL,
 clientsLimit DECIMAL(12,4) DEFAULT 0.0000 NOT NULL,
 tech_prefix TEXT NOT NULL,
 identifier CHAR(20) NOT NULL DEFAULT '',
 Fullname CHAR(200) NOT NULL DEFAULT '',
 Address CHAR(200) NOT NULL DEFAULT '',
 City CHAR(50) NOT NULL DEFAULT '',
 ZipCode CHAR(20) NOT NULL DEFAULT '',
 Country CHAR(50) NOT NULL DEFAULT '',
 Phone CHAR(50) NOT NULL DEFAULT '',
 Email CHAR(200) NOT NULL DEFAULT '',
 MaxClients INT NOT NULL DEFAULT 0,
 template_id INT NOT NULL DEFAULT -1,
 TaxID VARCHAR(50) NOT NULL DEFAULT '',
 storageLimit INT NOT NULL DEFAULT 0,
 type2 INT NOT NULL DEFAULT 0,
 LANGUAGE CHAR(2) NOT NULL DEFAULT '',
 PRIMARY KEY (id),
 UNIQUE KEY UQ_Resellers1Login (login)
)
GO
CREATE TABLE IF NOT EXISTS Resellers2 (
 id INT NOT NULL AUTO_INCREMENT,
 idReseller INT NULL,
 login CHAR(20) NOT NULL,
 PASSWORD CHAR(40) NOT NULL,
 TYPE INT NOT NULL,
 id_tariff INT NOT NULL,
 callsLimit DECIMAL(12, 4) DEFAULT 0.0000 NOT NULL,
 clientsLimit DECIMAL(12, 4) DEFAULT 0.0000 NOT NULL,
 tech_prefix TEXT NOT NULL,
 identifier CHAR(20) NOT NULL DEFAULT '' ,
 Fullname CHAR(200) NOT NULL DEFAULT '',
 Address CHAR(200) NOT NULL DEFAULT '',
 City CHAR(50) NOT NULL DEFAULT '',
 ZipCode CHAR(20) NOT NULL DEFAULT '',
 Country CHAR(50) NOT NULL DEFAULT '',
 Phone CHAR(50) NOT NULL DEFAULT '',
 Email CHAR(200) NOT NULL DEFAULT '',
 template_id INT NOT NULL DEFAULT -1,
 TaxID VARCHAR(50) NOT NULL DEFAULT '',
 type2 INT NOT NULL DEFAULT '0',
 LANGUAGE CHAR(2) NOT NULL DEFAULT '',
 PRIMARY KEY (id),
 UNIQUE KEY UQ_Resellers2Login (login)
)
GO
CREATE TABLE IF NOT EXISTS Resellers3 (
 id INT NOT NULL AUTO_INCREMENT,
 login CHAR(20) NOT NULL,
 PASSWORD CHAR(40) NOT NULL,
 TYPE INT NOT NULL,
 id_tariff INT NOT NULL,
 callsLimit DECIMAL(12, 4) DEFAULT 0.0000 NOT NULL,
 clientsLimit DECIMAL(12, 4) DEFAULT 0.0000 NOT NULL,
 tech_prefix TEXT NOT NULL,
 identifier CHAR(20) NOT NULL DEFAULT '' ,
 Fullname CHAR(200) NOT NULL DEFAULT '',
 Address CHAR(200) NOT NULL DEFAULT '',
 City CHAR(50) NOT NULL DEFAULT '',
 ZipCode CHAR(20) NOT NULL DEFAULT '',
 Country CHAR(50) NOT NULL DEFAULT '',
 Phone CHAR(50) NOT NULL DEFAULT '',
 Email CHAR(200) NOT NULL DEFAULT '',
 TaxID VARCHAR(50) NOT NULL DEFAULT '',
 type2 INT NOT NULL DEFAULT '0',
 LANGUAGE CHAR(2) NOT NULL DEFAULT '',
 PRIMARY KEY (id),
 UNIQUE KEY UQ_Resellers3Login (login)
)
GO
CREATE TABLE IF NOT EXISTS Users (
 id_user INT(11) NOT NULL AUTO_INCREMENT,
 login VARCHAR(255) NOT NULL DEFAULT '',
 PASSWORD VARCHAR(128) NOT NULL DEFAULT '',
 fullname VARCHAR(255) NOT NULL DEFAULT '',
 address VARCHAR(255) NOT NULL DEFAULT '',
 city VARCHAR(255) NOT NULL DEFAULT '',
 zipcode VARCHAR(255) NOT NULL DEFAULT '',
 country VARCHAR(255) NOT NULL DEFAULT '',
 phone VARCHAR(255) NOT NULL DEFAULT '',
 email VARCHAR(255) NOT NULL DEFAULT '',
 TYPE INT(11) NOT NULL DEFAULT '0',
 id_client INT(11) NOT NULL DEFAULT '-1',
 client_type INT(11) NOT NULL DEFAULT '-1',
 PRIMARY KEY (id_user),
 UNIQUE KEY IX_UsersLogins (login),
 KEY IX_UsersClientId (id_client),
 KEY IX_UsersClientType (client_type)
)
GO
CREATE TABLE IF NOT EXISTS tariffreseller (
 id_tariff INT NOT NULL,
 id_reseller INT NOT NULL DEFAULT '0',
 resellerlevel INT NOT NULL DEFAULT '0'
)
GO
ALTER TABLE tariffreseller ADD PRIMARY KEY (id_tariff,id_reseller,resellerLevel)
GO
CREATE TABLE IF NOT EXISTS lotreseller (
 id_lot INT PRIMARY KEY NOT NULL DEFAULT '0',
 id_reseller INT NOT NULL DEFAULT '0'
)
GO
CREATE TABLE RedirectPhones (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_client INT NOT NULL DEFAULT '0',
 client_type INT NOT NULL DEFAULT '0',
 call_end_reason INT NOT NULL DEFAULT '0',
 follow_me_number VARCHAR (255)  NOT NULL DEFAULT '' ,
 number_priority SMALLINT NOT NULL DEFAULT '0' ,
 did_number VARCHAR (100)  NOT NULL DEFAULT ''
)
GO
CREATE INDEX IX_RedirectPhones ON RedirectPhones(id_client,client_type)
GO
CREATE TABLE IF NOT EXISTS InvoiceClients (
 IdClient INT(11) NOT NULL,
 TYPE INT(11) NOT NULL,
 NAME VARCHAR(200) DEFAULT NULL,
 LastName VARCHAR(100) DEFAULT NULL,
 Address VARCHAR(1000) DEFAULT NULL,
 EMail VARCHAR(500) DEFAULT NULL,
 Login VARCHAR(50) NOT NULL DEFAULT '',
 TaxId VARCHAR(50) DEFAULT NULL,
 LastUsed TINYINT(1) NOT NULL DEFAULT '0',
 ClientNr VARCHAR(50) DEFAULT NULL,
 City VARCHAR(200) DEFAULT NULL,
 State VARCHAR(200) DEFAULT NULL,
 Zip VARCHAR(50) DEFAULT NULL,
 Country VARCHAR(100) DEFAULT NULL,
 PaymentCode CHAR(20) NOT NULL DEFAULT '',
 Phone VARCHAR(30) DEFAULT NULL,
 CustomFields TEXT NOT NULL,
 InvoiceType INT(11) NOT NULL DEFAULT '1',
 MobilePhone VARCHAR(30) DEFAULT NULL,
 Creation_Date DATETIME DEFAULT '1900-01-01 00:00:00' NOT NULL,
 Company_Name VARCHAR(200) NOT NULL DEFAULT '',
 frequency TINYINT UNSIGNED DEFAULT 0 NOT NULL,
 start_date DATE NULL,
 end_date DATE NULL,
 payment_due TINYINT UNSIGNED DEFAULT 0 NOT NULL,
 PRIMARY KEY (IDClient,TYPE)
)
GO
CREATE TABLE IF NOT EXISTS voicemessages(
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 message_start DATETIME NOT NULL,
 duration INT(11) NOT NULL,
 message_type INT(11) NOT NULL DEFAULT '0',
 caller_ani CHAR(40) NOT NULL DEFAULT '',
 filename CHAR(255) NOT NULL DEFAULT '',
 id_message INT(11) NOT NULL DEFAULT '0',
 remind_send INT(1) DEFAULT '0',
 message_text TEXT,
 display_name VARCHAR(100) NOT NULL DEFAULT '',
 PRIMARY KEY (id),
 KEY IX_VoiceMessagesClientType (id_client,client_type)
)
GO
CREATE TABLE IF NOT EXISTS voicemailusers(
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_client INT NOT NULL,
 client_type INT NOT NULL,
 email CHAR(255) NOT NULL DEFAULT '',
 start_message CHAR(255) NOT NULL DEFAULT ''
)
GO
CREATE INDEX IX_voicemailusersClientType ON voicemailusers(id_client,client_type)
GO
CREATE INDEX IX_CallsResellers ON Calls(id_reseller)
GO
CREATE INDEX IX_CallsCallStart ON Calls(call_start)
GO
CREATE INDEX IX_CallsIDTariff ON Calls(id_tariff)
GO
CREATE INDEX IX_CallsIDClient ON Calls(id_client)
GO
CREATE INDEX IX_CallsClientType ON Calls(client_type)
GO
CREATE INDEX IX_TariffsIDtariff ON Tariffs(id_tariff)
GO
CREATE INDEX IX_TariffsTariffPrefix ON Tariffs(prefix)
GO
CREATE INDEX IX_TariffsFreeSeconds ON Tariffs(free_seconds)
GO
CREATE INDEX IX_CallsFailedCallStart ON CallsFailed(call_start)
GO
CREATE INDEX IX_CallsFailedClientType ON CallsFailed(client_type)
GO
CREATE INDEX IX_CallsFailedRouteType ON CallsFailed(route_type)
GO
CREATE TABLE IF NOT EXISTS History (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 VERSION CHAR(100) NOT NULL,
 START DATETIME NOT NULL,
 STOP DATETIME NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS prefixtariffreseller (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 prefix CHAR(50) NOT NULL,
 id_tariff INT NOT NULL,
 id_reseller INT NOT NULL,
 reseller_level INT NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS settings (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 NAME CHAR(255) NOT NULL,
 VALUE VARCHAR(1024) NOT NULL,
 category CHAR(100) NOT NULL
)
GO
CREATE UNIQUE INDEX IX_SettingsNameCategory ON settings(NAME,category)
GO
CREATE TABLE IF NOT EXISTS sim (
 id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
 phone_number CHAR(40) NOT NULL,
 id_client INT(11) NOT NULL DEFAULT 0,
 param1 CHAR(40) NOT NULL,
 UNIQUE KEY phone_number (phone_number)
) DEFAULT CHARSET=ASCII
GO
CREATE TABLE IF NOT EXISTS ResLotTimes (
 id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
 id_reseller INT(11) NOT NULL DEFAULT -1,
 id_lot INT(11) NOT NULL DEFAULT -1,
 multiplier DECIMAL(12,4) DEFAULT 1.0
) DEFAULT CHARSET=ASCII
GO
CREATE TABLE IF NOT EXISTS ServiceLog (
 IDLog INT NOT NULL AUTO_INCREMENT,
 TYPE INT NOT NULL,
 sDescription VARCHAR(500) NULL,
 sStatus VARCHAR(100) NULL,
 Date_ DATETIME NOT NULL,
 JUID VARCHAR(25) NULL,
 PRIMARY KEY(IDLog)
)
GO
CREATE TABLE IF NOT EXISTS Properties (
 Property VARCHAR(50) NOT NULL,
 VALUE VARCHAR(8000) NOT NULL,
 PRIMARY KEY(Property)
)
GO
CREATE TABLE IF NOT EXISTS ServiceToLots (
 IDLot INT NOT NULL,
 TYPE INT NOT NULL,
 Months INT NOT NULL,
 Days INT NOT NULL,
 Hours INT NOT NULL,
 PRIMARY KEY(IDLot, TYPE)
)
GO
CREATE TABLE IF NOT EXISTS accountstate (
 IDPosition INT NOT NULL AUTO_INCREMENT,
 TYPE INT DEFAULT NULL,
 IDLots INT DEFAULT NULL,
 Amount DECIMAL(18,2) NOT NULL,
 useHTML BIT(1) NOT NULL DEFAULT b'0',
 msgBody TEXT,
 msgTitle TEXT,
 HTMLPath VARCHAR(255) DEFAULT NULL,
 notify_count INT NOT NULL DEFAULT '-1',
 id_client INT NOT NULL DEFAULT '-1',
 notify_period INT NOT NULL DEFAULT '-1',
 sender_name VARCHAR(255) NOT NULL DEFAULT '',
 reply_to VARCHAR(255) NOT NULL DEFAULT '',
 thresholds VARCHAR(255) NOT NULL DEFAULT '',
 PRIMARY KEY (IDPosition)
)
GO
CREATE TABLE IF NOT EXISTS MessagesSending (
 IDPosition INT NOT NULL AUTO_INCREMENT,
 IDClient INT NOT NULL,
 TYPE INT NOT NULL,
 Date_ DATETIME NOT NULL,
 IDMessage INT NULL,
 notify_left INT DEFAULT '-1' NOT NULL,
 PRIMARY KEY(IDPosition)
)
GO
CREATE TABLE IF NOT EXISTS InvoiceToLots (
 IDLot INT NOT NULL,
 PRIMARY KEY(IDLot)
)
GO
CREATE TABLE IF NOT EXISTS ServiceToClients (
 IDClient INT NOT NULL,
 TYPE INT NOT NULL,
 Months INT NOT NULL,
 Days INT NOT NULL,
 Hours INT NOT NULL,
 PRIMARY KEY(IDClient, TYPE)
)
GO
CREATE TABLE IF NOT EXISTS callsArchives (
 tableName VARCHAR(100) NOT NULL,
 firstCall DATETIME NULL,
 lastCall DATETIME NULL,
 callsCount INT NULL,
 PRIMARY KEY(tableName)
)
GO
CREATE TABLE IF NOT EXISTS PaymentsToClientsLots (
 IDPayment INT NOT NULL AUTO_INCREMENT,
 IDClient INT NOT NULL,
 IDLot INT NOT NULL,
 TYPE INT NOT NULL,
 Interval_ INT NOT NULL,
 Period INT NOT NULL,
 Fee DECIMAL(18,2) NOT NULL,
 START DATETIME NOT NULL,
 Description_ VARCHAR(255) NULL,
 PRIMARY KEY(IDPayment)
)
GO
CREATE TABLE IF NOT EXISTS clientsPayments (
 IDClient INT NOT NULL,
 TYPE INT NOT NULL,
 Date_ DATETIME NOT NULL,
 Amount DECIMAL(18,4) NOT NULL,
 IDPayment INT NOT NULL,
 PRIMARY KEY(IDClient,TYPE,Date_,IDPayment)
)
GO
CREATE TABLE IF NOT EXISTS accountstatereseller (
 IDPosition INT NOT NULL AUTO_INCREMENT,
 ResellerLevel INT DEFAULT NULL,
 Amount DECIMAL(18,2) NOT NULL,
 useHTML BIT(1) NOT NULL DEFAULT b'0',
 msgBody TEXT,
 msgTitle TEXT,
 HTMLPath VARCHAR(255) DEFAULT NULL,
 notify_count INT NOT NULL DEFAULT '-1',
 id_reseller INT NOT NULL DEFAULT '-1',
 notify_period INT NOT NULL DEFAULT '-1',
 sender_name VARCHAR(255) NOT NULL DEFAULT '',
 reply_to VARCHAR(255) NOT NULL DEFAULT '',
 thresholds VARCHAR(255) NOT NULL DEFAULT '',
 PRIMARY KEY (IDPosition)
)
GO
CREATE TABLE IF NOT EXISTS MessagesSendingReseller (
 IdPosition INT NOT NULL AUTO_INCREMENT,
 IdReseller INT NOT NULL ,
 ResellerLevel INT NOT NULL ,
 Date_ DATETIME NOT NULL,
 IdMessage INT NULL,
 notify_left INT DEFAULT -1 NOT NULL,
 PRIMARY KEY(IdPosition)
)
GO
CREATE TABLE IF NOT EXISTS NPA (
 npa_number CHAR(40) PRIMARY KEY NOT NULL ,
 location CHAR(50) NOT NULL DEFAULT ''
)
GO
CREATE TABLE IF NOT EXISTS Invoices (
 InvoiceID INT(11) NOT NULL AUTO_INCREMENT,
 InvoiceNr VARCHAR(50) NOT NULL,
 NAME VARCHAR(200) NULL,
 Address VARCHAR(255) NULL,
 EMail VARCHAR(500) NULL,
 TaxID VARCHAR(50) NULL,
 Item VARCHAR(200) NULL,
 Net DECIMAL(20,4) NOT NULL,
 Gross DECIMAL(20,4) NOT NULL,
 aVAT DECIMAL(20,4) NOT NULL,
 aPST DECIMAL(20,4) NOT NULL,
 VAT DECIMAL(20,4) NOT NULL,
 PST DECIMAL(20,4) NOT NULL,
 DateFrom DATETIME NULL,
 DateTo DATETIME NULL,
 Login_ VARCHAR(250) NOT NULL,
 FileName VARCHAR(500) NOT NULL,
 Nr INT(11) NOT NULL,
 Month_ INT(11) NOT NULL,
 Year_ INT(11) NOT NULL,
 Date_ DATETIME NULL,
 clientNr VARCHAR(50) NULL,
 City VARCHAR(200) NULL,
 State VARCHAR(200) NULL,
 Zip VARCHAR(50) NULL,
 Country VARCHAR(100) NULL,
 LastName VARCHAR(100) NULL,
 CabinId INT NOT NULL DEFAULT 0,
 id_client INT NOT NULL DEFAULT -1,
 client_type INT NOT NULL DEFAULT -1,
 template_id INTEGER NOT NULL DEFAULT -1,
 ext_data LONGTEXT NULL,
 account_state DECIMAL(12,4) DEFAULT 0.0000 NOT NULL,
 paid DECIMAL(12,4) DEFAULT 0.0000 NOT NULL,
 due_date DATE NULL,
 PRIMARY KEY(InvoiceID)
)
GO
CREATE TABLE IF NOT EXISTS users_permissions (
 id_permission INT(11) NOT NULL AUTO_INCREMENT,
 id_user INT(11) NOT NULL ,
 command VARCHAR(255) NOT NULL,
 enabled BOOLEAN NOT NULL,
 TYPE INT NOT NULL DEFAULT 0 ,
 PRIMARY KEY (id_permission),
 UNIQUE INDEX UserCommand(id_user, command)
)
GO
CREATE TABLE IF NOT EXISTS NotifiesToClientsLots (
 IDClient INT(11) NOT NULL AUTO_INCREMENT,
 TYPE INT(11) NOT NULL,
 DATE DATETIME NOT NULL,
 Description VARCHAR(255) NOT NULL,
 PRIMARY KEY (IDClient, TYPE)
)
GO
CREATE TABLE IF NOT EXISTS enumroots (
 id_route INT NOT NULL AUTO_INCREMENT,
 description VARCHAR(255) NOT NULL DEFAULT '',
 ip_number VARCHAR(255) NOT NULL DEFAULT '',
 TYPE INT NOT NULL DEFAULT -1,
 PRIMARY KEY (id_route)
)
GO
CREATE TABLE IF NOT EXISTS Lookups (
 id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
 description VARCHAR(255) NOT NULL,
 query_string VARCHAR(255) NOT NULL,
 string1 VARCHAR(255) NOT NULL,
 string2 VARCHAR(255) NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS chargeTypes (
 Amount DECIMAL(18, 2) NOT NULL ,
 Description VARCHAR (50) NULL,
 DescriptionLong VARCHAR(2000) NULL,
 flagCreate TINYINT(1) NOT NULL DEFAULT 1,
 flagCharge TINYINT(1) NOT NULL DEFAULT 1,
 PRIMARY KEY(Amount)
)
GO
CREATE TABLE IF NOT EXISTS WebPaymentOperations (
 ID INT NOT NULL  AUTO_INCREMENT,
 Description VARCHAR (250) NOT NULL ,
 SessionID VARCHAR (150) NULL ,
 Date_ DATETIME NOT NULL,
 PRIMARY KEY(ID)
)
GO
CREATE TABLE IF NOT EXISTS PayPalConfig (
 ClientType INT NOT NULL ,
 Item_ VARCHAR (50) NOT NULL ,
 Value_ VARCHAR (50) NULL ,
 FillTable VARCHAR (250) NULL,
 ShowColumn VARCHAR (250) NULL,
 DataColumn VARCHAR (250) NULL,
 IsBoolean INT NOT NULL,
 PRIMARY KEY(ClientType, Item_)
)
GO
CREATE TABLE IF NOT EXISTS Properties (
 Property VARCHAR(50) NOT NULL,
 VALUE VARCHAR(8000) NOT NULL,
 PRIMARY KEY(Property)
)
GO
CREATE TABLE IF NOT EXISTS ChargeToClient (
 Amount DECIMAL(18, 2) NOT NULL ,
 ClientType INT NOT NULL,
 PRIMARY KEY(Amount, ClientType)
)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'login - Number of characters','6',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'login - Use numbers','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'login - Use up cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'login - Use low cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'password - Number of characters','6',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'password - Use numbers','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'password - Use up cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'password - Use low cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'dest. plan','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'dest. tariff','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'id tariff','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'source plan','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'source tariff','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'connect immedia.','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'primary codec','G711',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'G723.1','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'G729','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'GSM','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'G711','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'client codec','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'device','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'new codecs','1,2,3,4,5,6,7,8,9',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'primary new codec','4',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'require confirmation','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'listPath','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'useList','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'visible','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'login - Number of characters','6',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'login - Use numbers','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'login - Use up cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'login - Use low cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'password - Number of characters','6',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'password - Use numbers','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'password - Use up cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'password - Use low cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'dest. plan','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'dest. tariff','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'id tariff','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'connect immedia.','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'primary codec','G711',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'G723.1','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'G729','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'GSM','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'G711','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'client codec','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'new codecs','1,2,3,4,5,6,7,8,9',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'primary new codec','4',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'listPath','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'useList','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'visible','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'require confirmation','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'login - Number of characters','6',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'login - Use numbers','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'login - Use up cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'login - Use low cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'password - Number of characters','6',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'password - Use numbers','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'password - Use up cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'password - Use low cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'dest. plan','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'dest. tariff','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'id tariff','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'source plan','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'source tariff','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'require confirmation','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'listPath','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'useList','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(4,'visible','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'login - Number of characters','6',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'login - Use numbers','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'login - Use up cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'login - Use low cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'password - Number of characters','6',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'password - Use numbers','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'password - Use up cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'password - Use low cases','0',NULL,NULL,NULL,1)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'dest. plan','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'dest. tariff','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'id tariff','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'require confirmation','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'listPath','',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'useList','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(8,'visible','0',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(128,'visible','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'primary new video codec','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'primary new fax codec','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'new video codecs','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'new fax codecs','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'client video codec','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(32,'client fax codec','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'primary new video codec','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'primary new fax codec','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'new video codecs','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'new fax codecs','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'client video codec','1',NULL,NULL,NULL,0)
GO
INSERT INTO PayPalConfig(ClientType,Item_,Value_,FillTable,ShowColumn,DataColumn,IsBoolean) VALUES(0,'client fax codec','1',NULL,NULL,NULL,0)
GO
CREATE TABLE IF NOT EXISTS otherGoods (
 ID INT(11) NOT NULL AUTO_INCREMENT,
 Amount DECIMAL(18, 2) NOT NULL,
 Description VARCHAR (50) NOT NULL,
 DescriptionLong VARCHAR (2000) NULL,
 PRIMARY KEY(ID)
)
GO
CREATE TABLE IF NOT EXISTS PayPalRequestGoods (
 PayPalToken VARCHAR (200) NOT NULL ,
 STATUS INT NOT NULL ,
 Date_ DATETIME NULL ,
 Amount DECIMAL(18, 2) NULL ,
 PaymentStatus VARCHAR (150) NULL,
 SessionID VARCHAR (150) NULL,
 Buyer VARCHAR (250) NULL,
 BuyerEmail VARCHAR (50) NULL,
 GoodsID INT NOT NULL,
 Goods VARCHAR (50),
 BuyerAddress VARCHAR(1000) NULL,
 MerchantID INT NULL,
 BuyerCity VARCHAR(200) NULL,
 BuyerState VARCHAR(200) NULL,
 BuyerZip VARCHAR(50) NULL,
 BuyerCountry VARCHAR(100) NULL,
 BuyerLastName VARCHAR(100) NULL,
 Zone VARCHAR(50) NULL,
 Number VARCHAR(50) NULL,
 PRIMARY KEY(PayPalToken, MerchantID)
)
GO
CREATE TABLE IF NOT EXISTS ZoneFiles(
 ClientType INT NOT NULL,
 Zone VARCHAR(50) NOT NULL,
 File_ VARCHAR(500) NOT NULL,
 Description VARCHAR(255) NULL,
 PRIMARY KEY(ClientType,Zone)
)
GO
CREATE TABLE IF NOT EXISTS currencies(
 id INTEGER NOT NULL AUTO_INCREMENT,
 ratio DECIMAL(12,4) NOT NULL DEFAULT 1,
 id_currency INTEGER NOT NULL,
 DATE DATETIME NOT NULL,
 PRIMARY KEY (id),
 INDEX id_currency USING BTREE(id_currency, DATE)
)
GO
CREATE TABLE IF NOT EXISTS currency_names (
 id INTEGER NOT NULL AUTO_INCREMENT,
 NAME VARCHAR(50) NOT NULL,
 symbol VARCHAR(5) DEFAULT '' NOT NULL,
 PRIMARY KEY (id)
)
GO
INSERT INTO currency_names(id,NAME,symbol) VALUES (1,'USD','$')
GO
INSERT INTO currencies(ratio,id_currency,DATE) VALUES (1,1,NOW())
GO
CREATE TABLE IF NOT EXISTS sms_dialingplan (
 id_dialplan INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 telephone_number CHAR (40)  NOT NULL,
 priority SMALLINT NOT NULL,
 route_type INT NOT NULL,
 tech_prefix TEXT NOT NULL,
 dial_as CHAR (40)  NOT NULL DEFAULT '',
 id_route INT NOT NULL,
 call_type INT UNSIGNED NOT NULL,
 TYPE INT NOT NULL,
 from_day SMALLINT NOT NULL DEFAULT 0,
 to_day SMALLINT NOT NULL DEFAULT 6,
 from_hour SMALLINT NOT NULL DEFAULT 0,
 to_hour SMALLINT NOT NULL DEFAULT 2400,
 balance_share INT NOT NULL DEFAULT 100
)
GO
CREATE TABLE IF NOT EXISTS sms_providers (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 NAME CHAR(255) NOT NULL,
 connection_string VARCHAR(1024) NOT NULL DEFAULT '',
 TYPE INT NOT NULL DEFAULT 0,
 id_tariff INT NOT NULL DEFAULT -1,
 binary_connection_string VARCHAR(1024) DEFAULT '' NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS sms_providers_responses (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_route INT NOT NULL,
 CODE INT NOT NULL,
 provider_string VARCHAR (512) NULL,
 user_string VARCHAR (512) NULL
)
GO
INSERT INTO sms_providers_responses (id,id_route,CODE,provider_string,user_string) VALUES (1,-1,400,'authorization_failed','Authorization failed.')
GO
INSERT INTO sms_providers_responses (id,id_route,CODE,provider_string,user_string) VALUES (2,-1,401,'not_enough_funds','Not enough funds.')
GO
INSERT INTO sms_providers_responses (id,id_route,CODE,provider_string,user_string) VALUES (3,-1,500,'no_tariff','SMS destination is not allowed')
GO
INSERT INTO sms_providers_responses (id,id_route,CODE,provider_string,user_string) VALUES (4,-1,501,'no_dialplan_entry','SMS destination is not allowed')
GO
INSERT INTO sms_providers_responses (id,id_route,CODE,provider_string,user_string) VALUES (5,-1,600,'sms_provider_is_offline','SMS provider is offline.')
GO
INSERT INTO sms_providers_responses (id,id_route,CODE,provider_string,user_string) VALUES (6,-1,601,'sms_provider_cannot_process_the_message','SMS provider cannot process the message')
GO
CREATE TABLE IF NOT EXISTS Tariffs_sms (
 id_tariffs_key INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_tariff INT NOT NULL,
 prefix CHAR(20) NOT NULL,
 description CHAR(100) NOT NULL,
 voice_rate NUMERIC(8, 4) NOT NULL,
 from_day SMALLINT NOT NULL,
 to_day SMALLINT NOT NULL,
 from_hour SMALLINT NULL,
 to_hour SMALLINT NOT NULL,
 grace_period INT NOT NULL DEFAULT 0,
 minimal_time SMALLINT NOT NULL DEFAULT -1,
 resolution SMALLINT NOT NULL DEFAULT -1,
 rate_multiplier DOUBLE NOT NULL DEFAULT -1.0,
 rate_addition DOUBLE NOT NULL DEFAULT -1.0,
 country_code CHAR(2) NULL,
 INDEX IX_tariff_sms__country_code (country_code)
)
GO
CREATE TABLE IF NOT EXISTS InvoiceClientsOperations (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_client INT NOT NULL,
 client_type INT NOT NULL,
 id_operation INT NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS Operations (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 TYPE INT NOT NULL,
 DATE DATETIME NOT NULL,
 description VARCHAR (255)  NOT NULL,
 idUser INT NOT NULL,
 xmlValue LONGTEXT NULL,
 client_type INT NOT NULL DEFAULT 0
)
GO
CREATE TABLE IF NOT EXISTS OperationsTypes (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 description CHAR (50)  NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS personalization (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 module VARCHAR(45) NOT NULL,
 NAME VARCHAR(45) DEFAULT NULL,
 DATA LONGTEXT NOT NULL,
 PRIMARY KEY (id)
)
GO
INSERT INTO OperationsTypes(id,description) VALUES (1,'Registration')
GO
INSERT INTO OperationsTypes(id,description) VALUES (2,'Registered')
GO
INSERT INTO OperationsTypes(id,description) VALUES (3,'Recharging')
GO
INSERT INTO OperationsTypes(id,description) VALUES (4,'Recharged')
GO
INSERT INTO OperationsTypes(id,description) VALUES (5,'DIDs')
GO
CREATE TABLE IF NOT EXISTS tariffschanges (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_tariffs_key INT NOT NULL,
 id_tariff INT NOT NULL,
 tariffs_type VARCHAR(20) NOT NULL DEFAULT '',
 DATA DATETIME NOT NULL,
 used INT NOT NULL,
 ACTION VARCHAR(20) NOT NULL,
 old_value VARCHAR(1024) DEFAULT NULL,
 new_value VARCHAR(1024) DEFAULT NULL
)
GO
CREATE TABLE IF NOT EXISTS Codecs (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_codec INT(11) NOT NULL,
 description VARCHAR(20) NOT NULL DEFAULT '',
 payload_type INT(11) NOT NULL,
 sip_rtpmap VARCHAR(100) NOT NULL,
 sip_codec_string VARCHAR(100) NOT NULL,
 sip_codec_parameter VARCHAR(100) NOT NULL,
 voipbox_payload_size INT(11) NOT NULL,
 voipbox_file_suffix VARCHAR(20) NOT NULL,
 voipbox_wait INT(11) NOT NULL DEFAULT '0',
 voipbox_time_step INT(11) NOT NULL DEFAULT '0',
 wave_file_format INT(11) NOT NULL DEFAULT '0',
 ms_per_byte DOUBLE NOT NULL,
 PRIMARY KEY (id),
 UNIQUE KEY UQ_CodecsIdCodec (id_codec)
)
GO
INSERT INTO codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte) 
VALUES (1,1,'G711U',0,'a=rtpmap:0 PCMU/8000','PCMU','',160,'_g711u',20,160,7,0.125)
GO
INSERT INTO codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte) 
VALUES (2,2,'G711A',8,'a=rtpmap:8 PCMA/8000','PCMA','',160,'_g711a',20,160,6,0.125)
GO
INSERT INTO codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte) 
VALUES (3,3,'G7231',4,'a=rtpmap:4 G723/8000/1','G723','-',96,'_g7231',120,960,273,1.25)
GO
INSERT INTO codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte)
VALUES (4,4,'G729',18,'a=rtpmap:18 G729/8000/1','G729','-',20,'_g729',20,160,132,1)
GO
INSERT INTO codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte) 
VALUES (5,5,'GSM',3,'a=rtpmap:3 GSM/8000','GSM','',33,'_gsm',20,160,49,0.616)
GO
INSERT INTO codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte) 
VALUES (6,6,'iLBC_20',96,'a=rtpmap:96 iLBC/8000\r\na=fmtp:96 mode=30','iLBC','mode=30',0,'',0,0,0,0)
GO
INSERT INTO codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte) 
VALUES (7,7,'G726-32',96,'a=rtpmap:96 G726-32/8000','G726-32','',0,'',0,0,0,0.25)
GO
INSERT INTO codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte) 
VALUES (8,8,'G722/8000',9,'a=rtpmap:9 G722/8000','G722','',160,'_64_g722',20,160,101,0.125)
GO
INSERT INTO codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte) 
VALUES (9,9,'allow G729 AnnexB',18,'a=rtpmap:18 G729/8000/1','G729','!',160,'_g729',20,160,132,1)
GO
CREATE TABLE  IF NOT EXISTS Portal_Logger_Settings (
 ref CHAR(20) PRIMARY KEY NOT NULL,
 val CHAR(20)
)
GO
CREATE TABLE IF NOT EXISTS Portal_Logger_Logs (
 id INT(10) PRIMARY KEY AUTO_INCREMENT, 
 login CHAR(30), 
 log_date DATETIME, 
 log_IP CHAR(16), 
 STATUS INT(2)
)
GO
CREATE TABLE IF NOT EXISTS Portal_Logger_Blocked (
 id INT PRIMARY KEY AUTO_INCREMENT, 
 block_date DATETIME, 
 block_IP VARCHAR(16)
)
GO
INSERT INTO Portal_Logger_Settings (ref,val) VALUES ('LogNumber','3')
GO
INSERT INTO Portal_Logger_Settings (ref,val) VALUES ('FailureTime','10')
GO
INSERT INTO Portal_Logger_Settings (ref,val) VALUES ('BlockTime','1')
GO
CREATE TABLE IF NOT EXISTS personalization (
 id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 id_client INT UNSIGNED NOT NULL,
 client_type INT UNSIGNED NOT NULL,
 module VARCHAR(45) NOT NULL,
 NAME VARCHAR(45) DEFAULT NULL,
 DATA LONGTEXT NOT NULL,
 PRIMARY KEY  (id)
)
GO
CREATE OR REPLACE VIEW callshopcalls_list AS 
SELECT csc.id_call
, csc.id_client AS cabin_id_client
, csc.client_type AS cabin_client_type
, (CASE csc.client_type WHEN 0 THEN cip.login WHEN 1 THEN ch.login WHEN 2 THEN ce.login  WHEN 32 THEN cs.login END) AS cabin_client_login
, ct2.client_type_name AS cabin_client_type_name
, c.id_client AS id_client
, csc.caller_id
, csc.called_number
, csc.call_start
, csc.call_end
, csc.cost*csc.ratio AS price
, csc.duration
, csc.tariff_prefix
, csc.client_type
, csc.tariffdesc
FROM callscallshop csc
LEFT JOIN calls c ON csc.id_cc = c.id_cc
LEFT JOIN clientshearlink ch ON(( csc.id_client = ch.id_client))
LEFT JOIN clientse164 ce ON(( csc.id_client = ce.id_client))
LEFT JOIN ClientsShared cs ON(( csc.id_client = cs.id_client))
LEFT JOIN clientsip cip ON(( csc.id_client = cip.id_client))
LEFT JOIN clienttypes ct2 ON((csc.client_type = ct2.id_client_type))
WHERE csc.invoice_id = -1 AND c.client_type = 16
GO
CREATE OR REPLACE VIEW callshopcurrentcalls_list AS
SELECT cc.id_call AS id_call
, cc.id_active_call AS id_active_call
, cc.id_client AS id_client
, cc.id_cabin AS id_cabin
, (CASE cc.cabin_type WHEN 0 THEN cip.login WHEN 1 THEN ch.login WHEN 2 THEN ce.login  WHEN 32 THEN cs.login END) AS cabin_client_login
, cc.id_cabin AS cabin_id_client
, cc.cabin_type AS cabin_client_type
, ct2.client_type_name AS cabin_client_type_name
, cc.dialed_number AS dialed_number
, cc.call_start AS call_start
, cc.ani AS ani
, cc.tariffdesc AS tariffdesc
FROM currentcalls cc
LEFT JOIN clientshearlink ch ON((cc.id_cabin = ch.id_client))
LEFT JOIN clientse164 ce ON((cc.id_cabin = ce.id_client))
LEFT JOIN ClientsShared cs ON((cc.id_cabin = cs.id_client))
LEFT JOIN clientsip cip ON((cc.id_cabin = cip.id_client))
LEFT JOIN clienttypes ct2 ON((cc.cabin_type = ct2.id_client_type))
WHERE (cc.client_type = 16)
GO
CREATE TABLE  templates (
 id INT(11) NOT NULL AUTO_INCREMENT,
 output_folder VARCHAR(255) NOT NULL,
 terms_of_payments VARCHAR(255) DEFAULT NULL,
 invoice_item VARCHAR(255) DEFAULT NULL,
 vat_rate FLOAT DEFAULT NULL,
 pst_rate FLOAT DEFAULT NULL,
 currency_symbol VARCHAR(5) DEFAULT NULL,
 decimal_places SMALLINT(5) DEFAULT NULL,
 invoice_number VARCHAR(100) DEFAULT NULL,
 place_of_making_out VARCHAR(100) DEFAULT NULL,
 print_normal_template BIT(1) NOT NULL DEFAULT b'1',
 logo_file VARCHAR(100) DEFAULT NULL,
 invoice_footer VARCHAR(1024) DEFAULT NULL,
 seller_name VARCHAR(255) NOT NULL,
 seller_address VARCHAR(255) NOT NULL,
 tax_id VARCHAR(45) NOT NULL,
 grouping_type SMALLINT(5) DEFAULT NULL,
 send_invoice BIT(1) NOT NULL DEFAULT b'0',
 create_detailed_billing BIT(1) NOT NULL DEFAULT b'0',
 print_call_end BIT(1) NOT NULL DEFAULT b'0',
 create_summary_billing BIT(1) NOT NULL DEFAULT b'0',
 reset_number_monthly BIT(1) NOT NULL DEFAULT b'0',
 reset_number_yearly BIT(1) NOT NULL DEFAULT b'0',
 reset_once BIT(1) NOT NULL DEFAULT b'0',
 number_to_reset INT(11) DEFAULT NULL,
 description VARCHAR(50) NOT NULL,
 callshop_template BIT(1) NOT NULL,
 client_type INT(11) NOT NULL DEFAULT '64',
 id_client INT(11) DEFAULT '-1' NOT NULL,
 ext_data LONGTEXT NULL,
 id_template_file INT(11) NOT NULL DEFAULT '-1',
 smtp_settings TEXT NULL,
 mail_content LONGTEXT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS greetings (
 id_greeting INT(10) NOT NULL AUTO_INCREMENT,
 client_type INT(10) NOT NULL,
 id_client INT(10) NOT NULL,
 file_name VARCHAR(255) NOT NULL,
 PRIMARY KEY  (id_greeting)
)
GO
CREATE TABLE IF NOT EXISTS portal_toprates (
 id_tariff_prefix CHAR(20) DEFAULT NULL,
 id_tariff INT(4) DEFAULT NULL
)
GO
CREATE TABLE IF NOT EXISTS portal_toprates_settings (
 ref CHAR(20) DEFAULT NULL,
 val CHAR(20) DEFAULT NULL
)
GO
CREATE TABLE IF NOT EXISTS routes (
 id INT(11) NOT NULL AUTO_INCREMENT,
 routesuser_id INT(11) DEFAULT NULL,
 id_route INT(11) DEFAULT NULL,
 route_type INT(11) DEFAULT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS portal_countries (
 id INT(11) NOT NULL AUTO_INCREMENT,
 country_type INT(11) DEFAULT 0 NULL,
 country_code VARCHAR(3) DEFAULT NULL,
 country_name VARCHAR(40) DEFAULT NULL,
 country_phonecode VARCHAR(4) DEFAULT NULL,
 setup_fee DECIMAL(12,4) DEFAULT '-1.0000',
 monthly_fee DECIMAL(12,4) DEFAULT '-1.0000',
 supplier VARCHAR(40) DEFAULT NULL,
 channel_fee DECIMAL(12,4) DEFAULT NULL,
 PRIMARY KEY(id)
)
GO
CREATE TABLE IF NOT EXISTS portal_localareacodes (
 id INT(11) NOT NULL AUTO_INCREMENT,
 country_id INT(11) DEFAULT NULL,
 NAME VARCHAR(30) DEFAULT NULL,
 area_code VARCHAR(30) NOT NULL DEFAULT '',
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS portal_localdids (
 id INT(11) NOT NULL AUTO_INCREMENT,
 areacode_id INT(11) DEFAULT NULL,
 availability INT(4) DEFAULT NULL,
 assigned INT(2) DEFAULT NULL,
 did VARCHAR(20) DEFAULT NULL,
 PRIMARY KEY (id),
 UNIQUE KEY UQ_PortalLocalDidsDid (did),
 KEY IX_PortalLocalDidsAreaCode (areacode_id)
)
GO
CREATE TABLE IF NOT EXISTS portal_clientdids (
 id INT(11) NOT NULL AUTO_INCREMENT,
 country_id INT(11) DEFAULT NULL,
 area_code VARCHAR(40) DEFAULT NULL,
 area_name VARCHAR(200) DEFAULT NULL,
 phone_number VARCHAR(40) DEFAULT NULL,
 client_id INT(11) DEFAULT NULL,
 client_type INT(11) DEFAULT NULL,
 IDPayment INT(11) NOT NULL DEFAULT '0',
 properties VARCHAR(512) DEFAULT '',
 PRIMARY KEY (id),
 KEY IX_PortalClientDidsPhoneNumber (phone_number)
)
GO
CREATE TABLE IF NOT EXISTS portal_countries_poroperty (
 id INT(11) NOT NULL AUTO_INCREMENT,
 NAME VARCHAR(45) NOT NULL DEFAULT '',
 VALUE VARCHAR(45) NOT NULL DEFAULT '',
 id_country INT(11) NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS address_book (
 id INT(11) NOT NULL AUTO_INCREMENT,
 client_type INT(11) NOT NULL,
 id_client INT(11) NOT NULL,
 firstname VARCHAR(50) DEFAULT NULL,
 lastname VARCHAR(50) DEFAULT NULL,
 id_group INT(11) DEFAULT NULL,
 timezone VARCHAR(100) DEFAULT NULL,
 street VARCHAR(50) DEFAULT NULL,
 postal VARCHAR(50) DEFAULT NULL,
 state VARCHAR(50) DEFAULT NULL,
 country VARCHAR(50) DEFAULT NULL,
 city VARCHAR(50) DEFAULT NULL,
 email VARCHAR(50) DEFAULT NULL,
 homepage VARCHAR(50) DEFAULT NULL,
 phones LONGTEXT,
 notes LONGTEXT,
 instantmsg LONGTEXT,
 custom LONGTEXT,
 change_time INT(11) NOT NULL,
 database_change_time INT(11) NOT NULL,
 deleted INT(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS address_book_groups (
 id INT(11) NOT NULL AUTO_INCREMENT,     
 client_type INT(11) NOT NULL,           
 id_client INT(11) NOT NULL,             
 NAME VARCHAR(50) NOT NULL,              
 change_time INT(11) NOT NULL,           
 database_change_time INT(11) NOT NULL,  
 deleted INT(1) NOT NULL DEFAULT '0',   
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS fields_definitions (
 id INT(11) NOT NULL AUTO_INCREMENT,
 field_type INT(11) NOT NULL,
 field_name VARCHAR(40) NOT NULL DEFAULT '',
 regex VARCHAR(100) NOT NULL DEFAULT '',
 tokens VARCHAR(100) NOT NULL DEFAULT '',
 PRIMARY KEY  (id)
)
GO
INSERT INTO fields_definitions VALUES (1,0,'P-Asserted-Identity','(\"?[\\w\\d\\.#\\s]+\"?)?\\s*<?sip:(([\\w\\d\\.#\\s]+)(@[\\w\\d\\.\\s\\:]+)?)>?','1:paid1;2:paid2;3:paid3;')
GO
INSERT INTO fields_definitions VALUES (2,0,'Remote-Party-ID','(\"?[\\w\\d\\.#\\s]+\"?)?\\s*<?sip:(([\\w\\d\\.#\\s]+)(@[\\w\\d\\.\\s\\:]+)?)>?','1:rpi;2:rpi;3:rpi')
GO
INSERT INTO fields_definitions VALUES (3,0,'From;f','(\"?[\\w\\d\\.#\\s]+\"?)?\\s*<?sip:(([\\w\\d\\.#\\s]+)(@[\\w\\d\\.\\s\\:]+)?)>?','1:fm1;2:fm2;3:fm3;')
GO
CREATE TABLE IF NOT EXISTS countries (
 iso2 VARCHAR(255) NOT NULL DEFAULT '',
 NAME VARCHAR(255) NOT NULL,
 iso3 VARCHAR(255) NOT NULL,
 iso_code SMALLINT(6) NOT NULL,
 currency VARCHAR(255) NOT NULL,
 currency_code VARCHAR(255) NOT NULL,
 time_zone_offsets DECIMAL(3,1) DEFAULT NULL,
 PRIMARY KEY  (iso2)
)
GO
CREATE TABLE IF NOT EXISTS PayPalRequest (
 TransactionID INT(11) NOT NULL AUTO_INCREMENT,
 PayPalToken VARCHAR(200) NOT NULL,
 AuthorizationCode VARCHAR(10) NULL,
 module ENUM('OS','VSM','VSC','VSR') DEFAULT 'OS'   NOT NULL,
 id_module_user INT(11) UNSIGNED NULL,
 finalization_type ENUM('Auto','Manual','Forced') DEFAULT 'Auto' NOT NULL,
 IDClient INT(11) DEFAULT NULL,
 ClientType INT(11) DEFAULT NULL,
 OperationType INT(11) DEFAULT NULL,
 STATUS INT(11) NOT NULL,
 Date_ DATETIME DEFAULT NULL,
 Amount DECIMAL(18,2) DEFAULT NULL,
 ClientLogin VARCHAR(150) DEFAULT NULL,
 ClientPassword VARCHAR(150) DEFAULT NULL,
 PaymentStatus VARCHAR(150) DEFAULT NULL,
 SessionID VARCHAR(150) DEFAULT NULL,
 Buyer VARCHAR(250) DEFAULT NULL,
 BuyerEmail VARCHAR(50) DEFAULT NULL,
 BuyerAddress VARCHAR(1000) DEFAULT NULL,
 MerchantID INT(11) NOT NULL DEFAULT '0',
 BuyerCity VARCHAR(200) DEFAULT NULL,
 BuyerState VARCHAR(200) DEFAULT NULL,
 BuyerZip VARCHAR(50) DEFAULT NULL,
 BuyerCountry VARCHAR(100) DEFAULT NULL,
 BuyerLastName VARCHAR(100) DEFAULT NULL,
 Zone VARCHAR(50) DEFAULT NULL,
 Number VARCHAR(50) DEFAULT NULL,
 ShopData TEXT(65535) NULL,
 CreditCardData VARCHAR(2048) DEFAULT NULL,
 CreditCardInfo VARCHAR(150) DEFAULT NULL,
 ratio DECIMAL(12,4) DEFAULT '1' NOT NULL, 
 id_currency INT(11) DEFAULT '1' NOT NULL,
 PRIMARY KEY (TransactionID),
 UNIQUE KEY UQ_PayPalToken_MerchantID (PayPalToken,MerchantID),
 KEY IX_PayPalCurrency (id_currency)
)
GO
CREATE TABLE Plans (
 id_plan INT(11) NOT NULL AUTO_INCREMENT,
 description VARCHAR(200) NOT NULL,
 def_value INT(11) DEFAULT '0',
 PRIMARY KEY  (id_plan)
)
GO
CREATE TABLE IF NOT EXISTS Voipbox_History (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL ,
 VERSION CHAR (100)  NOT NULL ,
 START DATETIME NOT NULL ,
 STOP DATETIME NOT NULL
)
GO
CREATE TABLE IF NOT EXISTS Calls_Costs (
 id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_cc INT NOT NULL DEFAULT 0,
 cost_type INT NOT NULL DEFAULT 1,
 id_client INT NOT NULL,
 client_type INT NOT NULL,
 id_tariff INT NOT NULL,
 cost DECIMAL(12, 4) NULL,
 duration INT NOT NULL,
 effective_duration INT NOT NULL DEFAULT 0,
 tariff_prefix CHAR (20) NOT NULL DEFAULT '',
 tariffdesc CHAR (100) NOT NULL DEFAULT '',
 ratio DECIMAL(12,4) NOT NULL DEFAULT 1
)
GO
INSERT INTO ClientTypes (id_client_type,client_type_name) VALUES (2048,'Reseller1')
GO
INSERT INTO ClientTypes (id_client_type,client_type_name) VALUES (4096,'Reseller2')
GO
INSERT INTO ClientTypes (id_client_type,client_type_name) VALUES (8192,'Reseller3')
GO
CREATE TABLE IF NOT EXISTS Tariffs_Plans (
 id_tariffs_key INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 id_tariff INT NOT NULL,
 prefix CHAR(20) NOT NULL,
 description CHAR(100) NOT NULL,
 voice_rate NUMERIC(8,4) NOT NULL,
 from_day SMALLINT NOT NULL,
 to_day SMALLINT NOT NULL,
 from_hour SMALLINT NULL,
 to_hour SMALLINT NOT NULL,
 grace_period INT NOT NULL DEFAULT 0,
 minimal_time SMALLINT NOT NULL DEFAULT -1,
 resolution SMALLINT NOT NULL DEFAULT -1,
 rate_multiplier DOUBLE NOT NULL DEFAULT -1.0,
 rate_addition DOUBLE NOT NULL DEFAULT -1.0,
 surcharge_time SMALLINT NOT NULL DEFAULT -1,
 surcharge_amount DECIMAL(12,4) NOT NULL DEFAULT -1.0,
 free_seconds VARCHAR(255) NOT NULL DEFAULT '',
 country_code CHAR(2) NULL,
 INDEX IX_tariff_plan__country_code (country_code)
)
GO
CREATE TABLE IF NOT EXISTS TariffsNames_Plans (
 id_tariff INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
 description VARCHAR(40)  NOT NULL,
 minimal_time SMALLINT NULL,
 resolution SMALLINT NULL,
 surcharge_time SMALLINT NOT NULL DEFAULT 0,
 surcharge_amount DECIMAL(12,4) NOT NULL DEFAULT 0.0,
 TYPE INT NOT NULL DEFAULT 0,
 rate_multiplier DOUBLE NOT NULL DEFAULT -1.0,
 rate_addition DOUBLE NOT NULL DEFAULT -1.0,
 id_currency INT NOT NULL DEFAULT 1,
 time_to_start DATETIME DEFAULT NULL,
 base_tariff_id INT NOT NULL DEFAULT -1,
 cost_threshold_resolution DOUBLE NOT NULL DEFAULT 0,
 cost_threshold DOUBLE NOT NULL DEFAULT 0
)
GO
CREATE TABLE IF NOT EXISTS accounts(
 id_account INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 id_client INT NOT NULL ,
 client_type INT NOT NULL,
 account_state DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 account_type INT NOT NULL,
 account_data INT NOT NULL,
 KEY IX_AccountsIdClient (id_client),
 KEY IX_AccountsClientType (client_type),
 KEY IX_AccountsType (account_type)
)
GO
CREATE TABLE IF NOT EXISTS Accounts_Types (
 id INT PRIMARY KEY NOT NULL,
 NAME CHAR (50) NOT NULL
)
GO
INSERT INTO Accounts_Types  (id,NAME) VALUES (1,'Main')
GO
INSERT INTO Accounts_Types  (id,NAME) VALUES (2,'Plan')
GO
CREATE TABLE IF NOT EXISTS CostsTypes (
 id INT PRIMARY KEY NOT NULL,
 NAME CHAR(50) NOT NULL
)
GO
INSERT INTO CostsTypes (id,NAME) VALUES (1,'Main')
GO
INSERT INTO CostsTypes (id,NAME) VALUES (2,'Plan')
GO
CREATE TABLE IF NOT EXISTS sms_inbox(
 id_sms INT NOT NULL AUTO_INCREMENT,
 id_client INT NOT NULL,
 client_type INT NOT NULL,
 delivery_time DATETIME NOT NULL,
 from_number VARCHAR(100) NOT NULL DEFAULT '',
 to_number VARCHAR(100) NOT NULL DEFAULT '',
 sms_status INT NOT NULL DEFAULT 0,
 sms_text VARCHAR(512) NOT NULL DEFAULT '',
 display_name VARCHAR(100) NOT NULL DEFAULT '',
 PRIMARY KEY(id_sms)
)
GO
CREATE INDEX IX_SmsInboxIdClient ON sms_inbox(id_client)
GO
CREATE INDEX IX_SmsInboxClientType ON sms_inbox(client_type)
GO
CREATE TABLE IF NOT EXISTS sms_outbox(
 id_sms INT NOT NULL AUTO_INCREMENT,
 id_client INT NOT NULL ,
 client_type INT NOT NULL,
 sent_time DATETIME NULL ,
 delivery_time DATETIME NOT NULL ,
 from_number VARCHAR(100) NOT NULL DEFAULT '' ,
 to_number VARCHAR(100) NOT NULL DEFAULT '' ,
 sms_status INT NOT NULL DEFAULT 0 ,	
 sms_text VARCHAR(512) NOT NULL DEFAULT '' ,
 PRIMARY KEY(id_sms)
)
GO
CREATE INDEX IX_SmsOutboxIdClient ON sms_outbox(id_client)
GO
CREATE INDEX IX_SmsOutboxClientType ON sms_outbox(client_type)
GO
CREATE TABLE IF NOT EXISTS pbx_companies (
 id_company INT(11) NOT NULL AUTO_INCREMENT,
 NAME VARCHAR(45) NOT NULL,
 id_reseller INT(11) NOT NULL,
 dial_prefix VARCHAR(45) DEFAULT NULL,
 PRIMARY KEY (id_company)
)
GO
CREATE TABLE IF NOT EXISTS pbx_dialingplan (
 id_dialingplan INT(11) NOT NULL AUTO_INCREMENT,
 id_company INT(11) DEFAULT NULL,
 telephone_number CHAR(45) DEFAULT NULL,
 priority SMALLINT(6) NOT NULL DEFAULT '0',
 route_type INT(11) NOT NULL DEFAULT '1',
 id_route INT(11) DEFAULT NULL,
 tech_prefix CHAR(255) DEFAULT NULL,
 call_type INT(11) UNSIGNED DEFAULT NULL,
 from_day SMALLINT(6) DEFAULT NULL,
 to_day SMALLINT(6) DEFAULT NULL,
 from_hour SMALLINT(6) DEFAULT NULL,
 to_hour SMALLINT(6) DEFAULT NULL,
 balance_share INT(10) DEFAULT NULL,
 properties LONGTEXT,
 PRIMARY KEY (id_dialingplan)
)
GO
CREATE TABLE IF NOT EXISTS pbx_inputactionscenarios (
 id_scenario INT(11) NOT NULL AUTO_INCREMENT,
 id_company INT(11) NOT NULL,
 NAME VARCHAR(45) NOT NULL,
 properties LONGTEXT,
 input_map LONGTEXT,
 PRIMARY KEY (id_scenario)
)
GO
CREATE TABLE IF NOT EXISTS pbx_routetypes (
 id_routetype INT(11) NOT NULL,
 NAME VARCHAR(45) NOT NULL,
 PRIMARY KEY (id_routetype)
)
GO
INSERT INTO pbx_routetypes(id_routetype,NAME) VALUES (1,'External number') ON DUPLICATE KEY UPDATE id_routetype=1
GO
INSERT INTO pbx_routetypes(id_routetype,NAME) VALUES (2,'User') ON DUPLICATE KEY UPDATE id_routetype=2
GO
INSERT INTO pbx_routetypes(id_routetype,NAME) VALUES (3,'Group') ON DUPLICATE KEY UPDATE id_routetype=3
GO
INSERT INTO pbx_routetypes(id_routetype,NAME) VALUES (4,'Scenario') ON DUPLICATE KEY UPDATE id_routetype=4
GO
INSERT INTO pbx_routetypes(id_routetype,NAME) VALUES (5,'Main voicemail') ON DUPLICATE KEY UPDATE id_routetype=5
GO
INSERT INTO pbx_routetypes(id_routetype,NAME) VALUES (6,'Main fax') ON DUPLICATE KEY UPDATE id_routetype=6
GO
CREATE TABLE IF NOT EXISTS pbx_users (
 id_user INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) DEFAULT NULL,
 id_company INT(11) DEFAULT NULL,
 properties INT(11) DEFAULT NULL,
 PRIMARY KEY (id_user)
)
GO
CREATE OR REPLACE VIEW ClientsPBX AS
SELECT
  pbx_companies.id_company   AS id_company,
  ClientsShared.login        AS login,
  ClientsShared.password     AS PASSWORD,
  ClientsShared.web_password AS web_password,
  ClientsShared.id_client    AS id_client,
  resellers1.idReseller      AS id_reseller,
  resellers1.id              AS reseller,
  pbx_companies.name         AS company_name,
  pbx_companies.dial_prefix  AS company_dial_prefix,
  resellers1.type            AS TYPE,
  resellers1.id_tariff       AS id_tariff,
  ClientsShared.id_currency  AS id_currency,
  resellers1.callsLimit      AS account_state,
  resellers1.MaxClients      AS max_clients,
  resellers1.type2           AS type2
FROM pbx_companies
JOIN resellers1 ON pbx_companies.id_reseller = resellers1.id
JOIN ClientsShared ON resellers1.id = ClientsShared.id_reseller AND resellers1.login = ClientsShared.login AND ClientsShared.id_tariff = -2
GO
CREATE TABLE IF NOT EXISTS em_tasks (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_job_type INT(11) NOT NULL,
 id_job_mode INT(11) NOT NULL,
 context VARCHAR(2048) NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS em_job_types (
 id INT(11) NOT NULL,
 NAME VARCHAR(50) NOT NULL DEFAULT '',
 ENABLE VARCHAR(1) NOT NULL,
 client_enable VARCHAR(1) NOT NULL,
 description VARCHAR(100) DEFAULT NULL,
 repeat_count BIGINT(7) NOT NULL DEFAULT '0',
 repeat_interval BIGINT(12) NOT NULL DEFAULT '0',
 log_type INT(11) DEFAULT '0' NOT NULL,
 next_time DATETIME DEFAULT '1900-01-01 00:00:00' NOT NULL,
 prev_time DATETIME DEFAULT '1900-01-01 00:00:00' NOT NULL,
 start_time DATETIME DEFAULT '1900-01-01 00:00:00' NOT NULL,
 end_time DATETIME DEFAULT '1900-01-01 00:00:00' NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS em_clients_jobs (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_job_type INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS em_client_config (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 id_job_type INT(11) NOT NULL,
 ENABLE BIT(1) NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS em_aps_types (
 id INT(11) NOT NULL,
 NAME VARCHAR(50) NOT NULL,
 description VARCHAR(200) DEFAULT NULL,
 definition TEXT NULL,
 amount DECIMAL(12,4) DEFAULT '-1' NOT NULL,
 period INT(11) DEFAULT '-1' NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS em_aps_schedule (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 payment_day INT(11) NOT NULL,
 payment_reminder INT(11) DEFAULT NULL,
 start_date DATETIME NOT NULL,
 next_date DATETIME NOT NULL,
 end_date DATETIME NOT NULL,
 aps_type INT(11) NOT NULL,
 aps_data VARCHAR(200) NOT NULL,
 payment_amount DECIMAL(12,4) NOT NULL DEFAULT '-1.0000',
 aps_status INT(11) NOT NULL DEFAULT '0',
 client_tech_prefix VARCHAR(512) DEFAULT '' NOT NULL,
 PRIMARY KEY (id),
 KEY IX_EmApsScheduleIdClient (id_client),
 KEY IX_EmApsScheduleClientType (client_type)
)
GO
CREATE TABLE IF NOT EXISTS em_aps_history (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_aps_schedule INT(11) NOT NULL,
 aps_status INT(11) NOT NULL,
 created_at DATETIME NOT NULL,
 aps_status_comment VARCHAR(2048) DEFAULT NULL,
 history_status INT(11) NOT NULL,
 PRIMARY KEY (id),
 KEY IX_EmApsHistoryIdSchedule (id_aps_schedule)
)
GO
CREATE TABLE IF NOT EXISTS em_alerts_config (
 id INT(11) NOT NULL AUTO_INCREMENT,
 NAME VARCHAR(50) NOT NULL,
 definition TEXT NOT NULL,
 description VARCHAR(200) DEFAULT NULL,
 alert_type INT(11) NOT NULL,
 ENABLE VARCHAR(1) NOT NULL DEFAULT '0',
 PRIMARY KEY (id),
 UNIQUE KEY IX_name (NAME)
)
GO
CREATE TABLE IF NOT EXISTS em_vmn_clients (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 caller_id VARCHAR(40) DEFAULT '',
 delivery_method INT(11) NOT NULL,
 delivery_to VARCHAR(200) NOT NULL DEFAULT '',
 time_start VARCHAR(5) NOT NULL DEFAULT '',
 time_stop VARCHAR(5) NOT NULL DEFAULT '',
 days VARCHAR(20) NOT NULL DEFAULT '0',
 notify_type INT(11) NOT NULL DEFAULT '1',
 PRIMARY KEY (id),
 KEY IX_EM_VMN_ClientsConfig (id_client,client_type)
)
GO
CREATE TABLE IF NOT EXISTS em_vmn_clients_book (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 book_type INT(11) NOT NULL,
 book_item VARCHAR(200) DEFAULT NULL,
 PRIMARY KEY (id)
)
GO
INSERT INTO em_job_types(id,NAME,ENABLE,client_enable,description,repeat_count,repeat_interval) VALUES (1,'VoiceMailNotifyJob','0','1','Voice Mail Notification',0,0) ON DUPLICATE KEY UPDATE id=1
GO
INSERT INTO em_job_types(id,NAME,ENABLE,client_enable,description,repeat_count,repeat_interval) VALUES (2,'ExpirationTimeJob','0','0','Expiration Time',0,0) ON DUPLICATE KEY UPDATE id=2
GO
INSERT INTO em_job_types(id,NAME,ENABLE,client_enable,description,repeat_count,repeat_interval) VALUES (3,'LowBalanceJob','0','0','Low Balance Notification',0,0) ON DUPLICATE KEY UPDATE id=3
GO
INSERT INTO em_job_types(id,NAME,ENABLE,client_enable,description,repeat_count,repeat_interval) VALUES (4,'InvoicesJob','0','0','Invoices',0,0) ON DUPLICATE KEY UPDATE id=4
GO
INSERT INTO em_job_types(id,NAME,ENABLE,client_enable,description,repeat_count,repeat_interval) VALUES (6,'AutomaticPaymentsJob','0','0','Automatic Payments',0,0) ON DUPLICATE KEY UPDATE id=6
GO
INSERT INTO em_job_types(id,NAME,ENABLE,client_enable,description,repeat_count,repeat_interval) VALUES (9,'StatisticsJob','0','0','Statistics',0,0) ON DUPLICATE KEY UPDATE id=9
GO
INSERT INTO em_job_types(id,NAME,ENABLE,client_enable,description,repeat_count,repeat_interval) VALUES (11,'AlertsJob','0','0','Alerts',0,0) ON DUPLICATE KEY UPDATE id=11
GO
INSERT INTO ClientTypes (id_client_type,client_type_name) VALUES (128,'Client PBX')
GO
CREATE TABLE IF NOT EXISTS click2call (
 id INT(11) NOT NULL AUTO_INCREMENT,
 phone_number VARCHAR(45) DEFAULT NULL,
 id_client INT(11) DEFAULT NULL,
 client_type INT(11) DEFAULT NULL,
 register_id_client INT(11) DEFAULT NULL,
 register_client_type INT(11) DEFAULT NULL,
 referrer_url VARCHAR(200) DEFAULT NULL,
 PRIMARY KEY (id),
 UNIQUE KEY uk_phone (phone_number)
)
GO
CREATE TABLE IF NOT EXISTS credit_card_data (
 id INT(11) NOT NULL AUTO_INCREMENT,
 client_type INT(11) NOT NULL,
 id_client INT(11) NOT NULL,
 card_info VARCHAR(30) DEFAULT '' NOT NULL, 
 card_number VARCHAR(64) NOT NULL,
 card_code VARCHAR(64) NOT NULL,
 card_date VARCHAR(64) NOT NULL,
 first_name VARCHAR(32) NOT NULL,
 last_name VARCHAR(32) NOT NULL,
 country VARCHAR(100) NOT NULL,
 street VARCHAR(64) NOT NULL,
 city VARCHAR(32) NOT NULL,
 state VARCHAR(32) NOT NULL,
 zip VARCHAR(16) NOT NULL,
 payment_type INT(11) NOT NULL DEFAULT '-1',
 low_amount DECIMAL(12,2) UNSIGNED NOT NULL DEFAULT '0.00',
 amount DECIMAL(12,2) UNSIGNED NOT NULL DEFAULT '0.00',
 check_date DATE DEFAULT '1900-01-01' NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS md_dimension (
 id INT NOT NULL AUTO_INCREMENT,
 NAME VARCHAR(100) NULL,
 target VARCHAR(45) NULL,
 PRIMARY KEY (id) 
) AUTO_INCREMENT = 1000
GO
INSERT INTO md_dimension (id, NAME, target) VALUES (1, 'SECURITY', 'SECURITY') ON DUPLICATE KEY UPDATE id=1
GO
INSERT INTO md_dimension (NAME, target) SELECT 'BLF','BLF' FROM md_dimension WHERE NOT EXISTS (SELECT * FROM md_dimension WHERE target='BLF') LIMIT 1
GO
CREATE TABLE IF NOT EXISTS md_group (
 id INT NOT NULL AUTO_INCREMENT,
 parent_id INT NOT NULL,
 dimension_id INT NOT NULL,
 NAME VARCHAR(100) NULL,
 PRIMARY KEY (id),
 CONSTRAINT FK_MdGroupDimension
  FOREIGN KEY (dimension_id)
  REFERENCES md_dimension (id)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
AUTO_INCREMENT = 1000
GO
CREATE INDEX IX_MdGroupDimension ON md_group (dimension_id ASC)
GO
INSERT INTO md_group (id, parent_id, dimension_id, NAME) VALUES 
( 1,    0, 1, 'OBJECT_OWNERSHIP'),
( 2,    0, 1, 'OBJECT_MANAGE'),
( 3,    2, 1, 'OBJECT_READ'),
( 4,    2, 1, 'OBJECT_WRITE'),
( 10,   0, 1, 'RESELLER_RIGHTS'),
( 11,  10, 1, 'ADD_GW_CLIENTS'),
( 12,  10, 1, 'ADD_COMMON_CLIENTS'),
( 13,  10, 1, 'ADD_CALLSHOP_CLIENTS'),
( 14,  10, 1, 'ADD_GKREGISTRAR_CLIENTS'),
( 15,  10, 1, 'ADD_CALLBACK_CLIENTS'),
( 16,  10, 1, 'ADD_IVR_CLIENTS'),
( 17,  10, 1, 'ADD_TARIFFS'),
( 18,   0, 1, 'RESELLER2_RIGHTS'),
( 19,  18, 1, 'ADD_PBX_CLIENTS'),
( 20,  18, 1, 'ADD_RESELLERS'),
( 21,   0, 1, 'RESELLER3_RIGHTS'),
( 22,  21, 1, 'ADD_RESELLERS2'),
( 26,  10, 1, 'ASSIGNE_CABIN_WITH_BASE_TARIFF'),
(100,   0, 1, 'PBX_OPERATIONS'),
(101, 100, 1, 'PBX_USERS'),
(102, 100, 1, 'SECURITY'),
(103, 100, 1, 'COMPANY'),
(104, 100, 1, 'DIDS'),
(105, 100, 1, 'RECEPTIONIST'),
(106, 100, 1, 'RECHARGE'),
(107, 100, 1, 'INVOICES'),
(108, 100, 1, 'PAYMENTS'),
(109, 100, 1, 'STATISTICS'),
(110, 100, 1, 'GREETINGS'),
(111, 100, 1, 'CLICK2CALL_MANAGER')
ON DUPLICATE KEY UPDATE 
id = VALUES(id), 
parent_id = VALUES(parent_id), 
dimension_id = VALUES(dimension_id), 
NAME = VALUES(NAME)
GO
INSERT INTO md_group (parent_id, dimension_id, NAME) SELECT -1, md_dimension.id, 'BLF' FROM md_dimension WHERE md_dimension.target = 'BLF' AND NOT EXISTS 
 (SELECT  md_group.* 
  FROM md_group 
  INNER JOIN md_dimension ON (md_group.dimension_id = md_dimension.id AND md_dimension.target = 'BLF' ) 
 ) LIMIT 1
GO
CREATE TABLE IF NOT EXISTS md_object_type (
 id INT NOT NULL AUTO_INCREMENT,
 NAME VARCHAR(100) NOT NULL,
 PRIMARY KEY (id) 
) AUTO_INCREMENT = 0
GO
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO'
GO
INSERT INTO md_object_type (id, NAME) VALUES (0, 'OBJECT_TYPE_GW_CLIENT')
GO
SET SQL_MODE=@OLD_SQL_MODE
GO
INSERT INTO md_object_type (id, NAME) VALUES 
(32,  'OBJECT_TYPE_COMMON_CLIENT'),
(101, 'OBJECT_TYPE_RESELLER1'),
(102, 'OBJECT_TYPE_RESELLER2'),
(103, 'OBJECT_TYPE_RESELLER3'),
(110, 'OBJECT_TYPE_PORTAL_ADMIN'),
(111, 'OBJECT_TYPE_ADDRESSBOOK_GROUP'),
(201, 'OBJECT_TYPE_DIMENSION'),
(301, 'OBJECT_TYPE_PBX_COMPANY'),
(302, 'OBJECT_TYPE_PBX_BRANCH'),
(303, 'OBJECT_TYPE_PBX_SCENARIO'),
(304, 'OBJECT_TYPE_PBX_HUNT_GROUP')
ON DUPLICATE KEY UPDATE 
id = VALUES(id), 
NAME = VALUES(NAME)
GO
CREATE  TABLE IF NOT EXISTS md_object (
 id INT NOT NULL AUTO_INCREMENT,
 type_id INT NOT NULL,
 NAME VARCHAR(100) NULL,
 PRIMARY KEY (id),
  CONSTRAINT FK_MdObjectType
   FOREIGN KEY (type_id)
   REFERENCES md_object_type (id)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
GO
CREATE INDEX IX_MdObjectType ON md_object (type_id ASC)
GO
CREATE TABLE IF NOT EXISTS md_object_property (
 id INT NOT NULL AUTO_INCREMENT,
 object_id INT NOT NULL,
 NAME VARCHAR(100) NULL,
 content LONGTEXT NULL,
 PRIMARY KEY (id),
  CONSTRAINT FK_MdObjectPropertyObject
    FOREIGN KEY (object_id)
    REFERENCES md_object (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
GO
CREATE INDEX IX_MdObjectPropertyObject ON md_object_property (object_id ASC)
GO
CREATE TABLE IF NOT EXISTS md_object_relation (
 id INT NOT NULL AUTO_INCREMENT,
 group_id INT NULL,
 object_id INT NOT NULL,
 object_type_id INT NOT NULL,
 relation_type SMALLINT NOT NULL DEFAULT 1,
 PRIMARY KEY (id),
  CONSTRAINT FK_MdObjectRelationObjectType
    FOREIGN KEY (object_type_id)
    REFERENCES md_object_type (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_MdObjectRelationGroup
    FOREIGN KEY (group_id)
    REFERENCES md_group (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
GO
CREATE INDEX IX_MdObjectRelationObjectType ON md_object_relation (object_type_id ASC)
GO
CREATE INDEX IX_MdObjectRelationGroup ON md_object_relation (group_id ASC)
GO
CREATE TABLE IF NOT EXISTS md_group_property (
 id INT NOT NULL AUTO_INCREMENT,
 group_id INT NOT NULL,
 NAME VARCHAR(100) NULL,
 content LONGTEXT NULL,
 PRIMARY KEY (id),
  CONSTRAINT FK_MdGroupPropertyGroup
    FOREIGN KEY (group_id)
    REFERENCES md_group (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
GO
CREATE INDEX IX_MdGroupPropertyGroup ON md_group_property (group_id ASC)
GO
CREATE TABLE IF NOT EXISTS md_object_right (
 id INT NOT NULL AUTO_INCREMENT,
 right_group_id INT NOT NULL,
 object_id INT NOT NULL,
 object_type_id INT NOT NULL,
 user_id INT NULL  NOT NULL,
 user_type INT NULL NOT NULL,
 permission TINYINT(1) NOT NULL,
 PRIMARY KEY (id),
 CONSTRAINT FK_MdObjectRightObjectType
  FOREIGN KEY (object_type_id)
  REFERENCES md_object_type (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_MdObjectRightGroup
    FOREIGN KEY (right_group_id)
    REFERENCES md_group (id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
GO
CREATE INDEX IX_MdObjectRightObjectType ON md_object_right (object_type_id ASC)
GO
CREATE INDEX IX_MdObjectRightGroup ON md_object_right (right_group_id ASC)
GO
CREATE TABLE IF NOT EXISTS plans_packs (
 id_plan_pack INT(11) NOT NULL AUTO_INCREMENT,
 TYPE INT(11) DEFAULT '7' NOT NULL,
 client_type INT(11) NOT NULL DEFAULT '-1',
 id_reseller INT(11) NOT NULL DEFAULT '-1',
 NAME VARCHAR(50) NOT NULL,
 description VARCHAR(1024) NOT NULL,
 period INT(11) NOT NULL DEFAULT '-1',
 period_number INT(11) NOT NULL DEFAULT '1',
 definition VARCHAR(2048) NOT NULL,
 id_tariffs INT(11) NOT NULL DEFAULT '-1',
 tariffs_plans VARCHAR(6000) NOT NULL,
 amount DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 startup_cost DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 period_cost DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 start_time DATETIME DEFAULT '1900-01-01 00:00:00' NOT NULL, 
 end_time DATETIME DEFAULT '2049-12-31 00:00:00' NOT NULL,
 id_tariff_vod INT(11) DEFAULT '-1' NOT NULL,
 PRIMARY KEY (id_plan_pack)
)
GO
CREATE TABLE IF NOT EXISTS video_codecs (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_codec INT(11) NOT NULL,
 description VARCHAR(20) NOT NULL DEFAULT '',
 payload_type INT(11) NOT NULL,
 sip_rtpmap VARCHAR(100) NOT NULL,
 sip_codec_string VARCHAR(100) NOT NULL,
 sip_codec_parameter VARCHAR(100) NOT NULL,
 voipbox_payload_size INT(11) NOT NULL,
 voipbox_file_suffix VARCHAR(20) NOT NULL,
 voipbox_wait INT(11) NOT NULL DEFAULT '0',
 voipbox_time_step INT(11) NOT NULL DEFAULT '0',
 wave_file_format INT(11) NOT NULL DEFAULT '0',
 ms_per_byte DOUBLE NOT NULL,
 PRIMARY KEY (id),
 UNIQUE KEY UQ_VideoCodecsIdCodec (id_codec)
)
GO
INSERT INTO video_codecs (id, id_codec, description, payload_type, sip_rtpmap, sip_codec_string, sip_codec_parameter, voipbox_payload_size, voipbox_file_suffix, voipbox_wait, voipbox_time_step, wave_file_format, ms_per_byte) 
VALUES('1','1','H263 (1996)','34','a=rtpmap:34 H263/90000','H263','=','20','h263','0','0','0','0') 
ON DUPLICATE KEY UPDATE id_codec=VALUES(id_codec),description=VALUES(description),payload_type=VALUES(payload_type),sip_rtpmap=VALUES(sip_rtpmap),sip_codec_string=VALUES(sip_codec_string),sip_codec_parameter=VALUES(sip_codec_parameter), voipbox_payload_size=VALUES(voipbox_payload_size), voipbox_file_suffix=VALUES(voipbox_file_suffix), voipbox_wait=VALUES(voipbox_wait), voipbox_time_step=VALUES(voipbox_time_step), wave_file_format=VALUES(wave_file_format), ms_per_byte=VALUES(ms_per_byte)
GO
INSERT INTO video_codecs (id, id_codec, description, payload_type, sip_rtpmap, sip_codec_string, sip_codec_parameter, voipbox_payload_size, voipbox_file_suffix, voipbox_wait, voipbox_time_step, wave_file_format, ms_per_byte) 
VALUES('2','2','H263+ (1998)','96','a=rtpmap:96 H263-1998/90000','H263-1998','=','20','h263','0','0','0','0') 
ON DUPLICATE KEY UPDATE id_codec=VALUES(id_codec),description=VALUES(description),payload_type=VALUES(payload_type),sip_rtpmap=VALUES(sip_rtpmap),sip_codec_string=VALUES(sip_codec_string),sip_codec_parameter=VALUES(sip_codec_parameter), voipbox_payload_size=VALUES(voipbox_payload_size), voipbox_file_suffix=VALUES(voipbox_file_suffix), voipbox_wait=VALUES(voipbox_wait), voipbox_time_step=VALUES(voipbox_time_step), wave_file_format=VALUES(wave_file_format), ms_per_byte=VALUES(ms_per_byte)
GO
INSERT INTO video_codecs (id, id_codec, description, payload_type, sip_rtpmap, sip_codec_string, sip_codec_parameter, voipbox_payload_size, voipbox_file_suffix, voipbox_wait, voipbox_time_step, wave_file_format, ms_per_byte) 
VALUES('3','3','H264','96','a=rtpmap:96 H264/90000','H264','=','20','h264','0','0','0','0') 
ON DUPLICATE KEY UPDATE id_codec=VALUES(id_codec),description=VALUES(description),payload_type=VALUES(payload_type),sip_rtpmap=VALUES(sip_rtpmap),sip_codec_string=VALUES(sip_codec_string),sip_codec_parameter=VALUES(sip_codec_parameter), voipbox_payload_size=VALUES(voipbox_payload_size), voipbox_file_suffix=VALUES(voipbox_file_suffix), voipbox_wait=VALUES(voipbox_wait), voipbox_time_step=VALUES(voipbox_time_step), wave_file_format=VALUES(wave_file_format), ms_per_byte=VALUES(ms_per_byte)
GO
INSERT INTO video_codecs (id, id_codec, description, payload_type, sip_rtpmap, sip_codec_string, sip_codec_parameter, voipbox_payload_size, voipbox_file_suffix, voipbox_wait, voipbox_time_step, wave_file_format, ms_per_byte) 
VALUES('4','4','MPEG4','96','a=rtpmap:96 MPEG4/90000\r\na=fmtp:96 CIF=1 QCIF=1 MaxBR=3840','MPEG4','=','20','mpeg4','0','0','0','0') 
ON DUPLICATE KEY UPDATE id_codec=VALUES(id_codec),description=VALUES(description),payload_type=VALUES(payload_type),sip_rtpmap=VALUES(sip_rtpmap),sip_codec_string=VALUES(sip_codec_string),sip_codec_parameter=VALUES(sip_codec_parameter), voipbox_payload_size=VALUES(voipbox_payload_size), voipbox_file_suffix=VALUES(voipbox_file_suffix), voipbox_wait=VALUES(voipbox_wait), voipbox_time_step=VALUES(voipbox_time_step), wave_file_format=VALUES(wave_file_format), ms_per_byte=VALUES(ms_per_byte)
GO
CREATE TABLE IF NOT EXISTS fax_codecs (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_codec INT NOT NULL, 
 description VARCHAR(20) NOT NULL DEFAULT '',
 payload_type INT NOT NULL,
 sip_rtpmap VARCHAR(255) NOT NULL,
 sip_codec_string VARCHAR(100) NOT NULL,
 sip_codec_parameter VARCHAR(100) NOT NULL,
 voipbox_payload_size INT NOT NULL,
 voipbox_file_suffix VARCHAR(20) NOT NULL,
 voipbox_wait INT(11) NOT NULL DEFAULT '0',
 voipbox_time_step INT(11) NOT NULL DEFAULT '0',
 wave_file_format INT(11) NOT NULL DEFAULT '0',
 ms_per_byte DOUBLE NOT NULL,
 PRIMARY KEY (id),
 UNIQUE KEY UQ_FaxCodecsIdCodec (id_codec)
)
GO
INSERT INTO fax_codecs (id,id_codec,description,payload_type,sip_rtpmap,sip_codec_string,sip_codec_parameter,voipbox_payload_size,voipbox_file_suffix,voipbox_wait,voipbox_time_step,wave_file_format,ms_per_byte) 
VALUES (1,1,'T38',0,'','T38','=',160,'_fax',20,160,7,0)
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Pound key', '35', 'voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Redial string', '*#', 'voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('End call string', '##', 'voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Maximum number length','0','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Non activity retries','3','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Non activity timeout','10','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Pairs','1-English;2-Spanish','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Round to minutes','0','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Silence duration','0','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Time addition','0','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Time multiplier','1','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Use client PIN to recharge','0','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Wrong PIN retries','3','voipbox')
GO
INSERT INTO Settings (NAME, VALUE, category) VALUES ('Box Listeners','','voipbox')
GO
INSERT INTO em_aps_types (id, NAME, description, definition) VALUES('1','Plan payment',NULL,NULL)
GO
INSERT INTO em_aps_types (id, NAME, description, definition) VALUES('2','DID payment',NULL,NULL)
GO
CREATE OR REPLACE VIEW dialingplan_lcr AS 
SELECT dialingplan.id_dialplan, dialingplan.telephone_number, dialingplan.priority, dialingplan.route_type, dialingplan.id_route, dialingplan.type, COUNT(*) AS prefix_count
FROM dialingplan 
WHERE EXISTS(
 SELECT DISTINCT a.id_dialplan, a.telephone_number, a.priority, a.route_type, a.id_route, a.type
 FROM dialingplan a JOIN dialingplan b ON a.telephone_number = b.telephone_number AND a.priority <> b.priority
 WHERE dialingplan.id_dialplan = a.id_dialplan)
GROUP BY telephone_number, priority HAVING (COUNT(*) = 1)
GO
CREATE OR REPLACE VIEW Resellers AS
SELECT 
 id
 ,(SELECT id_client_type FROM clienttypes WHERE id_client_type = 64)  AS client_type
 ,idReseller
 ,login
 ,PASSWORD
 ,TYPE
 ,id_tariff
 ,callsLimit
 ,clientsLimit
 ,tech_prefix
 ,identifier
 ,Fullname
 ,Address
 ,City
 ,ZipCode
 ,Country
 ,Phone
 ,Email
 ,MaxClients
 ,template_id
 ,TaxID
 ,type2
 ,LANGUAGE
FROM Resellers1
WHERE NOT EXISTS (SELECT id_reseller FROM ClientsShared WHERE ClientsShared.id_tariff=-2 AND Resellers1.login = ClientsShared.login AND Resellers1.password = ClientsShared.password)
UNION ALL 
SELECT id
 ,(SELECT id_client_type FROM clienttypes WHERE id_client_type = 65) AS client_type
 ,idReseller
 ,login
 ,PASSWORD
 ,TYPE
 ,id_tariff
 ,callsLimit
 ,clientsLimit
 ,tech_prefix
 ,identifier
 ,Fullname
 ,Address
 ,City
 ,ZipCode
 ,Country
 ,Phone
 ,Email
 ,NULL
 ,template_id
 ,TaxID
 ,type2
 ,LANGUAGE
FROM Resellers2
UNION ALL 
SELECT id
 ,(SELECT id_client_type FROM clienttypes WHERE id_client_type = 66) AS client_type
 ,NULL
 ,login
 ,PASSWORD
 ,TYPE
 ,id_tariff
 ,callsLimit
 ,clientsLimit
 ,tech_prefix
 ,identifier
 ,Fullname
 ,Address
 ,City
 ,ZipCode
 ,Country
 ,Phone
 ,Email
 ,NULL
 ,NULL
 ,TaxID
 ,type2
 ,LANGUAGE
FROM Resellers3
GO
INSERT INTO portal_toprates_settings VALUES ('TopNumber',25)
GO
INSERT INTO portal_toprates_settings VALUES ('ShowNumber',5)
GO
INSERT INTO portal_toprates_settings VALUES ('ShowTime',5)
GO
INSERT INTO portal_toprates_settings VALUES ('Display','ByOne')
GO
CREATE OR REPLACE VIEW ClientsRetail AS SELECT * FROM ClientsShared WHERE id_tariff > -2
GO
CREATE OR REPLACE VIEW pbx_subaccounts AS
SELECT 
  ClientsShared.id_client
 ,ClientsShared.login
 ,ClientsShared.password
 ,ClientsShared.web_password
 ,pbx_users.id_user
 ,pbx_users.id_company
 ,pbx_users.properties
 ,IF(resellers1.login = ClientsShared.login, 1, 0) AS main_user
 ,resellers1.login AS pbx_client
 ,ClientsShared.type
 ,ClientsShared.id_tariff
 ,ClientsShared.account_state
 ,ClientsShared.tech_prefix
 ,ClientsShared.id_reseller
 ,ClientsShared.id_intrastate_tariff
 ,ClientsShared.id_currency
 ,ClientsShared.codecs
 ,ClientsShared.primary_codec
 ,ClientsShared.type2
 ,ClientsShared.type3
FROM pbx_users
INNER JOIN ClientsShared ON pbx_users.id_client = ClientsShared.id_client
INNER JOIN resellers1 ON ClientsShared.id_reseller = resellers1.id
GO
CREATE TABLE IF NOT EXISTS client_properties (
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 id_group INT(11) NOT NULL,
 properties VARCHAR(512) NOT NULL,
 dtmf_actions TEXT,
 audio_events TEXT,
 PRIMARY KEY (id_client, client_type)
)
GO
CREATE TABLE templates_countries (
 id INT(11) NOT NULL AUTO_INCREMENT,
 country_iso2 VARCHAR(2) NOT NULL,
 country_name VARCHAR(255) NOT NULL,
 country_state VARCHAR(200) DEFAULT NULL,
 client_type INT(11) NOT NULL,
 template_id INT(11) NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE OR REPLACE VIEW RetailRoute AS SELECT * FROM ClientsShared
GO
CREATE OR REPLACE VIEW GKRegistrarRoute AS SELECT * FROM clientse164
GO
INSERT INTO Gateways ( description, ip_number, h323_id, TYPE, call_limit, id_tariff, tech_prefix, codecs )
VALUES ( 'voip-proxy.com', 'sip.voip-proxy.com:5060', '@', '64', '0', '-1', 'DN:00-> OR 011->;TP:' ,15 )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit ) 
VALUES ( '1', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '2', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '3', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '4', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '5', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '6', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '7', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '8', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '9', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '00', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
INSERT INTO DialingPlan ( telephone_number, priority, route_type, tech_prefix, dial_as, id_route, call_type, TYPE, from_day, from_hour, to_day, to_hour, balance_share, FIELDS, call_limit )
VALUES ( '011', '0', '0', '', '', (SELECT id_route FROM Gateways WHERE ip_number='sip.voip-proxy.com:5060') , '1207959572', '0', 0, 0, 6, 2400, 100, '', '0' )
GO
CREATE OR REPLACE VIEW em_aps_time_table AS
SELECT em_aps_schedule.id
 ,em_aps_schedule.id_client AS id_client
 ,em_aps_schedule.client_type AS client_type
 ,ClientTypes.client_type_name AS client_type_name
 ,CASE em_aps_schedule.aps_type 
   WHEN 1 THEN IFNULL(plans_packs.period_cost , -1)
   WHEN 2 THEN IFNULL(em_aps_schedule.payment_amount, -1) 
   ELSE em_aps_types.amount 
  END AS payment_amount
 ,em_aps_schedule.payment_day AS payment_day
 ,em_aps_schedule.next_date AS date_of_payment
 ,IFNULL((SELECT MAX(created_at) FROM em_aps_history WHERE em_aps_history.id_aps_schedule = em_aps_schedule.id),em_aps_schedule.next_date) AS date_of_last_update
 ,em_aps_schedule.aps_type AS payment_type
 ,em_aps_types.name AS payment_type_name
 ,CASE 
   WHEN em_aps_schedule.aps_type = 1 THEN IFNULL(plans_packs.name, 'N/A')
   WHEN em_aps_schedule.aps_type = 2 THEN IFNULL(em_aps_schedule.aps_data, 'N/A')
   WHEN em_aps_schedule.aps_type > 100 THEN IFNULL(em_aps_types.description, 'N/A')
   ELSE 'N/A'
  END AS payment_name
 ,em_aps_schedule.aps_status AS payment_status
 ,CASE em_aps_schedule.client_type 
   WHEN 0 THEN IFNULL(clientsip.login, 'N/A')
   WHEN 1 THEN IFNULL(clientshearlink.login, 'N/A')
   WHEN 2 THEN IFNULL(clientse164.login, 'N/A')
   WHEN 4 THEN IFNULL(clientscallback.login, 'N/A')
   WHEN 8 THEN IFNULL(clientspin.login, 'N/A')
   WHEN 16 THEN IFNULL(clientscallshop.login, 'N/A')
   WHEN 32 THEN IFNULL(clientsretail.login, 'N/A')
   WHEN 128 THEN IFNULL(clientspbx.login, 'N/A')
   ELSE 'N/A'
  END AS client_login
 ,CAST((CASE em_aps_schedule.client_type
   WHEN 0 THEN IFNULL(clientsip.account_state, -1)
   WHEN 1 THEN IFNULL(clientshearlink.account_state, -1)
   WHEN 2 THEN IFNULL(clientse164.account_state, -1)
   WHEN 4 THEN IFNULL(clientscallback.account_state, -1)
   WHEN 8 THEN IFNULL(clientspin.account_state, -1)
   WHEN 16 THEN IFNULL(clientscallshop.account_state, -1)
   WHEN 32 THEN IFNULL(clientsretail.account_state, -1)
   WHEN 128 THEN IFNULL(clientspbx.account_state, -1)
   ELSE 0
  END) AS DECIMAL(12,4)) AS client_account_state
 FROM em_aps_schedule
 INNER JOIN clienttypes ON em_aps_schedule.client_type = clienttypes.id_client_type
 INNER JOIN em_aps_types ON em_aps_schedule.aps_type = em_aps_types.id
 LEFT OUTER JOIN plans_packs ON em_aps_schedule.aps_data = plans_packs.id_plan_pack
 LEFT OUTER JOIN clientsip ON em_aps_schedule.id_client = clientsip.id_client AND em_aps_schedule.client_type = 0
 LEFT OUTER JOIN clientshearlink ON em_aps_schedule.id_client = clientshearlink.id_client AND em_aps_schedule.client_type = 1
 LEFT OUTER JOIN clientse164 ON em_aps_schedule.id_client = clientse164.id_client AND em_aps_schedule.client_type = 2
 LEFT OUTER JOIN clientscallback ON em_aps_schedule.id_client = clientscallback.id_client AND em_aps_schedule.client_type = 4
 LEFT OUTER JOIN clientspin ON em_aps_schedule.id_client = clientspin.id_client AND em_aps_schedule.client_type = 8
 LEFT OUTER JOIN clientscallshop ON em_aps_schedule.id_client = clientscallshop.id_client AND em_aps_schedule.client_type = 16
 LEFT OUTER JOIN clientsretail ON em_aps_schedule.id_client = clientsretail.id_client AND em_aps_schedule.client_type = 32
 LEFT OUTER JOIN clientspbx ON em_aps_schedule.id_client = clientspbx.id_company AND em_aps_schedule.client_type = 128
GO
CREATE TABLE IF NOT EXISTS zones (
 id_zone INT(11) NOT NULL AUTO_INCREMENT,
 client_type INT(10) NOT NULL,
 NAME VARCHAR(100) NOT NULL,
 description VARCHAR(250) DEFAULT NULL,
 PRIMARY KEY (id_zone)
)
GO
CREATE TABLE IF NOT EXISTS zone_numbers (
 id_number INT(11) NOT NULL AUTO_INCREMENT,
 login VARCHAR(20) NOT NULL,
 PASSWORD VARCHAR(20) DEFAULT NULL,
 reservation_date DATETIME DEFAULT NULL,
 STATUS INT(10) DEFAULT NULL,
 id_zone INT(11) NOT NULL,
 PRIMARY KEY (id_number),
 KEY IX_id_zone (id_zone),
 CONSTRAINT FK_ZoneNumbers FOREIGN KEY (id_zone) REFERENCES zones (id_zone)
)
GO
CREATE TABLE IF NOT EXISTS callback_routes (
 id INT(11) NOT NULL AUTO_INCREMENT,
 description VARCHAR(50) NOT NULL DEFAULT '',
 destination_leg_number VARCHAR(50) NOT NULL DEFAULT '',
 default_client_type INT(11) NOT NULL,
 default_id_client INT(11) NOT NULL,
 codecs INT(11) NOT NULL DEFAULT '0',
 triggering_delay INT(11) NOT NULL DEFAULT '0',
 callback_type INT(11) NOT NULL DEFAULT '0',
 source_leg_trigger_wave_file VARCHAR(255) NOT NULL DEFAULT '',
 source_leg_connect_wave_file VARCHAR(255) NOT NULL DEFAULT '',
 authorized_client_dest_leg_number VARCHAR(50) NOT NULL DEFAULT '',
 primary_codec INT(11) DEFAULT '0' NOT NULL,
 fax_primary_codec INT(11) DEFAULT '0' NOT NULL,
 video_primary_codec INT(11) DEFAULT '0' NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS voipbox_routes (
 id INT(11) NOT NULL AUTO_INCREMENT,
 description VARCHAR(20) NOT NULL DEFAULT '',
 ip_number VARCHAR(23) NOT NULL DEFAULT '',
 TYPE INT(11) NOT NULL DEFAULT '0',
 PRIMARY KEY (id)
)
GO
CREATE OR REPLACE VIEW Client_DIDs AS
SELECT  portal_clientdids.id
, portal_countries.country_name
, portal_clientdids.area_name
, portal_clientdids.phone_number
, portal_countries.supplier
, portal_countries.setup_fee
, portal_countries.monthly_fee
, portal_countries.channel_fee
, portal_clientdids.client_id
, IF(pbx_subaccounts.login IS NULL, IF(clientsretail.login IS NULL, -1, 32), 128) AS client_type
, IF(pbx_subaccounts.login IS NULL, IF(clientsretail.login IS NULL, 'N/A', 'Retail clients'), 'PBX clients') AS client_type_name
, IF(pbx_subaccounts.login IS NULL, IF(clientsretail.login IS NULL, 'N/A', clientsretail.login), pbx_subaccounts.login) AS client_login
, portal_clientdids.properties
 FROM portal_clientdids
 INNER JOIN portal_countries ON portal_clientdids.country_id = portal_countries.id
 INNER JOIN portal_localdids ON portal_clientdids.phone_number = portal_localdids.did
 INNER JOIN clienttypes ON portal_clientdids.client_type = clienttypes.id_client_type
 LEFT OUTER JOIN pbx_subaccounts ON pbx_subaccounts.id_client = portal_clientdids.client_id
 LEFT OUTER JOIN clientsretail ON clientsretail.id_client = portal_clientdids.client_id 
 WHERE portal_clientdids.client_type = 32
 GO
CREATE TABLE IF NOT EXISTS paypal_block (
 block_type INT(11) NOT NULL,
 argument VARCHAR(200) NOT NULL,
 PRIMARY KEY (block_type,argument)
)
GO
CREATE TABLE IF NOT EXISTS registered_users (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL DEFAULT '32',
 login CHAR(20) NOT NULL,
 ip_address CHAR(33) NOT NULL,
 protocol INT(11) NOT NULL DEFAULT '1',
 registration_time DATETIME NOT NULL,
 id_voipswitch INT(11) NOT NULL,
 location_server_ip_address CHAR(33) NOT NULL DEFAULT '',
 internal_location_server_ip_address CHAR(33) NOT NULL DEFAULT '',
 ip_protocol INT(11) NOT NULL DEFAULT '0',
 voip_protocol INT(11) NOT NULL DEFAULT '1',
 transport_type INT(11) NOT NULL DEFAULT '1',
 PRIMARY KEY (id),
 KEY IX_RegisteredUsersIdClient (id_client)
)
GO
CREATE TABLE IF NOT EXISTS groups (
 id_group INT(11) NOT NULL AUTO_INCREMENT,
 description VARCHAR(20) NOT NULL,
 group_type INT(11) NOT NULL DEFAULT '1',
 PRIMARY KEY (id_group,group_type)
)
GO
CREATE OR REPLACE VIEW tariff_to_dnis AS 
SELECT prefixtariff.id
, prefixtariff.id AS prefix_tariff_id
, prefixtariff.prefix
, prefixtariff.id_tariff AS tariff_id
, IFNULL(tariffsnames.description, 'N/A') AS tariff_name
, -1 AS reseller_id
, -1 AS reseller_level
, '' AS reseller_login
, prefixtariff.type AS prefix_type
FROM prefixtariff
LEFT OUTER JOIN tariffsnames ON prefixtariff.id_tariff = tariffsnames.id_tariff
UNION ALL 
SELECT 2147483647-prefixtariffreseller.id AS id
, prefixtariffreseller.id AS prefix_tariff_id
, prefixtariffreseller.prefix
, prefixtariffreseller.id_tariff AS tariff_id
, IFNULL(tariffsnames.description, 'N/A') AS tariff_name
, prefixtariffreseller.id_reseller AS reseller_id
, prefixtariffreseller.reseller_level
, CASE prefixtariffreseller.reseller_level 
   WHEN 1 THEN IFNULL(resellers1.login, 'N/A')
   WHEN 2 THEN IFNULL(resellers2.login, 'N/A')
   WHEN 3 THEN IFNULL(resellers3.login, 'N/A')
   ELSE 'N/A'
 END AS reseller_login 
, -1 AS prefix_type
FROM prefixtariffreseller
LEFT OUTER JOIN tariffsnames ON prefixtariffreseller.id_tariff = tariffsnames.id_tariff
LEFT OUTER JOIN resellers1 ON resellers1.id = prefixtariffreseller.id_reseller AND prefixtariffreseller.reseller_level = 1
LEFT OUTER JOIN resellers2 ON resellers2.id = prefixtariffreseller.id_reseller AND prefixtariffreseller.reseller_level = 2
LEFT OUTER JOIN resellers3 ON resellers3.id = prefixtariffreseller.id_reseller AND prefixtariffreseller.reseller_level = 3
GO
CREATE TABLE IF NOT EXISTS TariffReseller_Plans (
 id_tariff INT(11) NOT NULL,
 id_reseller INT(11) NOT NULL DEFAULT '0',
 reseller_level INT(11) NOT NULL DEFAULT '0',
 PRIMARY KEY  (id_tariff, reseller_level, id_reseller),
 CONSTRAINT FK_TariffResellerPlans FOREIGN KEY (id_tariff) REFERENCES TariffsNames_Plans (id_tariff)
)
GO
CREATE TABLE IF NOT EXISTS intercept_clients (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(10) UNSIGNED NOT NULL,
 client_type INT(10) UNSIGNED NOT NULL DEFAULT '32',
 ip_addr VARCHAR(16) NOT NULL,
 ip_port INT(10) UNSIGNED NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS callback_tasks (
 id INT(11) NOT NULL AUTO_INCREMENT,
 task_status INT(11) NOT NULL DEFAULT '0',
 task_type INT(11) NOT NULL DEFAULT '0',
 execution_time DATETIME NOT NULL,
 delta_time INT(11) NOT NULL DEFAULT '900',
 max_number_of_tries INT(11) NOT NULL DEFAULT '1',
 tries_counter INT(11) NOT NULL DEFAULT '0',
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 source_number CHAR(32) NOT NULL,
 source_caller_id CHAR(32) NOT NULL,
 destination_number CHAR(32) NOT NULL,
 destination_caller_id CHAR(32) NOT NULL,
 callback_type INT(11) NOT NULL DEFAULT '0',
 source_leg_connect_wave_file VARCHAR(255) NOT NULL,
 scenario_properties TEXT NOT NULL,
 primary_codec INT(11) NOT NULL DEFAULT '0',
 video_primary_codec INT(11) NOT NULL DEFAULT '0',
 fax_primary_codec INT(11) NOT NULL DEFAULT '0',
 codecs INT(11) NOT NULL DEFAULT '0',
 id_voipswitch INT(11) NOT NULL DEFAULT '0',
 last_failure_time DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
 PRIMARY KEY (id),
 KEY IX_CallbackTasksID (id)
)
GO
CREATE TABLE IF NOT EXISTS fax_banners (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 header_text CHAR(255) NOT NULL,
 filename CHAR(255) NOT NULL,
 PRIMARY KEY (id),
 KEY IX_FaxBannersClientID (id_client)
)
GO
CREATE TABLE IF NOT EXISTS fax_client_config (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 email_to_fax CHAR(40) NOT NULL,
 properties TEXT NOT NULL,
 PRIMARY KEY (id),
 UNIQUE KEY UK_FaxConfigClientType (id_client,client_type)
)
GO
CREATE TABLE IF NOT EXISTS fax_history (
 id INT(11) NOT NULL,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 destination CHAR(32) NOT NULL,
 caller_id CHAR(40) NOT NULL,
 filename CHAR(255) NOT NULL,
 first_try DATETIME NOT NULL,
 delta_time INT(11) NOT NULL DEFAULT '900',
 num_of_tries INT(11) NOT NULL,
 properties TEXT,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS fax_processed (
 id INT(11) NOT NULL AUTO_INCREMENT,
 fax_task_id INT(11) NOT NULL,
 try_date DATETIME NOT NULL,
 try_id INT(11) NOT NULL,
 STATUS INT(11) NOT NULL,
 PRIMARY KEY (id),
 KEY IX_FaxProcessedFaxTaskID (fax_task_id)
)
GO
CREATE TABLE IF NOT EXISTS fax_receive (
 id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 recv_date DATETIME NOT NULL,
 caller_id CHAR(40) NOT NULL,
 filename CHAR(255) NOT NULL,
 num_of_pages INT(11) NOT NULL,
 PRIMARY KEY (id),
 KEY IX_FaxReceiveClientType (id_client,client_type)
)
GO
CREATE TABLE IF NOT EXISTS fax_send (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 destination CHAR(32) NOT NULL,
 caller_id CHAR(40) NOT NULL,
 filename CHAR(255) NOT NULL,
 send_date DATETIME NOT NULL,
 delta_time INT(11) NOT NULL DEFAULT '60',
 num_of_tries INT(11) NOT NULL,
 properties TEXT,
 first_try DATETIME DEFAULT NULL,
 task_status INT(11) NULL DEFAULT 4,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS fax_failed (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 destination CHAR(32) NOT NULL,
 caller_id CHAR(40) NOT NULL,
 filename CHAR(255) NOT NULL,
 first_try DATETIME NOT NULL,
 delta_time INT(11) NOT NULL DEFAULT '60',
 num_of_tries INT(11) NOT NULL,
 properties TEXT,
 task_status INT(11) NULL DEFAULT 1,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS presence_policy (
 id INT(10) NOT NULL AUTO_INCREMENT,
 resource VARCHAR(20) NOT NULL,
 watcher VARCHAR(20) NOT NULL,
 permission TINYINT(1) NOT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS presence_publications (
 publish_id INT(10) NOT NULL AUTO_INCREMENT,
 resource VARCHAR(30) NOT NULL,
 presence_document VARCHAR(1024) NOT NULL,
 PRIMARY KEY (publish_id)
)
GO
CREATE OR REPLACE VIEW calls_all AS
SELECT c.id_call AS id
 ,c.called_number AS called_number
 ,c.call_start AS call_start
 ,c.call_end AS call_end
 ,c.route_type AS route_type
 ,c.id_route AS id_route
 ,c.client_type AS client_type
 ,c.id_client AS id_client
 ,c.pdd AS pdd
 ,c.ip_number AS ip_number
 ,0 AS call_type
FROM calls c
UNION ALL
SELECT c.id_failed_call AS id
 ,c.called_number AS called_number
 ,c.call_start AS call_start
 ,NULL AS call_end
 ,c.route_type AS route_type
 ,c.id_route AS id_route
 ,c.client_type AS client_type
 ,c.id_client AS id_client
 ,c.pdd AS pdd
 ,c.ip_number AS ip_number
 ,1 AS call_type
FROM callsfailed c
GO
CREATE TABLE IF NOT EXISTS assigned_did (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_reseller INT(11) NOT NULL,
 reseller_level INT(11) NOT NULL,
 id_lot INT(11) NOT NULL,
 did_number CHAR(40) NOT NULL,
 STATUS INT(1) DEFAULT NULL,
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS tariffsnames_vod (
 id_tariff INT(11) NOT NULL AUTO_INCREMENT,
 description VARCHAR(40) NOT NULL,
 TYPE INT(11) NOT NULL,
 id_currency INT(11) NOT NULL,
 default_rate DECIMAL(12,4) DEFAULT NULL,
 default_rental_time INT(11) DEFAULT NULL,
 PRIMARY KEY (id_tariff),
 KEY IX_TariffsNamesVodCurrency (id_currency)
)
GO
CREATE TABLE IF NOT EXISTS tariffs_vod (
 id_tariffs_key INT(11) NOT NULL AUTO_INCREMENT,
 id_tariff INT(11) NOT NULL,
 rate DECIMAL(12,4) NOT NULL,
 rental_time INT(11) NOT NULL,
 id_content INT(11) NOT NULL,
 content_type INT(11) NOT NULL,
 PRIMARY KEY (id_tariffs_key),
 KEY IX_TariffsVoDIdTariff (id_tariff),
 CONSTRAINT FK_TariffsVoDTariffsNamesVoD FOREIGN KEY (id_tariff) REFERENCES tariffsnames_vod (id_tariff) ON DELETE NO ACTION ON UPDATE NO ACTION
)
GO
CREATE TABLE IF NOT EXISTS tariffreseller_vod (
 id_tariff INT(11) NOT NULL,
 id_reseller INT(11) NOT NULL DEFAULT '0',
 reseller_level INT(11) NOT NULL DEFAULT '0',
 PRIMARY KEY (id_tariff,reseller_level,id_reseller)
)
GO
CREATE TABLE IF NOT EXISTS ip_black_list (
 ip_black CHAR(15) NOT NULL,
 ip_voipswitch_listener CHAR(15) NOT NULL,
 PRIMARY KEY (ip_black,ip_voipswitch_listener)
)
GO
CREATE OR REPLACE VIEW portal_fax_task AS 
SELECT fax_send.id AS id,
 fax_send.id_client AS id_client,
 fax_send.client_type AS client_type,
 fax_send.filename AS filename,
 fax_send.send_date AS first_try,
 fax_send.num_of_tries AS num_of_tries,
 fax_send.properties AS properties,
 fax_send.destination AS destination,
 fax_send.caller_id AS caller_id,
 fax_send.task_status AS task_status 
FROM fax_send 
UNION ALL 
SELECT callback_tasks.id AS id,
 callback_tasks.id_client AS id_client,
 callback_tasks.client_type AS client_type,
 '' AS filename,
 callback_tasks.execution_time AS first_try,
 callback_tasks.max_number_of_tries AS num_of_tries,
 callback_tasks.scenario_properties AS properites,
 callback_tasks.source_number AS destination,
 callback_tasks.source_caller_id AS caller_id,
 callback_tasks.task_status AS task_status
FROM callback_tasks 
WHERE (callback_tasks.task_type = 1) 
UNION ALL 
SELECT fax_failed.id AS id,
 fax_failed.id_client AS id_client,
 fax_failed.client_type AS client_type,
 fax_failed.filename AS filename,
 fax_failed.first_try AS first_try,
 fax_failed.num_of_tries AS num_of_tries,
 fax_failed.properties AS properties,
 fax_failed.destination AS destination,
 fax_failed.caller_id AS caller_id,
 fax_failed.task_status AS task_status
FROM fax_failed
GO
CREATE TABLE cli_map (
 id INT(11) NOT NULL AUTO_INCREMENT,
 NAME TEXT,
 PRIMARY KEY (id)
)
GO
CREATE TABLE cli_map_records (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_cli_map INT(11) NOT NULL,
 input_pattern VARCHAR(64) NOT NULL,
 cli TEXT NOT NULL,
 display_name TEXT NOT NULL,
 input_type INT(11) NOT NULL,
 PRIMARY KEY (id),
 KEY IX_CliMapRecordsSearch (id_cli_map,input_type,input_pattern),
 KEY IX_CliMapRecordsIdCliMap (id_cli_map),
 CONSTRAINT FK_CliMapRecordsCliMap FOREIGN KEY (id_cli_map) REFERENCES cli_map (id)
)
GO
CREATE TABLE IF NOT EXISTS reseller_settings (
 id INT NOT NULL AUTO_INCREMENT,
 id_reseller INT NOT NULL,
 client_type INT NOT NULL,
 NAME VARCHAR(255) NOT NULL,
 VALUE VARCHAR(1024) NOT NULL,
 category VARCHAR(100) NOT NULL,
 PRIMARY KEY (id),
 UNIQUE KEY UQ_ResellerSettings (id_reseller,client_type,NAME,category)
)
GO
CREATE TABLE IF NOT EXISTS plans_packs_did_countries (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_plan_pack INT(11) NOT NULL,
 id_country INT(11) NOT NULL,
 id_local_area_code INT(11) DEFAULT NULL,
 PRIMARY KEY (id),
 KEY IX_PlansPacksDidCountriesIdPlanPack (id_plan_pack),
 KEY IX_PlansPacksDidCountriesIdCountry (id_country),
 KEY IX_PlansPacksDidCountriesAreaCode (id_local_area_code),
 CONSTRAINT FK_PlansPacksDidCountriesPortalLocalAreaCodes FOREIGN KEY (id_local_area_code) REFERENCES portal_localareacodes (id) ON DELETE CASCADE,
 CONSTRAINT FK_PlansPacksDidCountriesPlanPacks FOREIGN KEY (id_plan_pack) REFERENCES plans_packs (id_plan_pack) ON DELETE CASCADE,
 CONSTRAINT FK_PlansPacksDidCountriesPortalCountries FOREIGN KEY (id_country) REFERENCES portal_countries (id) ON DELETE CASCADE
)
GO
CREATE TABLE IF NOT EXISTS plans (
 id_plan INT(11) NOT NULL AUTO_INCREMENT,
 client_type INT(11) NOT NULL DEFAULT '-1',
 NAME VARCHAR(50) NOT NULL,
 description VARCHAR(1024) NOT NULL,
 period INT(11) NOT NULL DEFAULT '-1',
 period_number INT(11) NOT NULL DEFAULT '1',
 id_tariffs INT(11) NOT NULL DEFAULT '-1',
 tariffs_plans TEXT NOT NULL,
 amount DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 startup_cost DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 period_cost DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 id_reseller INT(11) DEFAULT NULL,
 TYPE INT(11) NOT NULL DEFAULT '7',
 start_time DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00',
 end_time DATETIME NOT NULL DEFAULT '2049-12-31 00:00:00',
 PRIMARY KEY (id_plan)
)
GO
CREATE TABLE IF NOT EXISTS em_recharging_history (
 id INT(11) NOT NULL AUTO_INCREMENT,
 client_type INT(11) NOT NULL,
 id_client INT(11) NOT NULL DEFAULT '-1',
 amount DECIMAL(12,4) NOT NULL,
 low_amount DECIMAL(12,4) NOT NULL,
 recharge_status ENUM('Approved','Canceled','Recharge Blocked','Payment Blocked','Error','Indefinite') NOT NULL DEFAULT 'Approved',
 recharge_description VARCHAR(255) DEFAULT NULL,
 creation_date DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00',
 update_date DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00',
 id_paypalrequest INT(11) NOT NULL DEFAULT '-1',
 account_state DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS em_recharging_tasks (
 id INT(11) NOT NULL AUTO_INCREMENT,
 client_type INT(11) NOT NULL,
 id_client INT(11) NOT NULL DEFAULT '-1',
 amount DECIMAL(12,4) NOT NULL,
 low_amount DECIMAL(12,4) NOT NULL,
 recharge_status ENUM('New','Approved','Canceled','Recharge Blocked','Payment Blocked','Error','Indefinite') NOT NULL DEFAULT 'New',
 recharge_description VARCHAR(255) DEFAULT NULL,
 creation_date DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00',
 update_date DATETIME NOT NULL DEFAULT '1900-01-01 00:00:00',
 id_paypalrequest INT(11) NOT NULL DEFAULT '-1',
 account_state DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 PRIMARY KEY (id)
)
GO
CREATE TABLE IF NOT EXISTS ref_config (
 id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 ref_name VARCHAR(20) DEFAULT NULL,
 ref_description VARCHAR(255) DEFAULT NULL,
 ref_type INT(11) UNSIGNED NOT NULL,
 key_length INT(11) UNSIGNED NOT NULL,
 expiration_referer_signup DATETIME DEFAULT NULL,
 expiration_referer_recharge DATETIME DEFAULT NULL,
 expiration_referee_signup DATETIME DEFAULT NULL,
 expiration_referee_recharge DATETIME DEFAULT NULL,
 id_reseller INT(11) DEFAULT NULL,
 PRIMARY KEY (id),
 KEY IX_ref_config__id_reseller (id_reseller),
 CONSTRAINT FK_ref_config__reseller1 FOREIGN KEY (id_reseller) REFERENCES resellers1 (id) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
CREATE TABLE IF NOT EXISTS ref_client_key (
 id_client_shared INT(11) NOT NULL,
 id_ref_config INT(11) UNSIGNED NOT NULL,
 ref_key INT(20) UNSIGNED NULL,
 PRIMARY KEY (id_client_shared),
 KEY IX_ref_client_key__id_ref_config (id_ref_config),
 UNIQUE KEY UQ_ref_client_key__key_value (ref_key),
 CONSTRAINT FK_ref_client_key__client_shared FOREIGN KEY (id_client_shared) REFERENCES clientsshared (id_client) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_ref_client_key__ref_config FOREIGN KEY (id_ref_config) REFERENCES ref_config (id) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
CREATE TABLE IF NOT EXISTS ref_config_bonus (
 id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 id_ref_config INT(11) UNSIGNED NOT NULL,
 range_from FLOAT DEFAULT NULL,
 range_to FLOAT DEFAULT NULL,
 bonus_type INT(11) UNSIGNED DEFAULT NULL,
 amount DECIMAL(12,4) DEFAULT NULL,
 id_currency INT(11) DEFAULT NULL,
 PRIMARY KEY (id),
 KEY IX_ref_config_bonus__id_currency (id_currency),
 KEY IX_ref_config_bonus__id_ref_config (id_ref_config),
 CONSTRAINT FK_ref_config_bonus__ref_config FOREIGN KEY (id_ref_config) REFERENCES ref_config (id) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_ref_config_bonus__currency_names FOREIGN KEY (id_currency) REFERENCES currency_names (id) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
CREATE TABLE IF NOT EXISTS ref_relation (
 id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 id_referred_client INT(11) NOT NULL,
 id_referring_client INT(11) DEFAULT NULL,
 create_date DATETIME NOT NULL,
 PRIMARY KEY (id),
 UNIQUE KEY UQ_ref_relation__id_referred_client__id_referring_client (id_referred_client,id_referring_client),
 KEY IX_ref_relation__id_referred_client (id_referred_client),
 KEY IX_ref_relation__id_referring_client (id_referring_client),
 CONSTRAINT FK_ref_relation__client_shared1 FOREIGN KEY (id_referred_client) REFERENCES clientsshared (id_client) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_ref_relation__client_shared2 FOREIGN KEY (id_referring_client) REFERENCES clientsshared (id_client) ON DELETE SET NULL ON UPDATE CASCADE
)
GO
CREATE TABLE IF NOT EXISTS tariff_assignment (
 id_parent INT(11) NOT NULL,
 id_children INT(11) NOT NULL,
 PRIMARY KEY (id_parent,id_children)
)
GO
CREATE TABLE did_countries (
 id INT(11) NOT NULL AUTO_INCREMENT,
 country_name VARCHAR(40) NOT NULL,
 country_code CHAR(2) NOT NULL,
 country_phonecode INT(11) NOT NULL,
 supplier VARCHAR(20) NOT NULL,
 TYPE INT(11) NOT NULL,
 reseller_type INT(11) NOT NULL,
 id_reseller INT(11) NOT NULL,
 id_country_supplier INT(11) NOT NULL,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE did_areas (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_country INT(11) NOT NULL,
 NAME VARCHAR(30) NOT NULL,
 CODE VARCHAR(30) NOT NULL,
 TYPE INT(11) NOT NULL,
 KEY IX_did_area__did_country ( id_country ),
 CONSTRAINT FK_did_area__did_country FOREIGN KEY ( id_country ) REFERENCES did_countries ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE did_clients (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_area INT(11) NOT NULL,
 did VARCHAR(40) NOT NULL,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 id_planpack INT(11) DEFAULT NULL,
 TYPE INT(11) NOT NULL,
 KEY IX_did_client__did_area ( id_area ),
 KEY IX_did_client__plan_pack ( id_planpack ),
 CONSTRAINT FK_did_client__did_area FOREIGN KEY ( id_area ) REFERENCES did_areas ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_did_client__plan_pack FOREIGN KEY ( id_planpack ) REFERENCES plans_packs ( id_plan_pack ) ON DELETE CASCADE ON UPDATE CASCADE,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE did_local_numbers (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_area INT(11) NOT NULL,
 did VARCHAR(20) NOT NULL,
 STATUS INT(11) NOT NULL,
 KEY IX_did_local_number__did_area ( id_area ),
 CONSTRAINT FK_did_local_number__did_area FOREIGN KEY ( id_area ) REFERENCES did_areas ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE did_offers (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_country INT(11) NOT NULL,
 id_area INT(11) DEFAULT NULL,
 reseller_type INT(11) NOT NULL,
 id_reseller INT(11) NOT NULL,
 KEY IX_did_offer__did_area ( id_area ),
 KEY IX_did_offer__did_country ( id_country ),
 CONSTRAINT FK_did_offer__did_area FOREIGN KEY ( id_area ) REFERENCES did_areas ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_did_offer__did_country FOREIGN KEY ( id_country ) REFERENCES did_countries ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE did_plans_packs (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_plan_pack INT(11) NOT NULL,
 id_country INT(11) NOT NULL,
 id_area INT(11) DEFAULT NULL,
 KEY IX_did_plan_pack__plan_pack ( id_plan_pack ),
 KEY IX_did_plan_pack__did_area ( id_area ),
 KEY IX_did_plan_pack__did_country ( id_country ),
 CONSTRAINT FK_did_plan_pack__plan_pack FOREIGN KEY ( id_plan_pack ) REFERENCES plans_packs ( id_plan_pack ) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_did_plan_pack__did_area FOREIGN KEY ( id_area ) REFERENCES did_areas ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_did_plan_pack__did_country FOREIGN KEY ( id_country ) REFERENCES did_countries ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE did_prices (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_offer INT(11) NOT NULL,
 id_currency INT(11) NOT NULL,
 startup_cost DECIMAL(12,4) NOT NULL,
 channel_cost DECIMAL(12,4) NOT NULL,
 period INT(11) NOT NULL,
 period_number INT(11) NOT NULL,
 period_cost DECIMAL(12,4) NOT NULL,
 KEY IX_did_price__currency_name ( id_currency ),
 KEY IX_did_price__did_offer ( id_offer ),
 CONSTRAINT FK_did_price__currency_name FOREIGN KEY ( id_currency ) REFERENCES currency_names ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
 CONSTRAINT FK_did_price__did_offer FOREIGN KEY ( id_offer ) REFERENCES did_offers ( id ) ON DELETE CASCADE ON UPDATE CASCADE,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE did_supplier_access (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_reseller INT(11) NOT NULL,
 reseller_type INT(11) NOT NULL,
 supplier VARCHAR(20) NOT NULL,
 login VARCHAR(20) NOT NULL,
 PASSWORD VARCHAR(256) NOT NULL,
 DATA TEXT NOT NULL,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE mtu_operator (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  mccmnc INT(5) UNSIGNED DEFAULT NULL,
  country_code VARCHAR(4) DEFAULT NULL,
  calling_code VARCHAR(4) DEFAULT NULL,
  brand VARCHAR(100) NOT NULL,
  operator VARCHAR(100) NOT NULL,
  transferto_country_id INT(11) DEFAULT NULL,
  transferto_operator_id INT(11) DEFAULT NULL,
  flexiload_country_id VARCHAR(10) DEFAULT NULL,
  flexiload_operator_id VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (id)
)
GO
CREATE TABLE mtu_supplier (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_reseller INT(11) DEFAULT NULL,
  supplier_name ENUM('TransferTo','IDT','Flexiload') NOT NULL DEFAULT 'TransferTo',
  settings TEXT,
  supplier_type INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Settings on each bit: 1- active, 2 - default',
  PRIMARY KEY (id),
  KEY IX_mtu_supplier__id_reseller (id_reseller),
  CONSTRAINT FK_mtu_supplier__resellers1 FOREIGN KEY (id_reseller) REFERENCES resellers1 (id) ON DELETE CASCADE
)
GO
CREATE TABLE mtu_amount (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_operator INT(11) UNSIGNED NOT NULL,
  id_supplier INT(11) UNSIGNED NOT NULL,
  client_amount DECIMAL(12,4) UNSIGNED NOT NULL,
  client_currency VARCHAR(3) NOT NULL,
  agent_amount DECIMAL(12,4) UNSIGNED NOT NULL,
  product_amount DECIMAL(12,4) UNSIGNED NOT NULL,
  amount_type INT(11) UNSIGNED NOT NULL DEFAULT '0',
  product_currency VARCHAR(3) NOT NULL,
  product_id VARCHAR(100) DEFAULT NULL,
  transferto_operator_id VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UQ_mtu_amount__unique (id_operator,id_supplier,client_amount,client_currency),
  KEY FK_mtu_amount__mtu_supplier (id_supplier),
  CONSTRAINT FK_mtu_amount__mtu_operator FOREIGN KEY (id_operator) REFERENCES mtu_operator (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_mtu_amount__mtu_supplier FOREIGN KEY (id_supplier) REFERENCES mtu_supplier (id) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
CREATE TABLE mtu_reseller_operator (
  id_reseller INT(11) NOT NULL,
  id_operator INT(11) UNSIGNED NOT NULL,
  id_supplier INT(11) UNSIGNED NOT NULL,
  PRIMARY KEY (id_reseller,id_operator),
  KEY IX_mtu_reseller_operator__id_reseller (id_reseller),
  KEY IX_mtu_reseller_operator__id_supplier (id_supplier),
  KEY IX_mtu_reseller_operator__mccmnc (id_operator),
  CONSTRAINT FK_mtu_reseller_operator__mtu_operator FOREIGN KEY (id_operator) REFERENCES mtu_operator (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_mtu_reseller_operator__mtu_supplier FOREIGN KEY (id_supplier) REFERENCES mtu_supplier (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT FK_mtu_reseller_operator__resellers1 FOREIGN KEY (id_reseller) REFERENCES resellers1 (id) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
CREATE TABLE ag_agent (
 id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 id_reseller INT(11) DEFAULT NULL,
 login VARCHAR(40) NOT NULL,
 PASSWORD VARCHAR(128) NOT NULL,
 fullname VARCHAR(200) DEFAULT NULL,
 email VARCHAR(200) DEFAULT NULL,
 address VARCHAR(200) DEFAULT NULL,
 phone VARCHAR(50) DEFAULT NULL,
 create_date DATETIME NOT NULL,
 last_login_date DATETIME DEFAULT NULL,
 last_password_change_date DATETIME DEFAULT NULL,
 failed_password_attempt_count INT(11) UNSIGNED NOT NULL DEFAULT '0',
 last_lockedout_date DATETIME DEFAULT NULL,
 city VARCHAR(50) DEFAULT NULL,
 zipcode VARCHAR(20) DEFAULT NULL,
 country VARCHAR(50) DEFAULT NULL,
 deposit DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 KEY IX_ag_agent__id_reseller ( id_reseller ),
 UNIQUE INDEX IX_ag_agent__id_reseller__login ( id_reseller, login ),
 CONSTRAINT FK_ag_agent__reseller1 FOREIGN KEY ( id_reseller ) REFERENCES resellers1 ( id ) ON DELETE CASCADE,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE `mtu_transaction` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_supplier` INT(11) UNSIGNED DEFAULT NULL,
  `id_reseller` INT(11) DEFAULT NULL,
  `id_agent` INT(11) UNSIGNED DEFAULT NULL,
  `id_client` INT(11) DEFAULT NULL,
  `id_currency` INT(11) DEFAULT NULL,
  `client_type` INT(11) DEFAULT NULL,
  `create_date` DATETIME NOT NULL,
  `sender_msisdn` VARCHAR(20) DEFAULT NULL,
  `destination_msisdn` VARCHAR(20) NOT NULL DEFAULT '',
  `client_amount` DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
  `reseller_amount` DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
  `product_amount` DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
  `product_currency` VARCHAR(3) NOT NULL DEFAULT 'USD',
  `product_country` VARCHAR(50) DEFAULT NULL,
  `product_operator` VARCHAR(50) DEFAULT NULL,
  `result_code` INT(11) NOT NULL DEFAULT '0',
  `result_message` TEXT,
  `localized_result_message` TEXT,
  `transaction_status` ENUM('success','failed') NOT NULL DEFAULT 'failed',
  PRIMARY KEY (`id`),
  KEY `IX_mtu_transaction_resellers1` (`id_reseller`),
  KEY `IX_mtu_transaction_clients_shared` (`id_client`),
  KEY `IX_mtu_transaction_ag_agent` (`id_agent`),
  KEY `IX_mtu_transaction__mtu_supplier` (`id_supplier`),
  CONSTRAINT `FK_mtu_transaction__ag_agent` FOREIGN KEY (`id_agent`) REFERENCES `ag_agent` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_mtu_transaction__clients_shared` FOREIGN KEY (`id_client`) REFERENCES `clientsshared` (`id_client`) ON DELETE SET NULL,
  CONSTRAINT `FK_mtu_transaction__mtu_supplier` FOREIGN KEY (`id_supplier`) REFERENCES `mtu_supplier` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_mtu_transaction__resellers1` FOREIGN KEY (`id_reseller`) REFERENCES `resellers1` (`id`) ON DELETE SET NULL
)
GO
CREATE TABLE ag_commission (
 id_agent INT(11) UNSIGNED NOT NULL,
 commission_name ENUM('topup_own','topup_other','topup_mobile','create') NOT NULL DEFAULT 'topup_own',
 const DECIMAL(12,4) UNSIGNED NOT NULL DEFAULT '0.0000',
 percentage DECIMAL(12,4) UNSIGNED NOT NULL DEFAULT '0.0000',
 KEY IX_ag_commission__id_agent ( id_agent ),
 CONSTRAINT FK_ag_commision__ag_agent FOREIGN KEY ( id_agent ) REFERENCES ag_agent ( id ) ON DELETE CASCADE,
 PRIMARY KEY  ( id_agent, commission_name )
)
GO
CREATE TABLE ag_commission_history (
 id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 id_agent INT(11) UNSIGNED NOT NULL,
 id_client INT(11) DEFAULT NULL,
 id_payment INT(11) DEFAULT NULL,
 id_transaction INT(11) UNSIGNED DEFAULT NULL,
 commission_name ENUM
('topup_mobile','create','create_void','create_voided','topup_own','topup_own_void','topup_own_voided','topup_other','topup_other_void','topup_other_voided') 
NOT NULL DEFAULT 'topup_own',
 const DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 percentage DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 amount DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 bonus_percentage DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 bonus DECIMAL(12,4) NOT NULL DEFAULT '0.0000',
 create_date DATETIME NOT NULL,
 KEY IX_ag_commission_history__id_agent ( id_agent ),
 KEY IX_ag_commission_history__id_client ( id_client ),
 KEY IX_ag_commission_history__id_payment ( id_payment ),
 KEY IX_ag_commission_history__id_transaction ( id_transaction ),
 CONSTRAINT FK_ag_commission_history__ag_agent FOREIGN KEY ( id_agent ) REFERENCES ag_agent ( id ) ON DELETE CASCADE,
 CONSTRAINT FK_ag_commission_history__clients_shared FOREIGN KEY ( id_client ) REFERENCES clientsshared ( id_client ) ON DELETE SET NULL,
 CONSTRAINT FK_ag_commission_history__mtu_transaction FOREIGN KEY ( id_transaction ) REFERENCES mtu_transaction ( id ) ON DELETE SET NULL,
 CONSTRAINT FK_ag_commission_history__payments FOREIGN KEY ( id_payment ) REFERENCES payments ( id ) ON DELETE SET NULL,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE ag_template (
 id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 id_client INT(11) UNSIGNED NOT NULL,
 client_type INT(11) UNSIGNED NOT NULL,
 NAME VARCHAR(128) NOT NULL,
 description TEXT DEFAULT NULL,
 template TEXT DEFAULT NULL,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE ag_template_agent (
 id_agent INT(11) UNSIGNED NOT NULL,
 id_template INT(11) UNSIGNED NOT NULL,
 KEY IX_ag_template_agent__id_agent ( id_agent ),
 KEY IX_ag_template_agent__id_template ( id_template ),
 CONSTRAINT FK_ag_template_agent__ag_agent FOREIGN KEY ( id_agent ) REFERENCES ag_agent ( id ) ON DELETE CASCADE,
 CONSTRAINT FK_ag_template_agent__ag_template FOREIGN KEY ( id_template ) REFERENCES ag_template ( id ) ON DELETE CASCADE,
 PRIMARY KEY  ( id_agent, id_template )
)
GO
CREATE TABLE ag_template_agent_client (
 id_agent INT(11) UNSIGNED NOT NULL,
 id_template INT(11) UNSIGNED NOT NULL,
 id_client INT(11) NOT NULL,
 KEY IX_ag_template_agent_client__id_agent ( id_agent ),
 KEY IX_ag_template_agent_client__id_client ( id_client ),
 KEY IX_ag_template_agent_client__id_template ( id_template ),
 CONSTRAINT FK_ag_template_agent_client__ag_agent FOREIGN KEY ( id_agent ) REFERENCES ag_agent ( id ) ON DELETE CASCADE,
 CONSTRAINT FK_ag_template_agent_client__ag_template FOREIGN KEY ( id_template ) REFERENCES ag_template ( id ) ON DELETE CASCADE,
 CONSTRAINT FK_ag_template_agent_client__clients_shared FOREIGN KEY ( id_client ) REFERENCES clientsshared ( id_client ) ON DELETE CASCADE,
 PRIMARY KEY  ( id_agent, id_template, id_client )
)
GO
CREATE TABLE did_client_destinations (
 id INT(11) NOT NULL AUTO_INCREMENT,
 id_client INT(11) NOT NULL,
 client_type INT(11) NOT NULL,
 number VARCHAR(40) DEFAULT NULL,
 id_did INT(11) NOT NULL,
 KEY IX_did_client_destinations_assigned_did ( id_did ),
 CONSTRAINT FK_did_client_destinations_assigned_did FOREIGN KEY ( id_did ) REFERENCES assigned_did ( id ) ON DELETE CASCADE ON UPDATE NO ACTION,
 PRIMARY KEY  ( id )
)
GO
CREATE TABLE audit_log (
  id BIGINT(22) UNSIGNED NOT NULL AUTO_INCREMENT,
  module ENUM('OS','VSM','VSR','VSC') NOT NULL DEFAULT 'OS',
  id_module_user INT(11) UNSIGNED NOT NULL,
  action_date DATETIME NOT NULL,
  action_type INT(11) NOT NULL,
  description TEXT NOT NULL,
  PRIMARY KEY (id)
)
GO
CREATE TABLE cs_operator (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_client_callshop INT(11) NOT NULL,
  login VARCHAR(40) NOT NULL,
  PASSWORD CHAR(40) NOT NULL,
  full_name VARCHAR(255) DEFAULT NULL,
  create_date DATETIME DEFAULT NULL,
  last_update_date DATETIME DEFAULT NULL,
  email VARCHAR(128) NOT NULL,
  operator_type INT(11) NULL DEFAULT 0,
  PRIMARY KEY (id),
  UNIQUE KEY UQ_cs_operator__login (login),
  UNIQUE KEY UQ_cs_operator__email (email),
  CONSTRAINT FK_cs_operator__client_callshop FOREIGN KEY (id_client_callshop) REFERENCES clientscallshop (id_client) ON DELETE CASCADE
)
GO
CREATE TABLE cs_tariff(
 id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
 id_client_callshop INT(11) NOT NULL,
 id_tariff INT(11) NOT NULL,
  CONSTRAINT FK_cs_tariff__tariffs_name FOREIGN KEY (id_tariff) REFERENCES tariffsnames (id_tariff) ON DELETE CASCADE,
  CONSTRAINT FK_cs_tariff__client_callshop FOREIGN KEY (id_client_callshop) REFERENCES clientscallshop (id_client) ON DELETE CASCADE,
 PRIMARY KEY (id)
)
GO
CREATE TABLE cs_session (
  id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  id_cs_operator INT(11) UNSIGNED NOT NULL DEFAULT 0,
  id_client_callshop INT(11) NOT NULL,
  session_date DATETIME DEFAULT NULL,
  cab_id_client INT(11) DEFAULT NULL,
  cab_client_type INT(11) DEFAULT NULL,  
  sum_cost DECIMAL(12,4) DEFAULT NULL,  
  received DECIMAL(12,4) DEFAULT NULL,
  sum_show_cost DECIMAL(12,4) DEFAULT NULL,
  id_invoice INT(11) NOT NULL DEFAULT -1,
   INDEX IX_cs_session__session_date (session_date ASC),
  PRIMARY KEY (id)    
) ENGINE=INNODB DEFAULT CHARSET=utf8;
GO
CREATE TABLE cs_session_call (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_cs_session INT(11) UNSIGNED NOT NULL,
  id_calls_callshop  INT(11) NOT NULL,  
  PRIMARY KEY (id),
  CONSTRAINT FK_cs_session_call__id_cs_session FOREIGN KEY (id_cs_session) REFERENCES cs_session (id) ON DELETE CASCADE
)
GO