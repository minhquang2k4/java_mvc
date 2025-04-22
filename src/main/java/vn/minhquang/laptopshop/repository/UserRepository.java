package vn.minhquang.laptopshop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.minhquang.laptopshop.entity.UserEntity;

@Repository
public interface UserRepository extends JpaRepository<UserEntity, Long> {
  UserEntity save(UserEntity user);
  List<UserEntity> findAll();
  List<UserEntity> findAllByEmail(String email);
  Optional<UserEntity> findById(Long id);
  void deleteById(Long id);
}
