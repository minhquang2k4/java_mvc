package vn.minhquang.laptopshop.service;

import org.springframework.stereotype.Service;

import vn.minhquang.laptopshop.domain.User;
import vn.minhquang.laptopshop.repository.UserRepository;

@Service
public class UserService {

  private final UserRepository userRepository;

  public UserService(UserRepository userRepository) {
    this.userRepository = userRepository;
  }

  public User handleSaveUser(User user) {
    return this.userRepository.save(user);
  }
}
