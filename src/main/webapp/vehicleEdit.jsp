<%-- 
    Document   : vehicleEdit
    Created on : 5 Jul 2023, 4:52:55 am
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
                var occupationInput = document.getElementById('VehicleType');
                var occupationSelect = document.getElementById('vehicleType');
                var submitButton = document.getElementById('submitButton');

                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].id !== "empId" && inputs[i].id !== "vehicleType") {
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
            <h3>Vehicle Information</h3>
            <hr>
            <div class="container my-4">
                <div class="card my-4">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h3 class="card-title"><i class="fas fa-file"></i>Vehicle Information</h3>
                            <button onclick="toggleEdit()" class="btn btn-primary">
                                <i class="fas fa-edit"></i> Edit
                            </button>
                        </div>
                        <form action="update" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="id" value="${existingVeh.vehicleId}" readonly />
                            <div class="form-group">
                                <label for="VehicleType" class="form-label">Vehicle Type</label>
                                <input type="text" id="VehicleType" value="${existingVeh.vehicleType}" readonly><br/>
                                <select class="form-control" id="vehicleType" name="vehicleType" style="display: none;" >
                                    <option value="Motorcycle">Motorcycle</option>
                                    <option value="Lorry">Lorry</option>
                                    <option value="Van">Van</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="roadTaxExp" class="form-label">Road Tax Expiry Date</label>
                                <input type="text" pattern="\d{2}/\d{2}/\d{2}" id="roadTaxExp" name="RoadTaxExp" value="${existingVeh.roadTaxExp}" readonly>
                            </div>
                            <div class="form-group">
                                <c:set var="base64Picture" value="${existingVeh.getPictureBase64()}"/>
                                <c:if test="${not empty base64Picture}">
                                    <img src="data:image/png;base64,${base64Picture}" width="100" height="100" />
                                </c:if>
                                <label for="picture" class="form-label">Picture</label>
                                <input type="file" class="form-control" id="picture" name="Picture" >
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
