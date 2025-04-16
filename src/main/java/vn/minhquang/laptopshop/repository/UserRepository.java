package vn.minhquang.laptopshop.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import vn.minhquang.laptopshop.domain.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
  User save(User user);
}
