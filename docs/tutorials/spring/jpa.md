1. use only the methods available in JpaRepository.
2. write a plain JPA code by using an injected EntityManagerFactory or EntityManager @PersistenceUnit and @PersistenceContext.
- @PersistenceUnit EntityManagerFactory always creates a new EntityManager through the factory and it is your responsibility to close it. and
You can avoid this by requesting a transactional EntityManager using @PersistenceContext EntityManager
(also called "shared EntityManager" because it is a shared, thread-safe proxy for the actual transactional EntityManager) to be injected instead of the factory.
The injected EntityManager is Spring-managed.
3. Customizing Individual Repositories
- Implements interface for custom repository functionality.
- Implementation of custom repository functionality by class end with Impl and implements the above interface.
Example:

```java
interface HumanRepository {
  void someHumanMethod(User user);
}

class HumanRepositoryImpl implements HumanRepository {

  public void someHumanMethod(User user) {
    // Your custom implementation
  }
}

interface ContactRepository {

  void someContactMethod(User user);

  User anotherContactMethod(User user);
}

class ContactRepositoryImpl implements ContactRepository {

  public void someContactMethod(User user) {
    // Your custom implementation
  }

  public User anotherContactMethod(User user) {
    // Your custom implementation
  }
}

interface UserRepository extends CrudRepository<User, Long>, HumanRepository, ContactRepository {

  // Declare query methods here
}
```

4. Customize the Base Repository
- add a custom method that's available in all the repositories.
- extends SimpleJpaRepository and implements your extended interface by a class end with Impl
- we create a constructor with the JpaEntityInformation and EntityManager parameters that calls the constructor from the parent class.
- Tell Spring to use our custom class instead of the default one for building repository implementations, we can use the repositoryBaseClass attribute in @EnableJpaRepositories annotation.
- Example:
- Custom repository base class:

```java
class MyRepositoryImpl<T, ID> extends SimpleJpaRepository<T, ID> {
    private final EntityManager entityManager;
    MyRepositoryImpl(JpaEntityInformation entityInformation, EntityManager entityManager) {
        super(entityInformation, entityManager);
        // Keep the EntityManager around to used from the newly introduced methods.
        this.entityManager = entityManager;
    }
    @Transactional
    public <S extends T> S save(S entity) {
        // implementation goes here
    }
}
```

- The class needs to have a constructor of the super class which the store-specific repository factory implementation uses.
If the repository base class has multiple constructors, override the one taking an EntityInformation plus a store specific infrastructure object
(such as an EntityManager or a template class).
- The final step is to make the Spring Data infrastructure aware of the customized repository base class. In Java configuration, you can do so by using
the repositoryBaseClass attribute of the @Enable${store}Repositories annotation, as shown in the following example:

```java
// Configuring a custom repository base class using JavaConfig
@Configuration
@EnableJpaRepositories(repositoryBaseClass = MyRepositoryImpl.class)
class ApplicationConfiguration { … }
```

- notes
    - Spring Data JPA can handle most of DTO projection for you. You just need to define an interface and use it as the return type of your repository method.
    Spring Data JPA then takes care of the rest.

