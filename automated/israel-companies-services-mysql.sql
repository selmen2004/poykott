DROP DATABASE IF EXISTS `COUNTRIES`;
CREATE DATABASE IF NOT EXISTS `COUNTRIES`;
USE `COUNTRIES`;

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
	`country_id` bigint UNSIGNED PRIMARY KEY NOT NULL
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `countries`
(`country_id`)
	VALUES
(1);

DROP TABLE IF EXISTS `companiesAndServices`;
CREATE TABLE IF NOT EXISTS `companiesAndServices` (
	`companiesandservices_id` bigint UNSIGNED PRIMARY KEY NOT NULL,
	`country_id` bigint UNSIGNED NOT NULL,
	`name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	CONSTRAINT fk_country_companiesandservices FOREIGN KEY (`country_id`) REFERENCES countries(`country_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `companiesAndServices`
(`companiesandservices_id`, `country_id`, `name`, `description`, `logo`, `notes`, `category`)
	VALUES
(1, 1, 'Carrefour كارفور', 'سلسلة مراكز تجارية عالمية فرنسية. وهي من أكبر سلاسل التجارية في العالم من حيث الحجم وثاني أكبر مجموعة لمنتجات التجزئة في العالم من حيث الدخل بعد وول مارت', './logo/carrefour.jpg', 'ترتبط الشراكة التي وقّعتها مجموعة كارفور مع شركة (Electra Consumer Products) وشركتها الفرعية المتخصّصة في البيع بالتجزئة (Yenot Bitan) ارتباطاً مباشراً بتقديم الخدمات التي تدعم وجود المستعمرات غير الشرعية وتمكينها، فضلاً عن نهبها المستمرّ للموارد الطبيعية الفلسطينية لأغراض تجارية.', 'مغازات'),
(2, 1, 'Orange أورونج', 'مشغل الهاتف و الانترنت الفرنسي', './logo/orange.jpg', 'بعد بدء الحرب الأخيرة قامت اورونج  باتاحة المكالمات مجانا نحو اسر ا ئيل', 'اتصالات');

DROP TABLE IF EXISTS `alternatives`;
CREATE TABLE IF NOT EXISTS `alternatives` (
	`alternatives_id` bigint UNSIGNED PRIMARY KEY NOT NULL,
	`companiesandservices_id` bigint UNSIGNED NOT NULL,
	`name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	CONSTRAINT fk_companiesandservices_alternatives FOREIGN KEY (`companiesandservices_id`) REFERENCES companiesAndServices(`companiesandservices_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `alternatives`
(`alternatives_id`, `companiesandservices_id`, `name`, `description`, `link`, `logo`, `notes`)
	VALUES
(1, 1, 'عزيزة', 'مغازات عزيزة تونسية', 'https://aziza.tn', 'logo-aziza.png', ''),
(2, 2, 'اتصالات تونس', 'اتصالات تونس', 'https://www.tunisietelecom.tn', 'tt.svg', 'المشغل الوطني'),
(3, 2, 'اوريدو', 'اوريدو', 'https://ooredoo.tn', 'ooredoo.png', '');

DROP TABLE IF EXISTS `resources`;
CREATE TABLE IF NOT EXISTS `resources` (
	`resources_id` bigint UNSIGNED PRIMARY KEY NOT NULL,
	`companiesandservices_id` bigint UNSIGNED NOT NULL,
	`name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	`link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
	CONSTRAINT fk_companiesandservices_resources FOREIGN KEY (`companiesandservices_id`) REFERENCES companiesAndServices(`companiesandservices_id`)
)	ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
INSERT INTO `resources`
(`resources_id`, `companiesandservices_id`, `name`, `link`)
	VALUES
(1, 1, 'كارفور إسرائيل  تتبرع بآلاف الطرود والشحنات الشخصية لجنود الإحتلال الإسرائيلي ودعوات لمقاطعتها', 'https://albaladnews.net/article/374460'),
(2, 2, 'علاقة اورونج باسرائيل', 'https://rassd.com/179769.htm');

