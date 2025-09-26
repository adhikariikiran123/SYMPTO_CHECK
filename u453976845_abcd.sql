-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 26, 2025 at 01:19 PM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u453976845_abcd`
--

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `disease_id` int(11) NOT NULL,
  `disease_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disease`
--

INSERT INTO `disease` (`disease_id`, `disease_name`) VALUES
(1, 'Common Cold'),
(2, 'Influenza'),
(3, 'Allergies'),
(4, 'Strep Throat'),
(5, 'COVID-19'),
(6, 'Bronchitis'),
(7, 'Pneumonia'),
(8, 'Asthma'),
(9, 'Sinusitis'),
(10, 'Gastroenteritis'),
(11, 'Malaria'),
(12, 'Dengue'),
(13, 'Cholera'),
(14, 'Typhoid'),
(15, 'Tuberculosis'),
(16, 'Hepatitis A'),
(17, 'Hepatitis B'),
(18, 'Measles'),
(19, 'Mumps'),
(20, 'Rubella'),
(21, 'Chickenpox'),
(22, 'Shingles'),
(23, 'Whooping Cough'),
(24, 'Diphtheria'),
(25, 'Tetanus'),
(26, 'Rabies'),
(27, 'Yellow Fever'),
(28, 'Zika Virus'),
(29, 'Ebola'),
(30, 'HIV/AIDS'),
(31, 'Diabetes Type 1'),
(32, 'Diabetes Type 2'),
(33, 'Hypertension'),
(34, 'Heart Disease'),
(35, 'Stroke'),
(36, 'Cancer'),
(37, 'Arthritis'),
(38, 'Osteoporosis'),
(39, 'Alzheimer\'s'),
(40, 'Parkinson\'s'),
(41, 'Epilepsy'),
(42, 'Migraine'),
(43, 'Anxiety'),
(44, 'Depression'),
(45, 'Schizophrenia'),
(46, 'Bipolar Disorder'),
(47, 'Obesity'),
(48, 'Anemia'),
(49, 'Scurvy'),
(50, 'Rickets'),
(51, 'Goiter'),
(52, 'Celiac Disease'),
(53, 'Crohn\'s Disease'),
(54, 'Ulcerative Colitis'),
(55, 'Irritable Bowel Syndrome'),
(56, 'Kidney Stones'),
(57, 'Urinary Tract Infection'),
(58, 'Glaucoma'),
(59, 'Cataracts'),
(60, 'Macular Degeneration'),
(61, 'Hearing Loss'),
(62, 'Tinnitus'),
(63, 'Lupus'),
(64, 'Multiple Sclerosis'),
(65, 'Muscular Dystrophy'),
(66, 'Cystic Fibrosis'),
(67, 'Sickle Cell Anemia'),
(68, 'Hemophilia'),
(69, 'Leukemia'),
(70, 'Lymphoma'),
(71, 'Psoriasis'),
(72, 'Eczema'),
(73, 'Acne'),
(74, 'Rosacea'),
(75, 'Hives'),
(76, 'Scabies'),
(77, 'Ringworm'),
(78, 'Athlete\'s Foot'),
(79, 'Jock Itch'),
(80, 'Candidiasis'),
(81, 'Gonorrhea'),
(82, 'Chlamydia'),
(83, 'Syphilis'),
(84, 'Herpes'),
(85, 'HPV'),
(86, 'Trichomoniasis'),
(87, 'Endometriosis'),
(88, 'Polycystic Ovary Syndrome'),
(89, 'Fibroids'),
(90, 'Menopause'),
(91, 'Erectile Dysfunction'),
(92, 'Prostate Cancer'),
(93, 'Testicular Cancer'),
(94, 'Breast Cancer'),
(95, 'Ovarian Cancer'),
(96, 'Cervical Cancer'),
(97, 'Uterine Cancer'),
(98, 'Thyroid Cancer'),
(99, 'Pancreatic Cancer'),
(100, 'Liver Cancer'),
(101, 'Lung Cancer'),
(102, 'Skin Cancer'),
(103, 'Bladder Cancer'),
(104, 'Kidney Cancer'),
(105, 'Colorectal Cancer'),
(106, 'Esophageal Cancer'),
(107, 'Stomach Cancer'),
(108, 'Gallbladder Disease'),
(109, 'Pancreatitis'),
(110, 'Hepatitis C'),
(111, 'Cirrhosis'),
(112, 'Fatty Liver Disease'),
(113, 'Appendicitis'),
(114, 'Diverticulitis'),
(115, 'Hernia'),
(116, 'Hemorrhoids'),
(117, 'Varicose Veins'),
(118, 'Deep Vein Thrombosis'),
(119, 'Pulmonary Embolism'),
(120, 'Emphysema'),
(121, 'Chronic Obstructive Pulmonary Disease'),
(122, 'Sleep Apnea'),
(123, 'Insomnia'),
(124, 'Restless Leg Syndrome'),
(125, 'Gout'),
(126, 'Osteoarthritis'),
(127, 'Rheumatoid Arthritis'),
(128, 'Fibromyalgia'),
(129, 'Chronic Fatigue Syndrome'),
(130, 'Lyme Disease'),
(131, 'West Nile Virus'),
(132, 'Rocky Mountain Spotted Fever'),
(133, 'Leptospirosis'),
(134, 'Toxoplasmosis'),
(135, 'Cryptococcosis'),
(136, 'Histoplasmosis'),
(137, 'Aspergillosis'),
(138, 'Candidiasis (Systemic)'),
(139, 'Valley Fever'),
(140, 'Disease_101'),
(141, 'Disease_102'),
(142, 'Disease_103'),
(143, 'Disease_104'),
(144, 'Disease_105'),
(145, 'Disease_106'),
(146, 'Disease_107'),
(147, 'Disease_108'),
(148, 'Disease_109'),
(149, 'Disease_110'),
(150, 'Disease_111'),
(151, 'Disease_112'),
(152, 'Disease_113'),
(153, 'Disease_114'),
(154, 'Disease_115'),
(155, 'Disease_116'),
(156, 'Disease_117'),
(157, 'Disease_118'),
(158, 'Disease_119'),
(159, 'Disease_120'),
(160, 'Disease_121'),
(161, 'Disease_122'),
(162, 'Disease_123'),
(163, 'Disease_124'),
(164, 'Disease_125'),
(165, 'Disease_126'),
(166, 'Disease_127'),
(167, 'Disease_128'),
(168, 'Disease_129'),
(169, 'Disease_130'),
(170, 'Disease_131'),
(171, 'Disease_132'),
(172, 'Disease_133'),
(173, 'Disease_134'),
(174, 'Disease_135'),
(175, 'Disease_136'),
(176, 'Disease_137'),
(177, 'Disease_138'),
(178, 'Disease_139'),
(179, 'Disease_140'),
(180, 'Disease_141'),
(181, 'Disease_142'),
(182, 'Disease_143'),
(183, 'Disease_144'),
(184, 'Disease_145'),
(185, 'Disease_146'),
(186, 'Disease_147'),
(187, 'Disease_148'),
(188, 'Disease_149'),
(189, 'Disease_150'),
(190, 'Disease_151'),
(191, 'Disease_152'),
(192, 'Disease_153'),
(193, 'Disease_154'),
(194, 'Disease_155'),
(195, 'Disease_156'),
(196, 'Disease_157'),
(197, 'Disease_158'),
(198, 'Disease_159'),
(199, 'Disease_160'),
(200, 'Disease_161'),
(201, 'Disease_162'),
(202, 'Disease_163'),
(203, 'Disease_164'),
(204, 'Disease_165'),
(205, 'Disease_166'),
(206, 'Disease_167'),
(207, 'Disease_168'),
(208, 'Disease_169'),
(209, 'Disease_170'),
(210, 'Disease_171'),
(211, 'Disease_172'),
(212, 'Disease_173'),
(213, 'Disease_174'),
(214, 'Disease_175'),
(215, 'Disease_176'),
(216, 'Disease_177'),
(217, 'Disease_178'),
(218, 'Disease_179'),
(219, 'Disease_180'),
(220, 'Disease_181'),
(221, 'Disease_182'),
(222, 'Disease_183'),
(223, 'Disease_184'),
(224, 'Disease_185'),
(225, 'Disease_186'),
(226, 'Disease_187'),
(227, 'Disease_188'),
(228, 'Disease_189'),
(229, 'Disease_190'),
(230, 'Disease_191'),
(231, 'Disease_192'),
(232, 'Disease_193'),
(233, 'Disease_194'),
(234, 'Disease_195'),
(235, 'Disease_196'),
(236, 'Disease_197'),
(237, 'Disease_198'),
(238, 'Disease_199'),
(239, 'Disease_200'),
(240, 'Disease_201'),
(241, 'Disease_202'),
(242, 'Disease_203'),
(243, 'Disease_204'),
(244, 'Disease_205'),
(245, 'Disease_206'),
(246, 'Disease_207'),
(247, 'Disease_208'),
(248, 'Disease_209'),
(249, 'Disease_210');

-- --------------------------------------------------------

--
-- Table structure for table `disease_symptoms`
--

CREATE TABLE `disease_symptoms` (
  `ds_id` int(11) NOT NULL,
  `disease_id` int(11) NOT NULL,
  `symptom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disease_symptoms`
--

INSERT INTO `disease_symptoms` (`ds_id`, `disease_id`, `symptom_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 1),
(6, 2, 2),
(7, 2, 5),
(8, 2, 6),
(9, 3, 4),
(10, 3, 7),
(11, 3, 8),
(12, 4, 3),
(13, 4, 1),
(14, 4, 9),
(15, 5, 1),
(16, 5, 2),
(17, 5, 10),
(18, 5, 6),
(19, 6, 2),
(20, 6, 10),
(21, 6, 11),
(22, 7, 1),
(23, 7, 2),
(24, 7, 10),
(25, 7, 11),
(26, 8, 10),
(27, 8, 12),
(28, 9, 4),
(29, 9, 14),
(30, 9, 15),
(31, 10, 12),
(32, 10, 13);

