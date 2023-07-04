<%-- 
    Document   : UpdateEmpInfo
    Created on : 4 Jul 2023, 1:20:28 am
    Author     : MUHAMMAD FAUZUL AZIM BIN IMRAN HAYAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee</title>
        <!-- Google Font: Source Sans Pro -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
        <!-- Custom CSS -->
        <style>
            html, body {
                height: 100%;
                margin: 0;
                padding: 0;
            }

            .page-content {
                margin: 20px;
                padding: 20px;
            }

            .card-title {
                font-size: 24px;
                margin-bottom: 20px;
            }

            .card-title .fas {
                margin-right: 10px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                font-weight: bold;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }
            .input-group {
                position: relative;
                display: flex;
                flex-wrap: wrap;
                align-items: stretch;
                width: 100%;
            }

            .input-group .form-select {
                flex-grow: 1;
                border-radius: 5px;
                border: 1px solid #ccc;
                padding: 10px;
                font-size: 16px;
            }

            .input-group .form-select:disabled {
                background-color: #f8f9fa;
                cursor: not-allowed;
            }
        </style>
        <script>
            function toggleEdit() {
                var inputs = document.querySelectorAll('.form-group input');
                var occupationInput = document.getElementById('Occupation');
                var occupationSelect = document.getElementById('occupation');
                var submitButton = document.getElementById('submitButton');

                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].id !== "empId" && inputs[i].id !== "occupation") {
                        inputs[i].readOnly = !inputs[i].readOnly;
                    }
                }

                if (occupationInput.style.display === "none") {
                    occupationInput.style.display = "block";
                    occupationSelect.style.display = "none";
                } else {
                    occupationInput.style.display = "none";
                    occupationSelect.style.display = "block";

                    // Set the default selected option in the "occupation" select element
                    var selectedValue = occupationInput.value;
                    var options = occupationSelect.options;
                    for (var j = 0; j < options.length; j++) {
                        if (options[j].value === selectedValue) {
                            occupationSelect.selectedIndex = j;
                            break;
                        }
                    }
                }

                submitButton.style.display = submitButton.style.display === "none" ? "block" : "none";
            }
        </script>

    </head>
    <body>
        <%@include file="header.jsp" %>
        <!-- Page Content -->
        <div class="page-content">
            <h3>Employee Information</h3>
            <hr>
            <div class="container my-4">
                <div class="card my-4">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h3 class="card-title"><i class="fas fa-file"></i>Employee Information</h3>
                            <button onclick="toggleEdit()" class="btn btn-primary">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                        </div>
                        <form action="update" method="post">
                            <div class="form-group">
                                <label for="empId">Employee ID:</label>
                                <input type="text" id="empId" name="empId" value="${existingEmp.employeeId}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="empName">Name:</label>
                                <input type="text" id="empName" name="empName" value="${existingEmp.name}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="empUsername">Username:</label>
                                <input type="text" id="empUsername" name="username" value="${existingEmp.username}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" value="${existingEmp.password}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="email">Email:</label>
                                <input type="email" id="email" name="email" value="${existingEmp.email}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="phone">Phone No:</label>
                                <input type="tel" id="phone" name="phone" value="${existingEmp.phone}" pattern="[0-9]{10,11}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="Occupation">Occupation:</label>
                                <input type="text" id="Occupation" value="${existingEmp.occupation}" readonly><br/>
                                <select id="occupation" name="occupation" class="form-select" style="display: none;">
                                    <option value="Rider">Rider</option>
                                    <option value="Receptionist">Receptionist</option>
                                    <option value="Manager">Manager</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary" id="submitButton" style="display: none;">
                                <i class="fas fa-check"></i> Save
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Scripts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
