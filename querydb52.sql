SELECT person.person_id, person.first_name, person.last_name, building.building_number, apartment.apartment_number, building.street, building.city, building.postcode
FROM person
LEFT JOIN apartment ON person.person_id = apartment.person_id
LEFT JOIN building ON apartment.building_number = building.building_number
WHERE apartment.building_number = building.building_number AND apartment.postcode = building.postcode
ORDER BY person.person_id
