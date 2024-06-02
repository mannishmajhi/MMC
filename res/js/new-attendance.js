function loadStudents() {
  var program = document.getElementById("program").value;
  var semester = document.getElementById("semester").value;
  var section = document.getElementById("section").value;
  var subjectCode = document.getElementById("subject").value;
  const URLmatches = window.location.href.match(/^(https?:\/\/[^/]+)/i);
  var baseURL = URLmatches ? URLmatches[0] : "localhost" + window.location.port;

  var check = new XMLHttpRequest();
  check.open(
    "GET",
    baseURL +
      "/src/checkExistenceOfAttendance.php" +
      "?subject_code=" +
      subjectCode,
    true
  );
  check.send();
  check.onreadystatechange = function () {
    if (check.readyState == 4 && check.status == 200) {
      console.log(check.responseText);
      if (check.responseText) {
        window.open(baseURL + "teacher/update-attendance/modify.php");
      }
    }
  };

  var xhr = new XMLHttpRequest();
  xhr.open(
    "GET",
    baseURL +
      "/src/getStudents.php" +
      "?program=" +
      program +
      "&semester=" +
      semester +
      "&section=" +
      section,
    true
  );

  xhr.send();

  xhr.onreadystatechange = function () {
    if (xhr.readyState == 4 && xhr.status == 200) {
      document.getElementsByTagName("section")[0].style.display = "none";
      document.getElementsByTagName("main")[0].style.paddingTop = "2rem";

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

      const table = document.getElementById("table");
      const tableBody = table.getElementsByTagName("tbody")[0];
      var students = JSON.parse(xhr.responseText);

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
      form.style.display = "block";
    }
  };
}
