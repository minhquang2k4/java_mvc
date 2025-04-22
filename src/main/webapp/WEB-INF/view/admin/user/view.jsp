<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>View User</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
    body {
      background-color: #f8f9fa;
    }
    .user-container {
      background-color: #ffffff;
      border-radius: 10px;
      box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
      padding: 2rem;
      margin-top: 2rem;
      margin-bottom: 2rem;
    }
    .user-header {
      border-bottom: 2px solid #f1f1f1;
      margin-bottom: 1.5rem;
      padding-bottom: 1rem;
    }
    .btn-primary {
      background-color: #5a5a5a;
      border-color: #5a5a5a;
      padding: 0.5rem 2rem;
      font-weight: 500;
    }
    .btn-primary:hover {
      background-color: #4a4a4a;
      border-color: #4a4a4a;
    }
    .btn-warning {
      padding: 0.5rem 2rem;
      font-weight: 500;
    }
    .btn-danger {
      padding: 0.5rem 2rem;
      font-weight: 500;
    }
    .btn-secondary {
      padding: 0.5rem 2rem;
      font-weight: 500;
    }
    .user-avatar {
      width: 100px;
      height: 100px;
      background-color: #e9ecef;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 1rem auto;
      font-size: 2.5rem;
      color: #6c757d;
    }
    .user-info {
      background-color: #f8f9fa;
      border-radius: 8px;
      padding: 1.5rem;
      margin-bottom: 1.5rem;
    }
    .info-item {
      display: flex;
      margin-bottom: 1rem;
      align-items: center;
    }
    .info-item:last-child {
      margin-bottom: 0;
    }
    .info-icon {
      width: 40px;
      height: 40px;
      background-color: #e9ecef;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-right: 1rem;
      color: #6c757d;
    }
    .info-label {
      font-weight: 600;
      color: #495057;
      width: 80px;
    }
    .info-value {
      color: #212529;
      flex-grow: 1;
    }
    .user-actions {
      display: flex;
      justify-content: flex-end;
      gap: 10px;
      margin-top: 1.5rem;
    }
    .delete-btn:hover {
      background-color: #dc3545;
      border-color: #dc3545;
    }
  </style>
</head>
<body>
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
  
  <!-- Delete Confirmation Modal -->
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
</body>
</html>