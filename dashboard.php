<?php
session_start();
if (!isset($_SESSION["username"])) {
    header("Location: index.php");
    exit();
}

$host = 'localhost';
$db = 'u453976845_abcd';
$user = 'u453976845_bca';
$pass = 'KiranAdhikari@123';

$error = false;
$result = '';
try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    $result = '<p class="text-red-600 bg-red-100 dark:text-red-300 dark:bg-red-900 p-4 rounded-lg">Database connection failed: ' . htmlspecialchars($e->getMessage()) . '</p>';
    $error = true;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['symptoms']) && !$error) {
    $inputSymptoms = trim($_POST['symptoms']);
    $selectedSymptoms = array_map('trim', array_filter(explode(',', $inputSymptoms)));
    if (!empty($selectedSymptoms)) {
        $lowerSymptoms = array_map('strtolower', $selectedSymptoms);
        $placeholders = implode(',', array_fill(0, count($lowerSymptoms), '?'));
        $stmt = $pdo->prepare("SELECT symptom_id FROM symptoms WHERE LOWER(symptom_name) IN ($placeholders)");
        $stmt->execute($lowerSymptoms);
        $symptomIds = $stmt->fetchAll(PDO::FETCH_COLUMN);

        if (!empty($symptomIds)) {
            $placeholders = implode(',', array_fill(0, count($symptomIds), '?'));
            $stmt = $pdo->prepare("SELECT d.disease_id, d.disease_name, COUNT(DISTINCT ds.symptom_id) as match_count
                FROM disease d
                JOIN disease_symptoms ds ON d.disease_id = ds.disease_id
                WHERE ds.symptom_id IN ($placeholders)
                GROUP BY d.disease_id, d.disease_name
                HAVING match_count >= 2
                ORDER BY match_count DESC
                LIMIT 3");
            $stmt->execute($symptomIds);
            $diseases = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if (!empty($diseases)) {
                $result = '<h2 class="text-2xl font-semibold text-gray-900 dark:text-gray-100 mb-6">Potential Diagnoses</h2><div class="space-y-4">';
                foreach ($diseases as $disease) {
                    $precautionStmt = $pdo->prepare("SELECT precaution_text FROM precautions WHERE disease_id = ? LIMIT 2");
                    $precautionStmt->execute([$disease['disease_id']]);
                    $precautions = $precautionStmt->fetchAll(PDO::FETCH_COLUMN);
                    $precautionText = !empty($precautions) ? implode('; ', $precautions) : 'Consult a healthcare professional for guidance.';
                    $result .= '<div class="p-4 bg-gray-50 dark:bg-gray-800 rounded-lg shadow-sm border border-gray-200 dark:border-gray-700"><h3 class="font-medium text-blue-700 dark:text-blue-400">' . htmlspecialchars($disease['disease_name']) . '</h3><p class="text-sm text-gray-600 dark:text-gray-300 mt-2">Precautions: ' . htmlspecialchars($precautionText) . '</p></div>';
                }
                $result .= '</div>';
            } else {
                $result = '<p class="text-yellow-600 bg-yellow-100 dark:text-yellow-300 dark:bg-yellow-900 p-4 rounded-lg shadow-sm">No diseases matched at least two of the provided symptoms.</p>';
            }
        } else {
            $result = '<p class="text-yellow-600 bg-yellow-100 dark:text-yellow-300 dark:bg-yellow-900 p-4 rounded-lg shadow-sm">No matching symptoms found in the database.</p>';
        }
    } else {
        $result = '<p class="text-red-600 bg-red-100 dark:text-red-300 dark:bg-red-900 p-4 rounded-lg shadow-sm">Please enter at least one symptom.</p>';
    }
}
?>
<!DOCTYPE html>
<html lang="en" class="transition duration-300">
<head>
    <meta charset="UTF-8">
    <title>SymptoCheck: Symptoms Based Disease Diagnosis</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: url('https://img.freepik.com/premium-photo/medical-healthcare-background-with-heartbeat-line_1272997-139.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 228, 235, 0.6); /* Reduced opacity */
            z-index: 1;
            transition: background 0.3s ease;
        }
        .dark body::before {
            background: rgba(17, 24, 39, 0.85); /* Dark overlay */
        }
        .container {
            position: relative;
            z-index: 2;
        }
        .fade-in {
            animation: fadeIn 0.8s ease-in-out;
        }
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        .input-icon {
            position: absolute;
            left: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            color: #6b7280;
            transition: color 0.3s ease;
        }
        .dark .input-icon {
            color: #9ca3af;
        }
        input:focus {
            box-shadow: 0 0 8px rgba(59, 130, 246, 0.3);
            border-color: #3b82f6;
        }
        .dark input:focus {
            box-shadow: 0 0 8px rgba(59, 130, 246, 0.5);
            border-color: #60a5fa;
        }
        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.4);
        }
        .dark button:hover {
            box-shadow: 0 4px 15px rgba(59, 130, 246, 0.5);
        }
        .symptoms-input {
            background-color: #fbe4ec;
            color: #1f2937;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        .symptoms-input::placeholder {
            color: #4b5563;
        }
        .dark .symptoms-input {
            background-color: #2d6b8f;
            color: #e5e7eb;
        }
        .dark .symptoms-input::placeholder {
            color: #9ca3af;
        }
        /* Ensure header text is black in light mode */
        .header-title {
            color: #000000 !important; /* Pure black in light mode */
        }
        .dark .header-title {
            color: #ffffff !important; /* White in dark mode */
        }
        .header-subtitle {
            color: #000000 !important; /* Pure black in light mode */
        }
        .dark .header-subtitle {
            color: #9ca3af !important; /* Gray-400 equivalent in dark mode */
        }
        /* Ensure footer text is black in light mode */
        .footer-text {
            color: #000000 !important; /* Pure black in light mode */
        }
        .dark .footer-text {
            color: #9ca3af !important; /* Gray-400 equivalent in dark mode */
        }
        .footer-disclaimer {
            color: #000000 !important; /* Pure black in light mode */
        }
        .dark .footer-disclaimer {
            color: #9ca3af !important; /* Gray-400 equivalent in dark mode */
        }
    </style>
