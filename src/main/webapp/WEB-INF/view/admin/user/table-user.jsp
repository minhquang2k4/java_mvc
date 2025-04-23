<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User Management</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" href="/css/table-user.css">

</head>
<body>
  <div class="container">
    <div class="content-container">
      <div class="page-header">
        <h2 class="fw-bold mb-0">
          <i class="bi bi-people-fill me-2"></i>User Management
          <span class="user-count">${totalItems} users</span>
        </h2>
        <a href="/admin/user/create" class="btn btn-primary">
          <i class="bi bi-person-plus-fill me-1"></i> Add New User
        </a>
      </div>
      
      <div class="search-container">
        <div class="input-group">
          <span class="input-group-text"><i class="bi bi-search"></i></span>
          <input type="text" class="form-control" id="searchInput" placeholder="Search users...">
        </div>
        <button class="btn btn-outline-secondary" type="button" id="clearSearch">Clear</button>
      </div>
      
      <div class="table-responsive">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th scope="col" style="width: 10%">ID</th>
              <th scope="col" style="width: 30%">Email</th>
              <th scope="col" style="width: 30%">Full Name</th>
              <th scope="col" style="width: 30%">Actions</th>
            </tr>
          </thead>
          <tbody id="userTableBody">
            <c:forEach var="user" items="${users}">
              <tr>
                <td>${user.id}</td>
                <td>${user.email}</td>
                <td>
                  <div class="d-flex align-items-center">
                    <div class="user-initial me-2">
                      ${fn:substring(user.fullname, 0, 1)}
                    </div>
                    ${user.fullname}
                  </div>
                </td>
                <td>
                  <div class="action-buttons">
                    <a href="/admin/user/view/${user.id}" class="btn btn-view">
                      <i class="bi bi-eye"></i> View
                    </a>
                    <a href="/admin/user/edit/${user.id}" class="btn btn-edit">
                      <i class="bi bi-pencil"></i> Edit
                    </a>
                    <a href="#" class="btn btn-delete" data-bs-toggle="modal" data-bs-target="#deleteModal" 
                       data-user-id="${user.id}" data-user-name="${user.fullname}">
                      <i class="bi bi-trash"></i> Delete
                    </a>
                  </div>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        
        <c:if test="${empty users}">
          <div class="empty-state">
            <i class="bi bi-person-x"></i>
            <h4>No Users Found</h4>
            <p>There are no users in the system yet. Click "Add New User" to create one.</p>
          </div>
        </c:if>
      </div>
      
      <div class="d-flex justify-content-between align-items-center mt-3">
        <div>
          <select class="form-select" id="pageSizeSelect" onchange="changePageSize()">
            <option value="10" ${pageSize == 10 ? 'selected' : ''}>10 rows</option>
            <option value="20" ${pageSize == 20 ? 'selected' : ''}>20 rows</option>
            <option value="50" ${pageSize == 50 ? 'selected' : ''}>50 rows</option>
            <option value="100" ${pageSize == 100 ? 'selected' : ''}>100 rows</option>
          </select>
        </div>
        
        <nav aria-label="Page navigation">
          <ul class="pagination mb-0">
            <li class="page-item ${currentPage <= 0 ? 'disabled' : ''}">
              <a class="page-link" href="${currentPage <= 0 ? '#' : '/admin/user?page='.concat(currentPage-1).concat('&size=').concat(pageSize)}" 
                tabindex="${currentPage <= 0 ? '-1' : '0'}" aria-disabled="${currentPage <= 0 ? 'true' : 'false'}">Previous</a>
            </li>
            
            <c:if test="${totalPages > 0}">
              <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                <c:choose>
                  <c:when test="${loop.index == currentPage}">
                    <li class="page-item active"><a class="page-link" href="#">${loop.index + 1}</a></li>
                  </c:when>
                  <c:otherwise>
                    <li class="page-item">
                      <a class="page-link" href="/admin/user?page=${loop.index}&size=${pageSize}">${loop.index + 1}</a>
                    </li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
            </c:if>
            
            <li class="page-item ${currentPage >= totalPages - 1 ? 'disabled' : ''}">
              <a class="page-link" href="${currentPage >= totalPages - 1 ? '#' : '/admin/user?page='.concat(currentPage+1).concat('&size=').concat(pageSize)}" 
                tabindex="${currentPage >= totalPages - 1 ? '-1' : '0'}" aria-disabled="${currentPage >= totalPages - 1 ? 'true' : 'false'}">Next</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
  
  <!-- Delete Confirmation Modal -->
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="deleteModalLabel">Delete User</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Are you sure you want to delete user <strong id="userName"></strong>? This action cannot be undone.
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
          <form action="/admin/user/delete" method="post" id="deleteForm">
            <input type="hidden" name="userId" id="userId">
            <button type="submit" class="btn btn-danger">Delete</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script>
    // Handle search functionality
    document.getElementById('searchInput').addEventListener('keyup', function() {
      const searchValue = this.value.toLowerCase();
      const tableRows = document.querySelectorAll('#userTableBody tr');
      
      tableRows.forEach(row => {
        const email = row.cells[1].textContent.toLowerCase();
        const fullName = row.cells[2].textContent.toLowerCase();
        
        if (email.includes(searchValue) || fullName.includes(searchValue)) {
          row.style.display = '';
        } else {
          row.style.display = 'none';
        }
      });
    });
    
    // Clear search
    document.getElementById('clearSearch').addEventListener('click', function() {
      document.getElementById('searchInput').value = '';
      const tableRows = document.querySelectorAll('#userTableBody tr');
      tableRows.forEach(row => {
        row.style.display = '';
      });
    });
    
    // Handle delete modal
    const deleteModal = document.getElementById('deleteModal');
    deleteModal.addEventListener('show.bs.modal', function(event) {
      const button = event.relatedTarget;
      const userId = button.getAttribute('data-user-id');
      console.log("🚀 ~ deleteModal.addEventListener ~ userId:", userId)
      const userName = button.getAttribute('data-user-name');
      
      document.getElementById('userName').textContent = userName;
      document.getElementById('deleteForm').action = `/admin/user/delete/${userId}`;
    });

    // Change page size
    function changePageSize() {
      const newSize = document.getElementById('pageSizeSelect').value;
      window.location.href = '/admin/user?page=0&size=' + newSize;
    }
  </script>
</body>
</html>