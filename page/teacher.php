<?php
require_once '../src/globalHeader.php';
authorize('teacher');
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../res/css/theme.css" />
    <link rel="stylesheet" href="../res/css/teacher.css" />
    <link rel="icon" type="image/x-icon" href="../res/img/favicon.png" />
    <script src="../res/js/teacher.js"></script>
    <title>Teacher Dashboard | Mechi Multiple Campus</title>
  </head>
  <body>
    <header>
      <span id="logo">
        <img src="../res/img/TU-Logo.svg.png" alt="TU Logo" />
        <h2>Mechi Multiple Campus</h2>
      </span>
      <button type="button" id="logout" onclick="logout()">Log out</button>
    </header>
    <main>
      <div id="title">Please select an option</div>
      <details open>
        <summary>Attendance</summary>
        <article>
          <section>
            <img src="../res/img/notebook.png" alt="notebook" />
            <a href="./teacher/new-attendance/create.php" class="hgroup">
              <h3>New Attendance</h3>
              <h3 class="Nepali">नयाँ हाजिरी</h3>
            </a>
          </section>
          <section>
            <img src="../res/img/rejected.png" alt="notebook" />
            <a href="./teacher/update-attendance/modify.php" class="hgroup">
              <h3>Attendance Correction</h3>
              <h3 class="Nepali">हाजिरी सच्चाउने</h3>
            </a>
          </section>
          <section>
            <img src="../res/img/printer.png" alt="notebook" />
            <a href="./teacher/print-attendance/generate.php" class="hgroup">
              <h3>Print Attendance</h3>
              <h3 class="Nepali">हाजिरी निकाल्ने</h3>
            </a>
          </section>
        </article>
      </details>
      <details>
        <summary>Marksheet</summary>
        <article>
          <section>
            <img src="../res/img/notebook.png" alt="notebook" />
            <a href="#" class="hgroup">
              <h3>New Marksheet</h3>
              <h3 class="Nepali">नयाँ मार्कसिट</h3>
            </a>
          </section>
          <section>
            <img src="../res/img/rejected.png" alt="notebook" />
            <a href="#" class="hgroup">
              <h3>Marksheet Correction</h3>
              <h3 class="Nepali">मार्कसिट सच्चाउने</h3>
            </a>
          </section>
          <section>
            <img src="../res/img/printer.png" alt="notebook" />
            <a href="#" class="hgroup">
              <h3>Print Marksheet</h3>
              <h3 class="Nepali">मार्कसिट निकाल्ने</h3>
            </a>
          </section>
        </article>
      </details>
    </main>
  </body>
</html>
