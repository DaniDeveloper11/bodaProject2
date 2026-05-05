mysqldump: [Warning] Using a password on the command line interface can be insecure.
-- MySQL dump 10.13  Distrib 8.0.45, for Linux (aarch64)
--
-- Host: localhost    Database: bodadb
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Companion`
--

DROP TABLE IF EXISTS `Companion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Companion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `guestId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Companion_guestId_fkey` (`guestId`),
  CONSTRAINT `Companion_guestId_fkey` FOREIGN KEY (`guestId`) REFERENCES `Guest` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Companion`
--

LOCK TABLES `Companion` WRITE;
/*!40000 ALTER TABLE `Companion` DISABLE KEYS */;
INSERT INTO `Companion` VALUES (8,'María Pérez',1,9),(9,'Pedro Pérez Jr.',1,9),(10,'Ana Rodríguez',1,10),(11,'Jorge Fernández',1,13),(12,'Sofía Fernández',1,13),(13,'Miguel Ruiz',0,14),(14,'Francisco Ramírez',1,16);
/*!40000 ALTER TABLE `Companion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guest`
--

DROP TABLE IF EXISTS `Guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Guest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullName` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `notes` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `side` enum('NOVIO','NOVIA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NOVIO',
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Guest_code_key` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guest`
--

LOCK TABLES `Guest` WRITE;
/*!40000 ALTER TABLE `Guest` DISABLE KEYS */;
INSERT INTO `Guest` VALUES (9,'JUAN2024','Juan Pérez García',1,'Prefiere comida vegetariana','NOVIO','2026-04-23 06:01:29.772','2026-05-03 08:08:52.930'),(10,'CARLOS2024','Carlos Rodríguez López',1,NULL,'NOVIO','2026-04-23 06:01:29.777','2026-04-23 06:05:16.766'),(11,'DIEGO2024','Diego Martínez Sánchez',1,'Llegará un poco tarde','NOVIO','2026-04-23 06:01:29.780','2026-04-23 06:01:29.780'),(12,'ROBERTO2024','Roberto Gómez Hernández',0,NULL,'NOVIO','2026-04-23 06:01:29.782','2026-04-23 06:58:31.505'),(13,'LUCIA2024','Lucía Fernández Torres',1,'Necesita silla para bebé','NOVIA','2026-04-23 06:01:29.785','2026-04-23 06:01:29.785'),(14,'CARMEN2024','Carmen Ruiz Morales',1,NULL,'NOVIA','2026-04-23 06:01:29.787','2026-04-23 06:01:29.787'),(15,'ELENA2024','Elena Jiménez Castro',0,NULL,'NOVIA','2026-04-23 06:01:29.789','2026-04-23 06:01:29.789'),(16,'ISABEL2024','Isabel Ramírez Ortiz',1,'Alergias: mariscos','NOVIA','2026-04-23 06:01:29.791','2026-04-23 06:01:29.791');
/*!40000 ALTER TABLE `Guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WeddingConfig`
--

DROP TABLE IF EXISTS `WeddingConfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WeddingConfig` (
  `id` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` json NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `WeddingConfig_slug_key` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WeddingConfig`
--

LOCK TABLES `WeddingConfig` WRITE;
/*!40000 ALTER TABLE `WeddingConfig` DISABLE KEYS */;
INSERT INTO `WeddingConfig` VALUES (1,'default','{\"bank\": {\"name\": \"BBVA\", \"holder\": \"Titular de la cuenta Bancaria\", \"concept\": \"Regalo de bodas\", \"accountNumber\": \"2760430461\"}, \"date\": {\"displayDate\": \"04/10/2026\", \"weddingDate\": \"2026-10-04T13:00:00\", \"rsvpDeadline\": \"31 de Agosto del 2025\", \"calendarMonthYear\": \"Octubre 2026\", \"calendarSelectedDate\": \"2026-10-04\"}, \"gifts\": {\"liverpoolUrl\": \"https://mesaderegalos.liverpool.com.mx/milistaderegalos/51992607\", \"liverpoolUrlAlt\": \"https://mesaderegalos.liverpool.com.mx/milistaderegalos/51605729\"}, \"texts\": {\"nav\": {\"location\": \"Ubicacion\", \"dressCode\": \"Codigo de Vestimenta\", \"requestInfo\": \"Solicitar Informacion\", \"giftRegistry\": \"Mesa de Regalos\", \"confirmAttendance\": \"Confirma Asistencia\"}, \"copy\": \"Copiar\", \"gifts\": {\"intro\": \"¡Tu presencia es el mejor regalo! Pero si deseas contribuir, aquí tienes algunas opciones:\", \"title\": \"Regalos\", \"footer\": \"Para más información, contacta a los novios.\", \"bankButton\": \"Datos Bancarios\", \"giftButton\": \"Mesa de Regalos\", \"footerThanks\": \"¡Gracias por ser parte de nuestro día especial!\"}, \"modal\": {\"title\": \"¿Estás seguro?\", \"cancel\": \"Cancelar\", \"confirm\": \"Aceptar\", \"message\": \"Esta acción no se puede deshacer.\"}, \"copied\": \"¡Número copiado!\", \"footer\": \"© 2025 Realizado por Masolutions.\", \"contact\": {\"title\": \"Contacta a los novios\"}, \"promise\": {\"text\": \"Nos conocimos en el 2015 y desde ese momento sentimos esa conexión. Sin embargo, no fue hasta finales del 2018 donde volvimos a reconectar y el resto es historia. Desde ese momento supimos que éramos el uno para el otro. Cada risa compartida, cada abrazo y cada sueño construido nos llevó hasta aquí. Ahora, con el corazón lleno de amor y emoción, damos el siguiente paso: unir nuestras vidas para siempre.\", \"title\": \"UNA PROMESA PARA TODA LA VIDA\"}, \"bankPage\": {\"intro\": \"Su presencia es lo más importante para nosotros, pero si desean hacernos un regalo, hemos creado un banco de regalos para facilitarlo. Aquí pueden encontrar los datos bancarios para hacer una transferencia.\", \"title\": \"Banco de Regalos\", \"footer\": \"Para más información, contacta a los novios.\", \"backButton\": \"Atrás\", \"giftButton\": \"Mesa de Regalos Liverpool\", \"footerThanks\": \"¡Gracias por ser parte de nuestro día especial!\"}, \"calendar\": {\"dayNames\": [\"Don\", \"Lue\", \"Med\", \"Jri\", \"Vat\", \"Sun\"], \"selectedDayLabel\": \"El Gran Día\"}, \"saveDate\": \"Save The Date\", \"timeline\": {\"title\": \"Wedding Time Line\", \"events\": [{\"icon\": \"gettingReady\", \"time\": \"12:00 PM\", \"title\": \"En preparacion\", \"description\": \"\"}, {\"icon\": \"ceremony\", \"time\": \"1:00 PM\", \"title\": \"Misa Religiosa\", \"description\": \"Ceremonia religiosa\"}, {\"icon\": \"reception\", \"time\": \"3:00 PM\", \"title\": \"Inicio de la recepción\", \"description\": \"Bienvenida y cóctel\"}, {\"icon\": \"banquet\", \"time\": \"4:00 PM\", \"title\": \"Banquete\", \"description\": \"\"}, {\"icon\": \"firstDance\", \"time\": \"6:00 PM\", \"title\": \"Primer Vals\", \"description\": \"\"}, {\"icon\": \"party\", \"time\": \"7:00 PM\", \"title\": \"Inicio de la fiesta\", \"description\": \"\"}, {\"icon\": \"end\", \"time\": \"1:00 AM\", \"title\": \"Fin de la recepción\", \"description\": \"\"}]}, \"countdown\": {\"days\": \"días\", \"hours\": \"horas\", \"minutes\": \"min\", \"seconds\": \"seg\", \"remaining\": \"Faltan:\", \"celebration\": \"🎉 ¡Es el gran día! ¡Felicidades! 💍\"}, \"dressCode\": {\"intro\": \"Queremos asegurarnos que todos se sientan cómodos y en sintonía con la celebración\", \"level\": \"Formal\", \"title\": \"Dress Code\", \"menLabel\": \"Ellos\", \"danceTitle\": \"Preparate para Bailar\", \"womenLabel\": \"Ellas\", \"menDescription\": \"Vestimenta elegante,\", \"menRestriction\": \"No Verde olivo\", \"danceSuggestion\": \"Sugerimos Tenis\", \"danceDescription\": \"La fiesta no para, así que asegúrate de traer zapatos cómodos.\", \"menCarouselTitle\": \"Algunas ideas para ellos\", \"womenDescription\": \"Vestidos florales, colores claros o tonos coloridos\", \"womenRestriction\": \"No Negro, Lila o Rojo\", \"womenCarouselTitle\": \"Algunas ideas para ellas\"}, \"confirmPage\": {\"title\": \"Confirma tu Asistencia\", \"footer\": \"Para más información, contacta a los novios.\", \"nameLabel\": \"Nombre\", \"adultsOnly\": \"Celebración exclusiva para ADULTOS.\", \"backButton\": \"Atrás\", \"modalTitle\": \"Confirmar Asistencia\", \"errorMessage\": \"Hubo un error al confirmar asistencia.\", \"footerThanks\": \"¡Gracias por ser parte de nuestro día especial!\", \"modalMessage\": \"¿Estás seguro de que deseas confirmar?\", \"submitButton\": \"Confirmar Asistencia\", \"familyMessage\": \"✨ \\\"Nos emociona compartir este momento tan especial con las personas que más queremos. Para ayudarnos a planear este día tan importante, por favor confirme su asistencia y la de su familia.\", \"adultsOnlyLink\": \"https://www.tiktok.com/@gabylajarochita.83/video/7316280366153633030?is_from_webapp=1&lw_scan=1&shortcut_feature=feed\", \"confirmedLabel\": \"confirmado\", \"successMessage\": \"¡Confirmación enviada con éxito!\", \"companionMessage\": \"✨ \\\"Nos emociona compartir este momento tan especial con las personas que más queremos. Para ayudarnos a planear este día tan importante, por favor confirme su asistencia y la de sus acompañantes.\", \"adultsOnlyEnabled\": true}, \"confirmation\": {\"error\": \"Error al buscar el invitado\", \"title\": \"Confirme su asistencia\", \"button\": \"Confirmar Asistencia\", \"loading\": \"Buscando...\", \"codeHelp\": \"Codigo proporcionado en su invitacion.\", \"notFound\": \"Invitado no encontrado\", \"codeLabel\": \"Codigo\", \"codePlaceholder\": \"ABXY2025\"}, \"parentsIntro\": \"Con nuestro amor y con la presencia de Dios entre nosotros y la bendición de nuestros padres:\"}, \"couple\": {\"logo\": \"/logo.webp\", \"name1\": \"Joselyn\", \"name2\": \"Paul\", \"initials\": \"D&D\", \"fullName1\": \"Nombre completo novia,\", \"fullName2\": \"Nombre completo novio\", \"namesFont\": \"\'Alex Brush\', cursive\", \"parentNames1\": {\"father\": \"Nombre apellido Padre\", \"mother\": \"Nombre apellido Madre\"}, \"parentNames2\": {\"father\": \"Nombre apellido Padre\", \"mother\": \"Nombre apellido Madre\"}}, \"images\": {\"hero\": \"/uploads/default/1777793749249-fotoHero.webp\", \"novia\": \"/novia.webp\", \"novio\": \"/novio.webp\", \"church\": \"/iglesia.webp\", \"petalo\": \"/petalo1.webp\", \"promise\": \"/foto2.webp\", \"carousel\": [\"/us1.webp\", \"/us2.webp\", \"/us3.webp\", \"/us4.webp\", \"/us5.webp\", \"/us6.webp\", \"/us8.webp\", \"/us9.webp\", \"/us10.webp\", \"/us11.webp\", \"/us12.webp\", \"/us13.webp\", \"/uploads/default/1777789324836-us8.webp\"], \"timeline\": {\"end\": \"/coche.webp\", \"party\": \"/pista-de-baile.webp\", \"banquet\": \"/banquete.webp\", \"ceremony\": \"/iglesia.webp\", \"reception\": \"/animar.webp\", \"firstDance\": \"/baile.webp\", \"gettingReady\": \"/traje-de-boda.webp\"}, \"churchWhite\": \"/iglesiaBlanco.webp\", \"decorativeT\": \"/t.webp\", \"papelPicado\": \"/papel-picado.webp\", \"dressCodeImg\": \"/dressCodeImg.webp\", \"dressCodeMen\": [\"/suits1.webp\", \"/suits2.webp\", \"/suits3.webp\"], \"flowerCorner\": \"/flowerCorner.webp\", \"simpleFlower\": \"/simpleFlower.webp\", \"disenoFloral1\": \"/diseno-floral.webp\", \"disenoFloral2\": \"/diseno-floral-2.webp\", \"disenoFloral3\": \"/diseno-floral-3.webp\", \"dressCodeWomen\": [\"/vestidos1.webp\", \"/vestidos2.webp\", \"/vestidos3.webp\", \"/vestidos4.webp\"], \"timelineBottom\": \"/timeLine.webp\"}, \"contact\": {\"bride\": {\"label\": \"Contacta a la Novia\", \"phone\": \"+52 3334001701\", \"phoneRaw\": \"5213334001701\", \"whatsappMessage\": \"Hola Daniel y Daniela, quería contactarlos por su boda!\"}, \"groom\": {\"label\": \"Contacta al Novio\", \"phone\": \"+52 3314857062\", \"phoneRaw\": \"5213314857062\", \"whatsappMessage\": \"Hola Daniel y Daniela, quería contactarlos por su boda!\"}}, \"location\": {\"city\": \"Etzatlan Jalisco\", \"church\": {\"icon\": \"/iglesiaBlanco.webp\", \"name\": \"Templo\", \"mapsUrl\": \"https://maps.app.goo.gl/ezNguxpSQXLrw9369\", \"fullName\": \"Templo de la Purísima Concepción\", \"position\": {\"lat\": 20.7647014950958, \"lng\": -104.0802305636446}}, \"mapZoom\": 13, \"mapCenter\": \"church\", \"reception\": {\"icon\": \"/papel-picado.webp\", \"name\": \"Recepción\", \"mapsUrl\": \"https://maps.app.goo.gl/pZvRbQUC9NuKR724A\", \"fullName\": \"Salon de Eventos el Campestre\", \"position\": {\"lat\": 20.76102197545831, \"lng\": -104.0887613516478}}}, \"guestSides\": {\"side1\": \"NOVIO\", \"side2\": \"NOVIA\", \"side1Label\": \"Novio\", \"side2Label\": \"Novia\"}}','2026-05-02 21:22:54.740','2026-05-03 18:32:12.656');
/*!40000 ALTER TABLE `WeddingConfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('3155fcb9-ff82-4161-8e94-018a7b0d4669','fe5bbed1482b550feaa8a0cec0b8310d25a410197396d7e27808dce39ed9605b','2026-04-23 05:53:21.391','20260423055321_init',NULL,NULL,'2026-04-23 05:53:21.348',1),('37497e8e-083c-4add-9897-80c7af22c841','046b7d1a22d2f7252146b4004182d978eafe4d3c8589dacd5305668502050c03','2026-05-02 20:46:19.702','20260502204619_add_wedding_config',NULL,NULL,'2026-05-02 20:46:19.685',1),('b56eddfe-438a-4a4c-8cba-90a0e4cec2b2','332d58317cfa317d24e84641dcdbc556da5394606d41340871b35f9e80eb0c69','2026-05-03 07:57:01.377','20260503075701_add_wedding_config',NULL,NULL,'2026-05-03 07:57:01.334',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-05  7:57:07
