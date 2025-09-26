<?php
$host = 'localhost';
$db = 'u453976845_abcd';
$user = 'u453976845_bca';
$pass = 'KiranAdhikari@123';

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) die("Connection failed: " . $conn->connect_error);

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);

    $check = $conn->prepare("SELECT * FROM users WHERE username = ?");
    $check->bind_param("s", $username);
    $check->execute();
    $res = $check->get_result();

    if ($res->num_rows > 0) {
        $error = "Username already exists!";
    } else {
        $stmt = $conn->prepare("INSERT INTO users (username, password) VALUES (?, ?)");
        $stmt->bind_param("ss", $username, $password);
        if ($stmt->execute()) {
            header("Location: index.php");
            exit();
        } else {
            $error = "Registration failed!";
        }
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SymptoCheck Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            background: url('https://img.freepik.com/free-photo/medical-background-with-flat-icons-symbols_79603-231.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            overflow: hidden;
            position: relative;
        }
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.75); /* Subtle overlay for readability */
            z-index: 1;
        }
        .register-container {
            background: white;
            padding: 3rem;
            border-radius: 15px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
            max-width: 450px;
            width: 100%;
            animation: fadeIn 0.8s ease-in-out;
            position: relative;
            z-index: 2;
        }
        @keyframes fadeIn {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }
        .register-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }
        .register-header img {
            width: 60px;
            margin-bottom: 1rem;
            transition: transform 0.3s ease;
        }
        .register-header img:hover {
            transform: scale(1.1);
        }
        .register-header h3 {
            color: #2c3e50;
            font-weight: 600;
        }
        .form-control {
            border-radius: 8px;
            padding: 0.9rem;
            border: 1px solid #ced4da;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
        }
        .form-label {
            color: #34495e;
            font-weight: 500;
        }
        .btn-primary {
            background: linear-gradient(90deg, #007bff, #00c4b4);
            border: none;
            padding: 0.9rem;
            border-radius: 8px;
            font-weight: 500;
            width: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 15px rgba(0, 123, 255, 0.4);
        }
        .error-message {
            color: #dc3545;
            font-size: 0.9rem;
            margin-top: 1rem;
            text-align: center;
            background: #ffe6e6;
            padding: 0.5rem;
            border-radius: 5px;
        }
        .login-link {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.95rem;
        }
        .login-link a {
            color: #007bff;
            font-weight: 500;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        .login-link a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        .input-group-text {
            background: #f8f9fa;
            border-radius: 8px 0 0 8px;
            border: 1px solid #ced4da;
        }
        .form-group {
            position: relative;
            margin-bottom: 1.5rem;
        }
        .password-group {
            position: relative;
        }
        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #6c757d;
            cursor: pointer;
            font-size: 1rem;
            padding: 0.5rem;
            z-index: 3;
        }
        .password-group .form-control {
            padding-right: 2.5rem; /* Space for the eye icon */
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="register-header">
            <img src="https://img.icons8.com/color/50/000000/medical-doctor.png" alt="Medical Icon">
            <h3>SymptoCheck Registration</h3>
        </div>
        <form method="POST" action="register.php">
            <div class="form-group">
                <label for="username" class="form-label">Username</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
            </div>
            <div class="form-group password-group">
                <label for="password" class="form-label">Password</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="password" class="form-control" id="password" name="password" required>
                    <button type="button" class="toggle-password"><i class="fas fa-eye"></i></button>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
            <?php if (isset($error)) { ?>
                <p class="error-message"><?php echo $error; ?></p>
            <?php } ?>
        </form>
        <div class="login-link">
            <p>Already have an account? <a href="index.php">Sign In</a></p>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Toggle password visibility
        document.querySelector('.toggle-password').addEventListener('click', function () {
            const passwordField = document.querySelector('#password');
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            this.querySelector('i').classList.toggle('fa-eye');
            this.querySelector('i').classList.toggle('fa-eye-slash');
        });
    </script>
</body>
</html>