<?php
// Database connection
$host = 'localhost';
$db = 'u453976845_abcd';
$user = 'u453976845_bca';
$pass = 'KiranAdhikari@123'; // Replace with actual password

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Connection failed: " . $e->getMessage());
}

// Function to insert and return last inserted ID
function insertAndGetId($pdo, $table, $columns, $values) {
    $placeholders = implode(',', array_fill(0, count($values), '?'));
    $stmt = $pdo->prepare("INSERT INTO $table ($columns) VALUES ($placeholders)");
    $stmt->execute($values);
    return $pdo->lastInsertId();
}

// Predefined base data (to be expanded with random data)
$diseaseBase = [
    'Common Cold', 'Influenza', 'Allergies', 'Strep Throat', 'COVID-19', 'Bronchitis',
    'Pneumonia', 'Asthma', 'Sinusitis', 'Gastroenteritis', 'Malaria', 'Dengue',
    'Cholera', 'Typhoid', 'Tuberculosis', 'Hepatitis A', 'Hepatitis B', 'Measles',
    'Mumps', 'Rubella', 'Chickenpox', 'Shingles', 'Whooping Cough', 'Diphtheria',
    'Tetanus', 'Rabies', 'Yellow Fever', 'Zika Virus', 'Ebola', 'HIV/AIDS',
    'Diabetes Type 1', 'Diabetes Type 2', 'Hypertension', 'Heart Disease', 'Stroke',
    'Cancer', 'Arthritis', 'Osteoporosis', 'Alzheimer\'s', 'Parkinson\'s'
    // ... (add up to 50 if needed, but we'll generate the rest)
];
$symptomBase = [
    'Fever', 'Cough', 'Sore Throat', 'Runny Nose', 'Body Aches', 'Fatigue', 'Sneezing',
    'Itchy Eyes', 'Swollen Lymph Nodes', 'Shortness of Breath', 'Chest Pain', 'Nausea',
    'Diarrhea', 'Headache', 'Congestion'
];
$precautionBase = [
    'Rest and stay hydrated.', 'Get plenty of rest. Consider antiviral medication.',
    'Avoid allergens. Use antihistamines.', 'Take antibiotics if prescribed.',
    'Wear a mask. Practice hand hygiene.', 'Avoid smoking. Use a humidifier.',
    'Seek medical attention. Take antibiotics.', 'Use an inhaler. Avoid triggers.',
    'Use a saline nasal spray. Stay hydrated.', 'Rehydrate with oral solutions.'
];

// Generate additional random data to reach 210 diseases, 215 symptoms, 210 precautions
$additionalDiseases = array_map(function($i) { return "Disease_$i"; }, range(41, 210));
$diseases = array_merge($diseaseBase, $additionalDiseases);

$additionalSymptoms = array_map(function($i) { return "Symptom_$i"; }, range(16, 215));
$symptoms = array_map('ucfirst', array_merge($symptomBase, $additionalSymptoms));

$additionalPrecautions = array_map(function($i) { return "Precaution_$i: Follow medical advice."; }, range(11, 210));
$precautions = array_merge($precautionBase, $additionalPrecautions);

// Insert diseases
$diseaseIds = [];
foreach ($diseases as $disease) {
    $diseaseIds[] = insertAndGetId($pdo, 'disease', 'disease_name', [$disease]);
}

// Insert symptoms
$symptomIds = [];
foreach ($symptoms as $symptom) {
    $symptomIds[] = insertAndGetId($pdo, 'symptoms', 'symptom_name', [$symptom]);
}

// Insert disease_symptoms (3-4 symptoms per disease, approx 630-840 entries)
$diseaseSymptoms = [];
foreach ($diseaseIds as $diseaseId) {
    $symptomCount = rand(3, 4);
    $selectedSymptoms = array_rand(array_flip($symptomIds), $symptomCount);
    foreach ($selectedSymptoms as $symptomId) {
        $diseaseSymptoms[] = [$diseaseId, $symptomId];
    }
}
$stmt = $pdo->prepare("INSERT INTO disease_symptoms (disease_id, symptom_id) VALUES (?, ?)");
foreach ($diseaseSymptoms as $ds) {
    $stmt->execute($ds);
}

// Insert precautions (1-2 per disease, approx 210-420 entries)
$precautionAssignments = [];
foreach ($diseaseIds as $diseaseId) {
    $precautionCount = rand(1, 2);
    $selectedPrecautions = array_rand(array_flip($precautions), $precautionCount);
    foreach ($selectedPrecautions as $precaution) {
        $precautionAssignments[] = [$diseaseId, $precautions[$precaution]];
    }
}
$stmt = $pdo->prepare("INSERT INTO precautions (disease_id, precaution_text) VALUES (?, ?)");
foreach ($precautionAssignments as $pa) {
    $stmt->execute($pa);
}

echo "Database populated with approximately 300+ rows.\n";
?>
