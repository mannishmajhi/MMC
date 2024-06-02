const URLmatches = window.location.href.match(/^(https?:\/\/[^/]+)/i);
const baseURL = URLmatches ? URLmatches[0] : "localhost" + window.location.port;

function checkIfAlreadyDone() {
  var program = document.getElementById("program").value;
  var semester = document.getElementById("semester").value;
  var section = document.getElementById("section").value;
  var subjectCode = document.getElementById("subject").value;

  let xhr = new XMLHttpRequest();

  xhr.open(
    "GET",
    baseURL +
      "/src/checkAttendance.php" +
      "?program=" +
      program +
      "&semester=" +
      semester +
      "&section=" +
      section +
      "&subject_code=" +
      subjectCode,
    true
  );
  xhr.send();

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      if (xhr.responseText) {
        tryRedirect();
      } else {
        generateTable();
      }
    }
  };
}

function tryRedirect() {
  if (window.confirm("Attendance already exists! Are you trying to update?")) {
    window.location.href =
      baseURL + "/page/teacher/update-attendance/modify.php";
  } else {
    window.location.href = baseURL + "/page/teacher.php";
  }
}

function loadStudents() {
  var program = document.getElementById("program").value;
  var semester = document.getElementById("semester").value;
  var section = document.getElementById("section").value;

  var xhr = new XMLHttpRequest();

  xhr.open("POST", baseURL + "/src/getStudents.php", true);
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  var params =
    "program=" +
    encodeURIComponent(program) +
    "&semester=" +
    encodeURIComponent(semester) +
    "&section=" +
    encodeURIComponent(section);
  xhr.send(params);

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      document.getElementsByTagName("section")[0].style.display = "none";
      document.getElementsByTagName("main")[0].style.paddingTop = "2rem";
      generateTable(xhr.responseText);
      generateHiddenForm();
      document.getElementById("form").style.display = "block";
    }
  };
}

function generateTable(studentRecord) {
  const table = document.getElementById("table");
  const tableBody = table.getElementsByTagName("tbody")[0];

  var students = JSON.parse(studentRecord);

  students.forEach((student) => {
    const row = document.createElement("tr");

    const rollNo = document.createElement("td");
    rollNo.textContent = student.roll_no;
    row.appendChild(rollNo);

    const name = document.createElement("td");
    name.textContent = student.student_name;
    row.appendChild(name);

    const status = document.createElement("td");
    status.innerHTML =
      '<input type="hidden" name="name[]" value="' +
      student.student_name +
      '"/>' +
      '<input type="radio" name="status[' +
      student.roll_no +
      '][]" value="present" checked /> Present' +
      "&emsp;" +
      '<input type="radio" name="status[' +
      student.roll_no +
      '][]" value="absent" /> Absent';
    row.appendChild(status);

    tableBody.appendChild(row);
  });
}

function generateHiddenForm() {
  const form = document.getElementById("form");
  const hiddenDiv = document.createElement("div");
  hiddenDiv.style.display = "none";
  hiddenDiv.innerHTML =
    '<input type="hidden" name="program" value="' +
    program +
    '"/>' +
    '<input type="hidden" name="semester" value="' +
    semester +
    '"/>' +
    '<input type="hidden" name="section" value="' +
    section +
    '"/>' +
    '<input type="hidden" name="subject_code" value="' +
    subjectCode +
    '"/>';
  form.appendChild(hiddenDiv);
}
