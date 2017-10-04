CREATE TABLE IF NOT EXISTS `planets`(
    `planet_id` INT(11) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `avg_temp` INT(5) NOT NULL,
    `rad_level` INT(5) NOT NULL,
    `planet_type` VARCHAR(50) NOT NULL,
    `life_type` VARCHAR(50) NOT NULL,
    PRIMARY KEY(`planet_id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1 AUTO_INCREMENT = 23;