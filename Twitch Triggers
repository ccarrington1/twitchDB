/*before trigger & update trigger */
    
DELIMITER //
CREATE TRIGGER test_trigger before update on streamer for each row begin
set streamer.totalViews = streamer.totalViews + 1;
End//
UPDATE streamer 
SET 
    streamer.totalviews = 10;
    
    
/* after trigger */

CREATE TABLE invoice_audit
(
Vendor_id		INT				NOT NULL,
invoice_number	VARCHAR(50) 	NOT NULL,
invoice_total	Decimal(9,2) 	NOT NULL,
action_type		VARCHAR(50)		NOT NULL,
action_date		DATETIME		NOT NULL
)

DELIMITER //

CREATE TRIGGER invoices_after_insert
	AFTER INSERT ON invoices
    FOR EACH ROW
BEGIN
	INSERT INTO Invoices_audit VALUES
    (NEW.vendor_id, NEW.incoice_number, NEW.invoice_total, 'INSERTED' NOW());
END//

CREATE TRIGGER invoices_after_delete
	AFTER DELETE ON invoices
    FOR EACH ROW
BEGIN
	INSERT INTO invoices_audit VALUES
    (OLD.Vender_ID, OLD.invoice_number, OLD.invoice_total, 'DELETED', NOW());
END//

DELIMITER ;

INSERT INTO invoices VALUES
(115, 34, 'ZXA-080', '2015-02-01', 14092.5, 0, 0, 3, '2015-03-01', NULL);

DELETE FROM invoices WHERE invoice_id =115;

SELECT * FROM invoices;
