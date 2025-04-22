package vn.minhquang.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import vn.minhquang.laptopshop.entity.UserEntity;
import vn.minhquang.laptopshop.repository.UserRepository;

@Service
public class UserService {

  private final UserRepository userRepository;

  public UserService(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  public UserEntity handleSaveUser(UserEntity user) {
    return this.userRepository.save(user);
  }

  public List<UserEntity> handleGetAllUsers() {
    return this.userRepository.findAll();
  }

  public List<UserEntity> handleGetAllUsersByEmail(String email) {
    return this.userRepository.findAllByEmail(email);
  }

  public Optional<UserEntity> handleGetUserById(Long id) {
    return this.userRepository.findById(id);
  }

  public void handleDeleteUser(Long id) {
    this.userRepository.deleteById(id);
  }

  public Page<UserEntity> handleGetAllUsersWithPagination(Pageable pageable) {
    return userRepository.findAll(pageable);
  }
}