-- --------------------------------------------------------

--
-- Table structure for table `precautions`
--

CREATE TABLE `precautions` (
  `precaution_id` int(11) NOT NULL,
  `disease_id` int(11) NOT NULL,
  `precaution_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `precautions`
--

INSERT INTO `precautions` (`precaution_id`, `disease_id`, `precaution_text`) VALUES
(1, 1, 'Rest and stay hydrated. Avoid close contact with others.'),
(2, 2, 'Get plenty of rest. Consider antiviral medication if prescribed.'),
(3, 3, 'Avoid allergens. Use antihistamines if recommended by a doctor.'),
(4, 4, 'Take antibiotics if prescribed. Gargle with salt water.'),
(5, 5, 'Wear a mask. Practice social distancing and hand hygiene.'),
(6, 6, 'Avoid smoking. Use a humidifier to ease breathing.'),
(7, 7, 'Seek medical attention. Take prescribed antibiotics.'),
(8, 8, 'Use an inhaler. Avoid triggers like dust or pollen.'),
(9, 9, 'Use a saline nasal spray. Stay hydrated.'),
(10, 10, 'Rehydrate with oral rehydration solutions. Avoid dairy.'),
(11, 11, 'Use mosquito repellent. Seek medical help if severe.'),
(12, 12, 'Rest and hydrate. Monitor for bleeding.'),
(13, 13, 'Drink boiled water. Seek medical care.'),
(14, 14, 'Maintain hygiene. Take prescribed antibiotics.'),
(15, 15, 'Avoid crowded places. Complete treatment.'),
(16, 16, 'Vaccinate. Practice good hygiene.'),
(17, 17, 'Get vaccinated. Avoid sharing needles.'),
(18, 18, 'Isolate. Vaccinate if possible.'),
(19, 19, 'Rest. Vaccinate for prevention.'),
(20, 20, 'Isolate. Keep skin clean.'),
(21, 21, 'Avoid scratching. Use antiviral cream.'),
(22, 22, 'Manage stress. Consult a doctor.'),
(23, 23, 'Vaccinate. Avoid close contact.'),
(24, 24, 'Get vaccinated. Seek treatment.'),
(25, 25, 'Vaccinate. Clean wounds.'),
(26, 26, 'Avoid animal bites. Seek immediate care.'),
(27, 27, 'Vaccinate. Use insect repellent.'),
(28, 28, 'Prevent mosquito bites. Rest.'),
(29, 29, 'Isolate. Seek specialized care.'),
(30, 30, 'Use protection. Regular testing.'),
(31, 31, 'Monitor blood sugar. Follow diet.'),
(32, 32, 'Control diet. Exercise regularly.'),
(33, 33, 'Reduce salt intake. Monitor BP.'),
(34, 34, 'Eat heart-healthy diet. Exercise.'),
(35, 35, 'Manage stress. Seek therapy.'),
(36, 36, 'Regular screenings. Healthy diet.'),
(37, 37, 'Manage joint pain. Exercise.'),
(38, 38, 'Calcium intake. Weight-bearing exercise.'),
(39, 39, 'Cognitive exercises. Medication.'),
(40, 40, 'Medication. Physical therapy.'),
(41, 41, 'Avoid triggers. Take medication.'),
(42, 42, 'Manage stress. Therapy.'),
(43, 43, 'Counseling. Medication.'),
(44, 44, 'Therapy. Medication.'),
(45, 45, 'Mood stabilization. Therapy.'),
(46, 46, 'Healthy diet. Exercise.'),
(47, 47, 'Iron supplements. Diet rich in iron.'),
(48, 48, 'Vitamin C intake. Healthy diet.'),
(49, 49, 'Vitamin D supplements. Sun exposure.'),
(50, 50, 'Iodine-rich diet. Medication.'),
(51, 51, 'Gluten-free diet. Monitor symptoms.'),
(52, 52, 'Anti-inflammatory diet. Medication.'),
(53, 53, 'Low-fiber diet. Medication.'),
(54, 54, 'High-fiber diet. Hydration.'),
(55, 55, 'Drink water. Medication.'),
(56, 56, 'Antibiotics. Hydration.'),
(57, 57, 'Eye drops. Regular checkups.'),
(58, 58, 'Surgery if needed. Eye care.'),
(59, 59, 'Vitamin A supplements. Eye care.'),
(60, 60, 'Hearing aids. Avoid loud noise.'),
(61, 61, 'Precaution_61: Follow medical advice.'),
(62, 62, 'Precaution_62: Rest and hydrate.'),
(63, 63, 'Precaution_63: Avoid triggers.'),
(64, 64, 'Precaution_64: Seek treatment.'),
(65, 65, 'Precaution_65: Maintain hygiene.'),
(66, 66, 'Precaution_66: Use medication.'),
(67, 67, 'Precaution_67: Regular checkups.'),
(68, 68, 'Precaution_68: Healthy diet.'),
(69, 69, 'Precaution_69: Exercise daily.'),
(70, 70, 'Precaution_70: Avoid stress.'),
(71, 209, 'Precaution_209: Consult doctor.'),
(72, 210, 'Precaution_210: Follow guidelines.');

-- --------------------------------------------------------

--
-- Table structure for table `symptoms`
--

CREATE TABLE `symptoms` (
  `symptom_id` int(11) NOT NULL,
  `symptom_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `symptoms`
--

INSERT INTO `symptoms` (`symptom_id`, `symptom_name`) VALUES
(1, 'Fever'),
(2, 'Cough'),
(3, 'Sore Throat'),
(4, 'Runny Nose'),
(5, 'Body Aches'),
(6, 'Fatigue'),
(7, 'Sneezing'),
(8, 'Itchy Eyes'),
(9, 'Swollen Lymph Nodes'),
(10, 'Shortness of Breath'),
(11, 'Chest Pain'),
(12, 'Nausea'),
(13, 'Diarrhea'),
(14, 'Headache'),
(15, 'Congestion'),
(16, 'Rash'),
(17, 'Joint Pain'),
(18, 'Vomiting'),
(19, 'Abdominal Pain'),
(20, 'Muscle Weakness'),
(21, 'Dizziness'),
(22, 'Blurred Vision'),
(23, 'Hearing Loss'),
(24, 'Tinnitus'),
(25, 'Skin Lesions'),
(26, 'Jaundice'),
(27, 'Swelling'),
(28, 'Weight Loss'),
(29, 'Night Sweats'),
(30, 'Chills'),
(31, 'Loss of Appetite'),
(32, 'Thirst'),
(33, 'Frequent Urination'),
(34, 'Dry Mouth'),
(35, 'Itching'),
(36, 'Redness'),
(37, 'Burning Sensation'),
(38, 'Tremors'),
(39, 'Seizures'),
(40, 'Memory Loss'),
(41, 'Confusion'),
(42, 'Hallucinations'),
(43, 'Irritability'),
(44, 'Mood Swings'),
(45, 'Insomnia'),
(46, 'Restlessness'),
(47, 'Palpitations'),
(48, 'Sweating'),
(49, 'Cold Hands'),
(50, 'Hot Flashes'),
(51, 'Numbness'),
(52, 'Tingling'),
(53, 'Stiffness'),
(54, 'Cramping'),
(55, 'Spasms'),
(56, 'Weak Pulse'),
(57, 'Rapid Breathing'),
(58, 'Wheezing'),
(59, 'Hoarseness'),
(60, 'Difficulty Swallowing'),
(61, 'Blood in Urine'),
(62, 'Foamy Urine'),
(63, 'Dark Urine'),
(64, 'Pale Stools'),
(65, 'Yellow Skin'),
(66, 'Bruising'),
(67, 'Bleeding Gums'),
(68, 'Sore Gums'),
(69, 'Tooth Pain'),
(70, 'Ear Pain'),
(71, 'Eye Pain'),
(72, 'Nasal Discharge'),
(73, 'Mouth Sores'),
(74, 'Genital Sores'),
(75, 'Back Pain'),
(76, 'Neck Pain'),
(77, 'Shoulder Pain'),
(78, 'Hip Pain'),
(79, 'Knee Pain'),
(80, 'Ankle Pain'),
(81, 'Wrist Pain'),
(82, 'Elbow Pain'),
(83, 'Finger Pain'),
(84, 'Toe Pain'),
(85, 'Heel Pain'),
(86, 'Shin Pain'),
(87, 'Calf Pain'),
(88, 'Thigh Pain'),
(89, 'Arm Pain'),
(90, 'Hand Pain'),
(91, 'Foot Pain'),
(92, 'Leg Cramps'),
(93, 'Arm Cramps'),
(94, 'Facial Pain'),
(95, 'Jaw Pain'),
(96, 'Chest Tightness'),
(97, 'Abdominal Swelling'),
(98, 'Bloating'),
(99, 'Gas'),
(100, 'Heartburn'),
(101, 'Indigestion'),
(102, 'Constipation'),
(103, 'Flatulence'),
(104, 'Hiccups'),
(105, 'Belching'),
(106, 'Dry Skin'),
(107, 'Oily Skin'),
(108, 'Flaky Skin'),
(109, 'Cracked Skin'),
(110, 'Scaly Skin'),
(111, 'Blisters'),
(112, 'Ulcers'),
(113, 'Warts'),
(114, 'Corns'),
(115, 'Calluses'),
(116, 'Ingrown Toenails'),
(117, 'Symptom_66'),
(118, 'Symptom_67'),
(119, 'Symptom_68'),
(120, 'Symptom_69'),
(121, 'Symptom_70'),
(122, 'Symptom_71'),
(123, 'Symptom_72'),
(124, 'Symptom_73'),
(125, 'Symptom_74'),
(126, 'Symptom_75'),
(127, 'Symptom_76'),
(128, 'Symptom_77'),
(129, 'Symptom_78'),
(130, 'Symptom_79'),
(131, 'Symptom_80'),
(132, 'Symptom_81'),
(133, 'Symptom_82'),
(134, 'Symptom_83'),
(135, 'Symptom_84'),
(136, 'Symptom_85'),
(137, 'Symptom_86'),
(138, 'Symptom_87'),
(139, 'Symptom_88'),
(140, 'Symptom_89'),
(141, 'Symptom_90'),
(142, 'Symptom_91'),
(143, 'Symptom_92'),
(144, 'Symptom_93'),
(145, 'Symptom_94'),
(146, 'Symptom_95'),
(147, 'Symptom_96'),
(148, 'Symptom_97'),
(149, 'Symptom_98'),
(150, 'Symptom_99'),
(151, 'Symptom_100'),
(152, 'Symptom_101'),
(153, 'Symptom_102'),
(154, 'Symptom_103'),
(155, 'Symptom_104'),
(156, 'Symptom_105'),
(157, 'Symptom_106'),
(158, 'Symptom_107'),
(159, 'Symptom_108'),
(160, 'Symptom_109'),
(161, 'Symptom_110'),
(162, 'Symptom_111'),
(163, 'Symptom_112'),
(164, 'Symptom_113'),
(165, 'Symptom_114'),
(166, 'Symptom_115'),
(167, 'Symptom_116'),
(168, 'Symptom_117'),
(169, 'Symptom_118'),
(170, 'Symptom_119'),
(171, 'Symptom_120'),
(172, 'Symptom_121'),
(173, 'Symptom_122'),
(174, 'Symptom_123'),
(175, 'Symptom_124'),
(176, 'Symptom_125'),
(177, 'Symptom_126'),
(178, 'Symptom_127'),
(179, 'Symptom_128'),
(180, 'Symptom_129'),
(181, 'Symptom_130'),
(182, 'Symptom_131'),
(183, 'Symptom_132'),
(184, 'Symptom_133'),
(185, 'Symptom_134'),
(186, 'Symptom_135'),
(187, 'Symptom_136'),
(188, 'Symptom_137'),
(189, 'Symptom_138'),
(190, 'Symptom_139'),
(191, 'Symptom_140'),
(192, 'Symptom_141'),
(193, 'Symptom_142'),
(194, 'Symptom_143'),
(195, 'Symptom_144'),
(196, 'Symptom_145'),
(197, 'Symptom_146'),
(198, 'Symptom_147'),
(199, 'Symptom_148'),
(200, 'Symptom_149'),
(201, 'Symptom_150'),
(202, 'Symptom_151'),
(203, 'Symptom_152'),
(204, 'Symptom_153'),
(205, 'Symptom_154'),
(206, 'Symptom_155'),
(207, 'Symptom_156'),
(208, 'Symptom_157'),
(209, 'Symptom_158'),
(210, 'Symptom_159'),
(211, 'Symptom_160'),
(212, 'Symptom_161'),
(213, 'Symptom_162'),
(214, 'Symptom_163'),
(215, 'Symptom_164'),
(216, 'Symptom_165'),
(217, 'Symptom_166'),
(218, 'Symptom_167'),
(219, 'Symptom_168'),
(220, 'Symptom_169'),
(221, 'Symptom_170'),
(222, 'Symptom_171'),
(223, 'Symptom_172'),
(224, 'Symptom_173'),
(225, 'Symptom_174'),
(226, 'Symptom_175'),
(227, 'Symptom_176'),
(228, 'Symptom_177'),
(229, 'Symptom_178'),
(230, 'Symptom_179'),
(231, 'Symptom_180'),
(232, 'Symptom_181'),
(233, 'Symptom_182'),
(234, 'Symptom_183'),
(235, 'Symptom_184'),
(236, 'Symptom_185'),
(237, 'Symptom_186'),
(238, 'Symptom_187'),
(239, 'Symptom_188'),
(240, 'Symptom_189'),
(241, 'Symptom_190'),
(242, 'Symptom_191'),
(243, 'Symptom_192'),
(244, 'Symptom_193'),
(245, 'Symptom_194'),
(246, 'Symptom_195'),
(247, 'Symptom_196'),
(248, 'Symptom_197'),
(249, 'Symptom_198'),
(250, 'Symptom_199'),
(251, 'Symptom_200'),
(252, 'Symptom_201'),
(253, 'Symptom_202'),
(254, 'Symptom_203'),
(255, 'Symptom_204'),
(256, 'Symptom_205'),
(257, 'Symptom_206'),
(258, 'Symptom_207'),
(259, 'Symptom_208'),
(260, 'Symptom_209'),
(261, 'Symptom_210'),
(262, 'Symptom_211'),
(263, 'Symptom_212'),
(264, 'Symptom_213'),
(265, 'Symptom_214'),
(266, 'Symptom_215');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(3, 'kiran', '$2y$10$bvAf2iUsA4F2eYuJFfHaXe4.5.0ExA/7EWl2LsDEVHNm/ifFZWXAu', '2025-06-18 16:37:52'),
(6, 'Diksha_Kapri', '$2y$10$9fot.6fvZvllc36D1Zd9wuZdK6wkuOc9kzuar8q9.6XvbcC/Hwl0K', '2025-06-18 19:28:19'),
(7, 'Priti', '$2y$10$Jt/yeA8ltoMoNoGSQZJDX.VjbFZgjqcRBR/eH3B1vFkBVqXw.rauq', '2025-06-19 04:00:25'),
(8, 'Shradha', '$2y$10$59fGUs6BVZnzadUJUSqmU.5yRpzbs1lcGpB/2o2u05Ny.KDiKk74i', '2025-06-19 04:02:48'),
(9, 'Aman', '$2y$10$zHU4l.T6NlTIASADYjcoh.AYg5G3AnAdvuEsk.SSOeHIjemTzZ5gi', '2025-06-19 04:59:03'),
(10, 'Shreya ', '$2y$10$SoxNRq6HrYhyPSz8cJHMzOhstrIa17XdO3sxvmmiLaz7hCEmC/77.', '2025-06-19 04:59:36'),
(11, 'Aditya', '$2y$10$COkF8sQibxLdqwaHSAgxCuB.b0sbQ1O2WQtOPxDPTQ35dPHB5tk7u', '2025-06-19 05:36:38'),
(12, 'Divya', '$2y$10$N5wSMiPnbbU5JLSZQ5xXBOWFHLKfiAzXGTumKuAgwL5tO9BP2X9Ru', '2025-08-07 10:17:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`disease_id`);

--
-- Indexes for table `disease_symptoms`
--
ALTER TABLE `disease_symptoms`
  ADD PRIMARY KEY (`ds_id`),
  ADD KEY `disease_id` (`disease_id`),
  ADD KEY `symptom_id` (`symptom_id`);

--
-- Indexes for table `precautions`
--
ALTER TABLE `precautions`
  ADD PRIMARY KEY (`precaution_id`),
  ADD KEY `disease_id` (`disease_id`);

--
-- Indexes for table `symptoms`
--
ALTER TABLE `symptoms`
  ADD PRIMARY KEY (`symptom_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disease`
--
ALTER TABLE `disease`
  MODIFY `disease_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `disease_symptoms`
--
ALTER TABLE `disease_symptoms`
  MODIFY `ds_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `precautions`
--
ALTER TABLE `precautions`
  MODIFY `precaution_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `symptoms`
--
ALTER TABLE `symptoms`
  MODIFY `symptom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disease_symptoms`
--
ALTER TABLE `disease_symptoms`
  ADD CONSTRAINT `disease_symptoms_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`),
  ADD CONSTRAINT `disease_symptoms_ibfk_2` FOREIGN KEY (`symptom_id`) REFERENCES `symptoms` (`symptom_id`);

--
-- Constraints for table `precautions`
--
ALTER TABLE `precautions`
  ADD CONSTRAINT `precautions_ibfk_1` FOREIGN KEY (`disease_id`) REFERENCES `disease` (`disease_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
