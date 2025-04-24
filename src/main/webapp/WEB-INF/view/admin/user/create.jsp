<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>User Management</title>
  <link href="/css/styles.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" href="/css/create-user.css">
</head>

<body class="sb-nav-fixed">
  <jsp:include page="../layout/header.jsp" />
  <div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
      <main>
        <div class="container-fluid px-4">
          <h1 class="mt-4">User</h1>
          <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">User / Create</li>
          </ol>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-md-8 col-lg-6 form-container">
                <div class="form-header text-center">
                  <h2 class="fw-bold"><i class="bi bi-person-plus-fill me-2"></i>Create New User</h2>
                  <p class="text-muted">Please fill in the user details below</p>
                </div>
        
                <form action="/admin/user/create" method="post" enctype="multipart/form-data">
                  <div class="row mb-4">
                    <div class="col-md-6">
                      <label for="fullname" class="form-label">Full Name</label>
                      <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Enter full name" required>
                      </div>
                    </div>
                
                    <div class="col-md-6">
                      <label for="email" class="form-label">Email Address</label>
                      <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email address" required>
                      </div>
                    </div>
                  </div>
                
                  <div class="row mb-4">
                    <div class="col-md-6">
                      <label for="password" class="form-label">Password</label>
                      <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
                        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                          <i class="bi bi-eye" id="toggleIcon"></i>
                        </button>
                      </div>
                      <div class="form-text">Password must be at least 8 characters long</div>
                    </div>
                
                    <div class="col-md-6">
                      <label for="avatar" class="form-label">Avatar</label>
                      <div class="input-group">
                        <input type="file" class="form-control" id="avatar" name="avatar" accept="image/*">
                      </div>
                      <div class="form-text">Please choose an image file for the avatar</div>
                    </div>
                  </div>
                
                  <div class="row mb-4">
                    <div class="col-md-6">
                      <label for="address" class="form-label">Address</label>
                      <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-geo-alt"></i></span>
                        <input type="text" class="form-control" id="address" name="address" placeholder="Enter address">
                      </div>
                    </div>
                
                    <div class="col-md-6">
                      <label for="phone" class="form-label">Phone Number</label>
                      <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-telephone"></i></span>
                        <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter phone number">
                      </div>
                    </div>
                  </div>
                
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <a href="/admin/user" class="btn btn-outline-secondary me-md-2">Cancel</a>
                    <button type="submit" class="btn btn-primary">Create User</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </main>
      <jsp:include page="../layout/footer.jsp" />
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="/js/scripts.js"></script>
  <script>
    // Toggle password visibility
    document.getElementById('togglePassword').addEventListener('click', function () {
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
  </script>
</body>

</html>