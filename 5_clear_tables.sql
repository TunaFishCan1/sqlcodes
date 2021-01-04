DELETE FROM SQL.PORTAL_ACCESS;
DELETE FROM SQL.WEBSITE;
DELETE FROM SQL.IP;
DELETE FROM SQL.MODEL;
DELETE FROM SQL.MANUFACTURER;
DELETE FROM SQL.OS;
commit;

INSERT INTO SQL.TB_OS VALUES(CONCAT('ABC',TO_CHAR(77,'FM00')),'UN');
alter sequence sql.access_sequence restart start with 0;
alter sequence sql.manu_sequence restart start with 0;
alter sequence sql.model_sequence restart start with 0;
alter sequence sql.os_sequence restart start with 0;
alter sequence sql.web_sequence restart start with 0;