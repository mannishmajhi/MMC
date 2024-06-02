<?php
require_once '../../../src/globalHeader.php';
authorize('teacher');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    require_once '../../../src/databaseManager.php';
    $conn = establishConnectionToDB();
    
    if(!$conn) {
        die('Connection to database failed!');
    }
    else {
      $program = $_POST['program'];
      $semester = $_POST['semester'];
      $section = $_POST['section'];
      $subject_code = $_POST['subject'];
      $created_on = $_POST['date'];

      $pst = $conn->prepare("SELECT `roll_no`, `student_name`, `status` FROM `attendance` WHERE `program` = ? AND `semester` = ? AND `section` = ? AND `subject_code` = ? AND `created_on` = ?");
      $pst->bind_param("ssiss", $program, $semester, $section, $subject_code, $created_on);
      $pst->execute();
      $result = $pst->get_result();

      $contentsOfTbody = '';
      while ($row = $result->fetch_assoc()) {
        $contentsOfTbody .= '<tr>';
        $contentsOfTbody .= '<td>'.$row['roll_no'].'</td>';
        $contentsOfTbody .= '<td>'.$row['student_name'].'</td>';
        $contentsOfTbody .= '<td>'.$row['status'].'</td>';
        $contentsOfTbody .= '</tr>';
      }
      $pst->close();
    }

    $subject = strtoupper($subject_code);
    $template = <<<EOT
    <!DOCTYPE html>
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="icon" type="image/x-icon" href="../../../res/img/favicon.png" />
        <title>Attendance Report</title>
        <style>
          main {
            padding: 2rem;
            width: 7in;
            position: absolute;
            left: 50%;
            transform: translate(-50%, 0);
          }
          header {
            display: flex;
            justify-content: space-between;
          }
          #collegeInfo {
            display: flex;
            gap: 1rem;
          }
          img {
            height: 4rem;
            width: auto;
            filter: grayscale(100%);
          }
          h1 {
            margin: 0;
          }
          #dateDiv {
            font-size: 1.2rem;
            text-align: right;
            display: flex;
            align-items: center;
          }
          #attendanceInfo {
            margin: 0.5rem 0 1rem 0;
            display: flex;
            justify-content: space-between;
          }
          h3 {
            display: inline;
          }
          .leftH3 {
            text-align: right;
          }
          table,
          th,
          td {
            border: 1px solid black;
          }
          table {
            border-collapse: collapse;
            width: 100%;
          }
          thead {
            text-align: left;
          }
          th {
            padding: 0.2rem 1rem;
            font-size: 1.1rem;
          }
          tr {
            border-bottom: 1px solid lightgrey;
          }
          td {
            padding: 0.1rem 1rem;
            font-size: 1rem;
          }
        </style>
      </head>
      <body>
        <main>
          <header>
            <div id="collegeInfo">
              <img src="../../../res/img/favicon.png" alt="TU Logo" />
              <div>
                <h1>Mechi Multiple Campus</h1>
                <div>Bhadrapur, Jhapa</div>
              </div>
            </div>
            <div id="dateDiv">$created_on</div>
          </header>
          <div id="attendanceInfo">
            <div>
              <div>
                <h3>Program:</h3>
                <span>$program</span>
              </div>
              <div>
                <h3>Subject Code:</h3>
                <span>$subject</span>
              </div>
            </div>
            <div>
              <div class="leftH3">
                <h3>Semester:</h3>
                <span>$semester</span>
              </div>
              <div class="leftH3">
                <h3>Section:</h3>
                <span>$section</span>
              </div>
            </div>
          </div>
    
          <table>
            <thead>
              <tr>
                <th>Roll No</th>
                <th>Name</th>
                <th>Attendance</th>
              </tr>
            </thead>
            <tbody>
          $contentsOfTbody
        </tbody>
      </table>
    </main>
  </body>
</html>
EOT;
    echo $template;
    $conn->close();
    exit();
}

require_once '../../../src/selectDataGenerator.php';
$selectOptions = getClasses();

if (empty($_SESSION['csrf_token'])) {
  $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
}
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>New Attendance | Mechi Multiple Campus</title>
    <link rel="stylesheet" href="../../../res/css/theme.css" />
    <link rel="stylesheet" href="../../../res/css/attendance.css" />
    <link rel="icon" type="image/x-icon" href="../../../res/img/favicon.png" />
    <script src="../../../res/js/select.js"></script>
    <script src="../../../res/js/update-attendance.js"></script>
    <script>
      const classes = <?php echo json_encode($selectOptions); ?>;
  </script>
  </head>
  <body>
    <header>
      <span id="logo">
        <img src="../../../res/img/TU-Logo.svg.png" alt="TU Logo" />
        <h2>Mechi Multiple Campus</h2>
      </span>
      <button id="logout" onclick="logout()">Log out</button>
    </header>
    <main>
    <form action="" method="POST">
      <section>
        <div class="selector">
          <label for="program">Program</label>
          <select
            name="program"
            id="program"
            onchange="filterSemestersAccordingToProgram()"
          >
            <option value="">Select program</option>
            <?php
              $programs = array_unique(array_column($selectOptions, 'program'));
              foreach ($programs as $program) {
                  echo '<option value="'.$program.'">'.strtoupper($program).'</option>';
              }
            ?>
          </select>
        </div>

        <div class="selector">
          <label for="semester">Semester</label>
          <select
            name="semester"
            id="semester"
            disabled
            onchange="filterSectionsAccordingToSemester()"
          >
            <option value="">Select semester</option>
            <!--This section will be filled by JS-->
          </select>
        </div>

        <div class="selector">
          <label for="section">Section</label>
          <select
            name="section"
            id="section"
            disabled
            onchange="filterSubjectsAccordingToSection()"
          >
            <option value="">Select section</option>
            <!--This section will be filled by JS-->
          </select>
        </div>

        <div class="selector">
          <label for="subject">Subject</label>
          <select name="subject" id="subject" disabled>
            <option value="">Select subject</option>
            <!--This section will be filled by JS-->
          </select>
        </div>
        
        <div class="selector">
          <label for="date">Date</label>
          <input type="date" name="date" id="date" min="" max="" value="" />
        </div>

        <div class="selector">
          <button type="submit" id="loader">
            &emsp;Load&emsp;
          </button>
        </div>
      </section>
    </form>
  </body>
  <script>
    document.addEventListener("DOMContentLoaded", function() {        
      const today = new Date();        
      const year = today.getFullYear();
      const month = String(today.getMonth() + 1).padStart(2, '0');
      const day = String(today.getDate()).padStart(2, '0');
      const formattedDate = `${year}-${month}-${day}`;
      
      document.getElementById('date').max = formattedDate;
      document.getElementById('date').value = formattedDate;
    });
  </script>
</html>
