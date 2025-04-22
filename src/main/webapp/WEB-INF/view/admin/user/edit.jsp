<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit User</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" href="/css/edit-user.css">

</head>
<body>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8 col-lg-6 form-container">
        <div class="form-header text-center">
          <div class="user-avatar">
            <i class="bi bi-person"></i>
          </div>
          <h2 class="fw-bold"><i class="bi bi-pencil-square me-2"></i>Edit User</h2>
          <p class="text-muted">Update user information below</p>
        </div>
        
        <form action="/admin/user/edit/${user.id}" method="post">
          <div class="mb-4">
            <label for="fullname" class="form-label">Full Name</label>
            <div class="input-group">
              <span class="input-group-text"><i class="bi bi-person"></i></span>
              <input type="text" class="form-control" id="fullname" name="fullname" value="${user.fullname}" required>
            </div>
          </div>
          
          <div class="mb-4">
            <label for="email" class="form-label">Email Address</label>
            <div class="input-group">
              <span class="input-group-text"><i class="bi bi-envelope"></i></span>
              <input type="email" class="form-control" id="email" name="email" value="${user.email}" required>
            </div>
          </div>
          
          <div class="mb-4">
            <label for="password" class="form-label">Password</label>
            <div class="input-group">
              <span class="input-group-text"><i class="bi bi-lock"></i></span>
              <input type="password" class="form-control" id="password" name="password" value="${user.password}" required>
              <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                <i class="bi bi-eye" id="toggleIcon"></i>
              </button>
            </div>
            <div class="form-text">Leave unchanged to keep current password</div>
          </div>
          
          <div class="mb-4">
            <label for="address" class="form-label">Address</label>
            <div class="input-group">
              <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
              <input type="text" class="form-control" id="address" name="address" value="${user.address}">
            </div>
          </div>
          
          <div class="mb-4">
            <label for="phone" class="form-label">Phone Number</label>
            <div class="input-group">
              <span class="input-group-text"><i class="bi bi-telephone"></i></span>
              <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
            </div>
          </div>
          
          <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
            <a href="/admin/user" class="btn btn-secondary me-md-2">Cancel</a>
            <button type="submit" class="btn btn-primary">Update User</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script>
    // Toggle password visibility
    document.getElementById('togglePassword').addEventListener('click', function() {
      const passwordInput = document.getElementById('password');
      const toggleIcon = document.getElementById('toggleIcon');
      
      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        toggleIcon.classList.remove('bi-eye');
        toggleIcon.classList.add('bi-eye-slash');
      } else {
        passwordInput.type = 'password';
        toggleIcon.classList.remove('bi-eye-slash');
        toggleIcon.classList.add('bi-eye');
      }
    });

    // Initialize first letter avatar if no image
    document.addEventListener('DOMContentLoaded', function() {
      const userAvatar = document.querySelector('.user-avatar');
      const fullName = "${user.fullname}";
      
      if (fullName && fullName.length > 0) {
        const initials = fullName.split(' ')
          .map(name => name.charAt(0))
          .join('')
          .toUpperCase()
          .substring(0, 2);
        
        userAvatar.innerHTML = initials;
      }
    });
  </script>
</body>
</html>