<?php

function attendanceExists() {
  $subject_code = $_GET['subject_code'];
  $today = date("Y-m-d");

  $checkQuery = "SELECT COUNT(*) as count FROM `attendance` WHERE `subject_code` = ? AND `created_on` = ?";
  $checkStmt = $conn->prepare($checkQuery);
  $checkStmt->bind_param("ss", $subject_code, $today);
  $checkStmt->execute();
  $result = $checkStmt->get_result();
  $row = $result->fetch_assoc();
  $checkStmt->close();
  
  if ($row['count'] > 0) {
      echo "true";
  } else {
    echo "false";
  }
}

?>