</head>
<body class="bg-gray-50 dark:bg-gray-900 font-sans text-gray-900 dark:text-gray-100 min-h-screen flex items-center justify-center py-12">
<?php if (isset($_SESSION["username"])): ?>
<div class="fixed top-4 right-4 z-50 flex items-center space-x-3 text-sm">
    <span class="text-gray-800 dark:text-gray-200 bg-white dark:bg-gray-800 px-4 py-2 rounded-lg shadow-md flex items-center"><i class="fas fa-user-circle mr-2 text-blue-600 dark:text-blue-400"></i>Welcome, <?php echo htmlspecialchars($_SESSION["username"]); ?></span>
    <button id="darkToggle" class="bg-gray-200 dark:bg-gray-700 text-gray-800 dark:text-gray-100 px-3 py-2 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600 transition"><i class="fas fa-moon"></i></button>
    <a href="logout.php" class="bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-lg transition flex items-center"><i class="fas fa-sign-out-alt mr-2"></i>Logout</a>
</div>
<?php endif; ?>

<div class="container mx-auto p-6 max-w-4xl fade-in">
    <header class="text-center mb-10">
        <img src="https://img.icons8.com/color/50/000000/hospital.png" alt="Medical Icon" class="mx-auto w-20 mb-4 transition-transform duration-300 hover:scale-110">
        <h1 class="text-4xl font-semibold header-title">SymptoCheck: Symptoms Based Disease Diagnosis</h1>
        <p class="header-subtitle mt-3 text-lg">Enter symptoms to receive a preliminary health assessment. Always consult a healthcare professional for accurate diagnosis.</p>
    </header>
    <div class="bg-white dark:bg-gray-800 rounded-xl shadow-xl p-10">
        <form method="POST" class="space-y-8">
            <div class="relative">
                <label for="symptoms" class="block text-sm font-medium text-gray-700 dark:text-gray-300">Symptoms</label>
                <div class="relative mt-2">
                    <i class="fas fa-stethoscope input-icon text-blue-600 dark:text-blue-400"></i>
                    <input type="text" id="symptoms" name="symptoms" class="symptoms-input block w-full pl-10 pr-4 py-3 border-gray-300 dark:border-gray-600 rounded-lg shadow-sm focus:ring-blue-500 focus:border-blue-500" placeholder="Type symptoms (e.g., fever, cough)" value="<?php echo isset($_POST['symptoms']) ? htmlspecialchars($_POST['symptoms']) : ''; ?>" autocomplete="off">
                </div>
                <p class="mt-2 text-xs text-gray-500 dark:text-gray-400">Separate multiple symptoms with commas (e.g., fever, cough, sore throat).</p>
            </div>
            <button type="submit" class="w-full bg-gradient-to-r from-blue-600 to-teal-500 dark:from-blue-700 dark:to-teal-600 text-white py-3 px-6 rounded-lg hover:from-blue-700 hover:to-teal-600 dark:hover:from-blue-800 dark:hover:to-teal-700 transition duration-300 transform text-lg font-medium">Analyze Symptoms</button>
        </form>
        <div class="mt-8"><?php echo $result; ?></div>
    </div>
    <footer class="text-center mt-10 text-sm">
        <p class="footer-text">Developed for educational purposes. Last updated: June 19, 2025.<br><span class="footer-disclaimer text-xs">Disclaimer: This tool is not a substitute for professional medical advice.</span></p>
    </footer>
</div>

<script>
    const toggle = document.getElementById('darkToggle');
    const root = document.documentElement;
    const icon = toggle.querySelector('i');
    if (localStorage.getItem('theme') === 'dark') {
        root.classList.add('dark');
        icon.classList.remove('fa-moon');
        icon.classList.add('fa-sun');
    }
    toggle.addEventListener('click', () => {
        root.classList.toggle('dark');
        const isDark = root.classList.contains('dark');
        localStorage.setItem('theme', isDark ? 'dark' : 'light');
        icon.classList.toggle('fa-moon');
        icon.classList.toggle('fa-sun');
    });
</script>
</body>
</html>