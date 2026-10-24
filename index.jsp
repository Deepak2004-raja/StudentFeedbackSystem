<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Feedback System</title>

    <link rel="stylesheet"
      href="${pageContext.request.contextPath}/css/style.css">
    
</style>
</head>
<body>

    <div class="container">

        <h1>Student Feedback</h1>

        <p class="subtitle">
            Share your valuable feedback with us
        </p>

        <form action="feedback.jsp" method="post">

            <label for="studentName">Student Name</label>
            <input type="text" id="studentName"
                   name="studentName"
                   placeholder="Enter your full name"
                   required>

            <label for="teacherName">Teacher Name</label>
            <input type="text" id="teacherName"
                   name="teacherName"
                   placeholder="Enter teacher name"
                   required>

            <label for="feedback">Your Feedback</label>
            <textarea id="feedback"
                      name="feedback"
                      placeholder="Write your feedback here..."
                      required></textarea>

            <input type="submit" value="Submit Feedback">

        </form>

        <p class="link-text">
            Your feedback helps us improve.
        </p>

    </div>

</body>
</html>