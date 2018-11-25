INSERT INTO `person` (`first_name`, `last_name`) VALUES
('Brian', 'Lyttle'),
('John', 'Holmes'),
('Sam', 'Jones'),
('Max', 'Howard'),
('Russell', 'Wilson'),
('David', 'Walker'),
('Samantha', 'Wells'),
('Frank', 'Ricker'),
('Aaron', 'Rodgers'),
('Jack', 'Ryan');

INSERT INTO `emergency_contact` (`ice_number`, `person_id`, `ec_first_name`, `ec_last_name`) VALUES
('07652456782', '1', 'Derrick', 'Brush'),
('07876354235', '2', 'Frank', 'Reeve'),
('07654867963', '3', 'Alan', 'Wells'),
('07657699763', '4', 'Gordon', 'Smith'),
('07658999864', '5', 'Adam', 'Hughes'),
('078657444872', '6', 'Simon', 'Bridges'),
('07888654957', '7', 'Daniel', 'Smith'),
('0765793654', '8', 'PJ', 'Burns'),
('07998644760','9','Christopher','Eason'),
('07654769098', '10', 'Ben','Gooley');


INSERT INTO `employee` (`person_id`, `monthly_salary`) VALUES
('1', '2000'),
('4', '5000'),
('9', '1400'),
('5', '2479');

INSERT INTO `technician` (`person_id`) VALUES
('4'),
('9');

INSERT INTO `technicianskills` (`person_id`, `skill`) VALUES
('4', 'Carpentry'),
('9', 'Plumbing');

INSERT INTO `manager` (`person_id`) VALUES
('5'),
('1');

INSERT INTO `building` (`building_number`, `street`, `city`, `county`, `postcode`) VALUES
('14', 'Fredrick Street', 'Belfast', 'Antrim', 'BT1 8YX'),
('62', 'Eglantine Avenue', 'Belfast', 'Antrim', 'BT2 6TC');

INSERT INTO `apartment` (`building_number`, `postcode`, `person_id`, `apartment_number`, `number_bedrooms`, `total_bathrooms`, `total_area`) VALUES
 ('14', 'BT1 8YX', '2', '1', '2', '2', '300'),
 ('14', 'BT1 8YX', '3', '2', '3', '2', '650'),
 ('14', 'BT1 8YX', '8', '3', '2', '1', '500'),
 ('62', 'BT2 6TC', '10', '4', '4', '3', '1200'),
 ('62', 'BT2 6TC', '7', '3', '5', '4', '1800');

INSERT INTO `manageroffice` (`person_id`, `apartment_number`) VALUES
('5', '4'),
('1', '3');

INSERT INTO `leaseagreement` (`lease_id`, `person_id`, `apartment_number`, `start_date`, `end_date`, `monthly_rent`, `expired`, `building_number`, `postcode`) VALUES
('33465', '2', '1', '2018-11-11', '2019-11-09', '450', '0', '14', 'BT1 8YX'),
('76648', '3', '2', '2016-09-18', '2018-06-18', '500', '1', '14', 'BT1 8YX'),
('25799', '8', '3', '2018-03-12', '2019-02-12', '550', '0', '14', 'BT1 8YX'),
('98622', '10', '4', '2017-08-17', '2019-01-19', '680', '0', '62', 'BT2 6TC'),
('15580', '7', '3', '2014-07-25', '2018-12-06', '1400', '0', '62', 'BT2 6TC');

INSERT INTO `tenant` (`person_id`, `bank_account_num`, `lease_id`) VALUES
('2', '2234567', '33465'),
('3', '5543689', '76648'),
('8', '9918772','25799'),
('10', '0032761','98622'),
('7', '1116809','15580');
