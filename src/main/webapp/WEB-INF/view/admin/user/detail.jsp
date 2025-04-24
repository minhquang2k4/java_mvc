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

  <link rel="stylesheet" href="/css/view-user.css">
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
            <li class="breadcrumb-item active">User / View</li>
          </ol>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-md-8 col-lg-6 user-container">
                <div class="user-header text-center">
                  <div class="user-avatar" id="userAvatar">
                    <i class="bi bi-person"></i>
                  </div>
                  <h2 class="fw-bold">${user.fullname}</h2>
                  <p class="text-muted">User ID: ${user.id}</p>
                </div>
                
                <div class="user-info">
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="bi bi-envelope"></i>
                    </div>
                    <div class="info-label">Email:</div>
                    <div class="info-value">${user.email}</div>
                  </div>
                  
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="bi bi-geo-alt"></i>
                    </div>
                    <div class="info-label">Address:</div>
                    <div class="info-value">
                      <c:choose>
                        <c:when test="${empty user.address}">
                          <span class="text-muted">Not provided</span>
                        </c:when>
                        <c:otherwise>
                          ${user.address}
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </div>
                  
                  <div class="info-item">
                    <div class="info-icon">
                      <i class="bi bi-telephone"></i>
                    </div>
                    <div class="info-label">Phone:</div>
                    <div class="info-value">
                      <c:choose>
                        <c:when test="${empty user.phone}">
                          <span class="text-muted">Not provided</span>
                        </c:when>
                        <c:otherwise>
                          ${user.phone}
                        </c:otherwise>
                      </c:choose>
                    </div>
                  </div>
                </div>
                
                <div class="user-actions">
                  <a href="/admin/user" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-1"></i> Back
                  </a>
                  <a href="/admin/user/edit/${user.id}" class="btn btn-warning">
                    <i class="bi bi-pencil-square me-1"></i> Edit
                  </a>
                  <a href="#" class="btn btn-outline-danger delete-btn" 
                     data-bs-toggle="modal" data-bs-target="#deleteModal">
                    <i class="bi bi-trash me-1"></i> Delete
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <p>Are you sure you want to delete user <strong>${user.fullname}</strong>?</p>
                  <p class="text-danger">This action cannot be undone.</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                  <a href="/admin/user/delete/${user.id}" class="btn btn-danger">Delete User</a>
                </div>
              </div>
            </div>
          </div>
        
          <script>
            // Initialize first letter avatar if no image
            document.addEventListener('DOMContentLoaded', function() {
              const userAvatar = document.getElementById('userAvatar');
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
        </div>
      </main>
      <jsp:include page="../layout/footer.jsp" />
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="/js/scripts.js"></script>
</body>

</html>


