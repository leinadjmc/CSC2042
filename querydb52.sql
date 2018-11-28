SELECT person.person_id, person.first_name, person.last_name, building.building_number, apartment.apartment_number, building.street, building.city, building.postcode
FROM person
LEFT JOIN apartment ON person.person_id = apartment.person_id
LEFT JOIN building ON apartment.building_number = building.building_number
WHERE apartment.building_number = building.building_number AND apartment.postcode = building.postcode
ORDER BY person.person_id;

SELECT apartment.apartment_number, apartment.building_number, apartment.postcode
FROM apartment
LEFT JOIN leaseagreement ON leaseagreement.apartment_number = apartment.apartment_number AND leaseagreement.building_number = apartment.building_number AND leaseagreement.postcode = apartment.postcode
WHERE leaseagreement.lease_id IS NULL OR leaseagreement.lease_id NOT IN (
SELECT t.lease_id
FROM leaseagreement t
INNER JOIN (
    SELECT lease_id, max(end_date) AS MaxDate
    FROM leaseagreement
    WHERE expired = 0
    GROUP BY lease_id
) tm ON t.lease_id = tm.lease_id AND t.end_date = tm.MaxDate);

(SELECT leaseagreement.monthly_rent, leaseagreement.lease_id, apartment.apartment_number, apartment.building_number, apartment.postcode, apartment.number_bedrooms, apartment.total_bathrooms, apartment.total_area
FROM leaseagreement
NATURAL JOIN apartment
WHERE leaseagreement.expired = '0' AND leaseagreement.monthly_rent NOT IN (
  SELECT A.monthly_rent
  FROM leaseagreement A, leaseagreement B
  WHERE A.monthly_rent < B.monthly_rent))
UNION
(SELECT leaseagreement.monthly_rent, leaseagreement.lease_id, apartment.apartment_number, apartment.building_number, apartment.postcode, apartment.number_bedrooms, apartment.total_bathrooms, apartment.total_area
FROM leaseagreement
NATURAL JOIN apartment
WHERE leaseagreement.expired = '0' AND leaseagreement.monthly_rent NOT IN (
  SELECT B.monthly_rent
  FROM leaseagreement A, leaseagreement B
  WHERE A.monthly_rent < B.monthly_rent));

SELECT building.building_number, concat(building.street, char(13), building.city, char(13), building.county, char(13),
building.postcode)AS "Address", AVG(apartment.number_bedrooms) AS "Average number of bedrooms", AVG(apartment.total_bathrooms) 
AS "Average number of bathrooms", SUM(apartment.total_area) AS "Total Area per building"FROM apartment RIGHT JOIN building 
ON apartment.building_number = building.building_number GROUP BY building_number
