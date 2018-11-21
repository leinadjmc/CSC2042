INSERT INTO `person` (`first_name`, `last_name`) VALUES
('Brian', 'Lyttle'),
('John', 'Holmes'),
('Sam', 'Jones'),
('Max', 'Howard'),
('Russell', 'Wilson');

INSERT INTO `emergency_contact` (`ice_number`, `person_id`, `ec_first_name`, `ec_last_name`) VALUES
('07652456782', '1', 'Derrick', 'Brush'),
('07876354235', '2', 'Frank', 'Reeve'),
('07654867963', '3', 'Alan', 'Wells'),
('07657699763', '4', 'Gordon', 'Smith'),
('07658999864', '5', 'Adam', 'Hughes');

INSERT INTO `employee` (`person_id`, `monthly_salary`) VALUES 
('26', '2000'),
('27', '5000'),
('28', '1400'),
('30', '2479'),
('29', '3150');
