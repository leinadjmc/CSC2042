INSERT INTO `person` (`first_name`, `last_name`) VALUES
('Brian', 'Lyttle'),
('John', 'Holmes'),
('Sam', 'Jones'),
('Max', 'Howard'),
('Russell', 'Wilson')
('David', 'Walker')
('Samantha', 'Wells');

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

INSERT INTO `tenant` (`person_id`, `bank_account_num`) VALUES
('26', '2234567'),
('27', '5543689'),
('28', '9918772'),
('29', '0032761'),
('30', '1116809');

INSERT INTO `skills` (`skill_id`, `skill`) VALUES
('1', 'Carpentry'),
('2', 'Plumbing'),
('3', 'Electrical');

INSERT INTO `technicianskills` (`employee_id`, `skill_id`) VALUES
('40216270', '1'),
('40216270', '2'),
('40216272', '3'),
('40216273', '3'),
('40216274', '1');

INSERT INTO `manager` (`employee_id`) VALUES
('40216272'),
('40216274');

INSERT INTO `building` (`building_number`, `street`, `city`, `county`, `postcode`) VALUES
('14', 'Fredrick Street', 'Belfast', 'Antrim', 'BT1 8YX'),
('62', 'Eglantine Avenue', 'Belfast', 'Antrim', 'BT2 6TC');
