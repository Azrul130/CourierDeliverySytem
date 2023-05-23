<%-- 
    Document   : customerfeedback
    Created on : 23 May 2023, 13:58:46
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Feedback</title>
        <style>
            body {
                background-color: rgb(121, 252, 252);
            }

            label {
                width: 40%;
                display: inline-block;
                padding-left: 20px;
            }

            h3 {
                padding-left: 10px;
            }

            h1 {
                font-family: comic sans ms;
            }

            #container {
                margin-left: 10%;
                margin-right: 50%;
                width: 40%;
                background-color: #f56e6e;
                color: #000000;
                min-width: 40%;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            #button {
                text-align: center;
            }

            input[type=button],
            input[type=submit],
            input[type=reset] {
                background-color: aqua;
                border: none;
                color: black;
                padding: 16px 32px;
                text-decoration: none;
                margin: 4px 2px;
                cursor: pointer;
                background-color: rgb(121, 252, 252);
            }
        </style>
        
    </head>
    <body>
        <jsp:include flush="true" page="header.jsp" />
        <h1>Customer Feedback</h1>
        <div id="container">
            <form action="feedback_process.php" method="POST">
                <h3>Your Information:</h3>
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required><br><br>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br><br>

                <label for="phone">Phone Number:</label>
                <input type="tel" id="phone" name="phone" required><br><br>

                <h3>Feedback Details:</h3>

                <label for="rating">Rate your overall experience:</label>
                <select id="rating" name="rating" required>
                    <option value="excellent">Excellent</option>
                    <option value="good">Good</option>
                    <option value="average">Average</option>
                    <option value="poor">Poor</option>
                </select><br><br>

                <label for="comments">Comments or Suggestions:</label>
                <textarea id="comments" name="comments" rows="2" required></textarea><br><br>

                <h3>Additional Questions:</h3>
                <label for="recommendation">How likely are you to recommend our services to others?</label>
                <select id="recommendation" name="recommendation" required>
                    <option value="very-likely">Very Likely</option>
                    <option value="likely">Likely</option>
                    <option value="neutral">Neutral</option>
                    <option value="unlikely">Unlikely</option>
                    <option value="very-unlikely">Very Unlikely</option>
                </select><br><br>

                <label for="expectations">Did our services meet your expectations?</label>
                <select id="expectations" name="expectations" required>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                    <option value="somewhat">Somewhat</option>
                </select><br><br>

                <label for="satisfaction">How satisfied are you with our customer support?</label>
                <select id="satisfaction" name="satisfaction" required>
                    <option value="very-satisfied">Very Satisfied</option>
                    <option value="satisfied">Satisfied</option>
                    <option value="neutral">Neutral</option>
                    <option value="dissatisfied">Dissatisfied</option>
                    <option value="very-dissatisfied">Very Dissatisfied</option>
                </select><br><br>



                <div id="button">
                    <br>
                    <input type="submit" value="Submit">
                    <input type="reset" value="Cancel">
                    <br><br>
                </div>
            </form>
        </div>
        <jsp:include flush="true" page="footer.html" />
    </body>
</html>
