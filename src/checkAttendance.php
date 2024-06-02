<?php
session_start();
if (!isset($_SESSION['user_name']) || ($_SESSION['user_role'] != 'teacher')) {
  die('ERROR 403: Unauthorized Access');
}

require_once 'databaseManager.php';
$conn = establishConnectionToDB();
if ($conn->connect_error) {
  die('Connection to database failed!');
}

$program = $_GET['program'];
$semester = $_GET['semester'];
$section = $_GET['section'];
$subject_code = $_GET['subject_code'];
$today = date('Y-m-d');

$checkStmt = $conn->prepare('SELECT COUNT(*) as count FROM `attendance` WHERE `program` = ? AND `semester` = ? AND `section` = ? AND `subject_code` = ? AND `created_on` = ?');
$checkStmt->bind_param('sisss', $program, $semester, $section , $subject_code, $today);
$checkStmt->execute();
$result = $checkStmt->get_result();
$row = $result->fetch_assoc();
$checkStmt->close();

if ($row['count'] > 0) {
  echo true;
} else {
  echo false;
}
?>