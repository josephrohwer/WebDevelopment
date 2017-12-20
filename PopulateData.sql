INSERT
INTO
    `users`(
        `user_id`,
        `username`,
        `password`,
        `enabled`
    )
VALUES(1, 'admin', '$2a$10$QetMcE6hPpVXh/3x1PRFsOpmuNPYelz7etroQTwR2gLUrknh85v.6', 1),(2, 'user', '$2a$10$RBd386XJqxACJ11W3vE6quSMc31Cg9WigiRi85ddtfP0QbYCiUq8S', 1);

INSERT
INTO
    `authorities`(`username`, `authority`)
VALUES('admin', 'ROLE_ADMIN'),('admin', 'ROLE_USER'),('user', 'ROLE_USER');

INSERT 
INTO 
	`planets` (
		`image_url`, 
		`name`, 
		`avg_temp`, 
		`rad_level`, 
		`planet_type`, 
		`life_type`
	)  
VALUES('https://solarsystem.nasa.gov/images/galleries/PIA15160_br.jpg', 'Mercury', 585, 345, 'Iron Planet', 'Devoid');

INSERT 
INTO 
	`planets` (
		`image_url`, 
		`name`, 
		`avg_temp`, 
		`rad_level`, 
		`planet_type`, 
		`life_type`
	) 
VALUES('https://solarsystem.nasa.gov/images/slideshow/Venus_Clouds.jpg', 'Venus', 256, 1374, 'Lava Planet', 'Devoid');

INSERT 
INTO 
	`planets` (
		`image_url`, 
		`name`, 
		`avg_temp`, 
		`rad_level`, 
		`planet_type`, 
		`life_type`
	)  
VALUES('https://solarsystem.nasa.gov/images/galleries/Apollo_17_Blue-Marble_1400.jpg', 'Earth', 73, 4, 'Terrestrial Planet', 
'Intelligent');

INSERT 
INTO 
	`planets` (
		`image_url`, 
		`name`, 
		`avg_temp`, 
		`rad_level`, 
		`planet_type`, 
		`life_type`
	)  
VALUES('https://solarsystem.nasa.gov/images/galleries/marsweather171.jpg', 'Mars', 32, 15, 'Rocky Planet', 'Microbial');

INSERT 
INTO 
	`planets` (
		`image_url`, 
		`name`, 
		`avg_temp`, 
		`rad_level`, 
		`planet_type`, 
		`life_type`
	)  
VALUES('https://solarsystem.nasa.gov/images/galleries/PJ09_008_1400.jpg', 'Jupiter', 5698, 785, 'Gas Planet', 'Devoid');

INSERT 
INTO 
	`planets` (
		`image_url`, 
		`name`, 
		`avg_temp`, 
		`rad_level`, 
		`planet_type`, 
		`life_type`
	)  
VALUES('https://solarsystem.nasa.gov/images/galleries/PIA17218_1280.jpg', 'Saturn', 1874, 469, 'Gas Planet', 'Devoid');

INSERT 
INTO 
	`planets` (
		`image_url`, 
		`name`, 
		`avg_temp`, 
		`rad_level`, 
		`planet_type`, 
		`life_type`
	)  
VALUES('https://solarsystem.nasa.gov/images/galleries/4_179_br.jpg', 'Uranus', 3672, 235, 'Gas Planet', 'Devoid');

INSERT 
INTO 
	`planets` (
		`image_url`, 
		`name`, 
		`avg_temp`, 
		`rad_level`, 
		`planet_type`, 
		`life_type`
	) 
VALUES('https://solarsystem.nasa.gov/images/galleries/PIA01492-browse.jpg', 'Neptune', 2315, 194, 'Gas Planet', 'Devoid');